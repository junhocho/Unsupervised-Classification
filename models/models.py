"""
Authors: Wouter Van Gansbeke, Simon Vandenhende
Licensed under the CC BY-NC 4.0 license (https://creativecommons.org/licenses/by-nc/4.0/)
"""
import torch
import torch.nn as nn
import torch.nn.functional as F


class ContrastiveModel(nn.Module):
    def __init__(self, backbone, head='mlp', features_dim=128, L2Norm=True):
        super(ContrastiveModel, self).__init__()
        self.backbone = backbone['backbone']
        self.backbone_dim = backbone['dim']
        self.head = head
        self.L2Norm = L2Norm
 
        if head == 'linear':
            self.contrastive_head = nn.Linear(self.backbone_dim, features_dim)

        elif head == 'mlp':
            self.contrastive_head = nn.Sequential(
                    nn.Linear(self.backbone_dim, self.backbone_dim),
                    nn.ReLU(), nn.Linear(self.backbone_dim, features_dim))
        
        else:
            raise ValueError('Invalid head {}'.format(head))

    def forward(self, x):
        features = self.contrastive_head(self.backbone(x))
        if self.L2Norm:
            features = F.normalize(features, dim = 1) ## XXX : disabled L2 Norm
        return features

class HypContrastiveModel(nn.Module):
    def __init__(self, backbone, head='mlp', features_dim=128, L2Norm=True):
        super(HypContrastiveModel, self).__init__()
        self.backbone = backbone['backbone']
        self.backbone_dim = backbone['dim']
        self.head = head
        self.L2Norm = L2Norm
 
        if head == 'linear':
            self.contrastive_head = nn.Linear(self.backbone_dim, features_dim)

        elif head == 'mlp':
            self.contrastive_head = nn.Sequential(
                    nn.Linear(self.backbone_dim, self.backbone_dim),
                    nn.ReLU(), nn.Linear(self.backbone_dim, features_dim))
        
        else:
            raise ValueError('Invalid head {}'.format(head))

        import hyptorch.nn as hypnn
        class atdict(dict):
            __getattr__= dict.__getitem__
            __setattr__= dict.__setitem__
            __delattr__= dict.__delitem__
        hypargs = atdict()
        hypargs.c = 1.0
        hypargs.train_x = False
        hypargs.train_c = False
        self.tp = hypnn.ToPoincare(
                c=hypargs.c, train_x=hypargs.train_x, train_c=hypargs.train_c
                )


    def forward(self, x):
        features = self.contrastive_head(self.backbone(x))
        if self.L2Norm:
            features = F.normalize(features, dim = 1) ## XXX : disabled L2 Norm
        features = self.tp(features)   ### XXX : Poincare
        return features


class ClusteringModel(nn.Module):
    def __init__(self, backbone, nclusters, nheads=1):
        super(ClusteringModel, self).__init__()
        self.backbone = backbone['backbone']
        self.backbone_dim = backbone['dim']
        self.nheads = nheads
        assert(isinstance(self.nheads, int))
        assert(self.nheads > 0)
        self.cluster_head = nn.ModuleList([nn.Linear(self.backbone_dim, nclusters) for _ in range(self.nheads)])

    def forward(self, x, forward_pass='default'):
        if forward_pass == 'default':
            features = self.backbone(x)
            out = [cluster_head(features) for cluster_head in self.cluster_head]

        elif forward_pass == 'backbone':
            out = self.backbone(x)

        elif forward_pass == 'head':
            out = [cluster_head(x) for cluster_head in self.cluster_head]

        elif forward_pass == 'return_all':
            features = self.backbone(x)
            out = {'features': features, 'output': [cluster_head(features) for cluster_head in self.cluster_head]}
        
        else:
            raise ValueError('Invalid forward pass {}'.format(forward_pass))        

        return out

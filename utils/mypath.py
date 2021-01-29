"""
Authors: Wouter Van Gansbeke, Simon Vandenhende
Licensed under the CC BY-NC 4.0 license (https://creativecommons.org/licenses/by-nc/4.0/)
"""
import os


class MyPath(object):
    @staticmethod
    def db_root_dir(database=''):
        db_names = {'cifar-10', 'stl-10', 'cifar-20', 'imagenet', 'imagenet_50', 'imagenet_100', 'imagenet_200'}
        assert(database in db_names)

        if database == 'cifar-10':
            return '/home/junho/data/Image_Clustering/cifar-10'
        
        elif database == 'cifar-20':
            return '/home/junho/data/Image_Clustering/cifar-20'

        elif database == 'stl-10':
            return '/home/junho/data/Image_Clustering/stl-10'
        
        elif database in ['imagenet', 'imagenet_50', 'imagenet_100', 'imagenet_200']:
            return '/disk2/ILSVRC12'
        
        else:
            raise NotImplementedError

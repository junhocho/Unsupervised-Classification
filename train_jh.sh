# conda activate SCAN


# Imagenet only in ResNet50
# python simclr.py --config_env configs/env.yml --config_exp configs/pretext/simclr_imagenet200.yml

# simclr in STL10 setting. Include hyp layer
# 1. add hyp layer in resnet.
# export CUDA_VISIBLE_DEVICES=3
# python simclr.py --config_env configs/hypenv.yml --config_exp configs/pretext/hypsimclr_stl10.yml

export CUDA_VISIBLE_DEVICES=2
python simclr.py --config_env configs/hypenv.yml --config_exp configs/pretext/hypsimclr_cifar20.yml



## DOWNLOADING???
# python scan.py --config_env configs/env.yml --config_exp configs/scan/scan_imagenet_200.yml
# python selflabel.py --config_env configs/env.yml --config_exp configs/selflabel/selflabel_imagenet_200.yml


# MODEL_PATH_IMAGENET=/home/junho/Image_Clustering/SCAN_Model_Zoo/imagenet.pth.tar
# export CUDA_VISIBLE_DEVICES=1
# # python eval.py --config_exp configs/scan/imagenet_eval.yml --model $MODEL_PATH_IMAGENET
# python eval.py --config_exp configs/scan/imagenet_eval.yml --model $MODEL_PATH_IMAGENET --visualize_prototypes

# conda activate SCAN

python simclr.py --config_env configs/env.yml --config_exp configs/pretext/simclr_cifar10.yml
# python scan.py --config_env configs/env.yml --config_exp configs/scan/scan_cifar10.yml
# python selflabel.py --config_env configs/env.yml --config_exp configs/selflabel/selflabel_cifar10.yml


# MODEL_PATH_IMAGENET=/home/junho/Image_Clustering/SCAN_Model_Zoo/imagenet.pth.tar
# export CUDA_VISIBLE_DEVICES=1
# # python eval.py --config_exp configs/scan/imagenet_eval.yml --model $MODEL_PATH_IMAGENET
# python eval.py --config_exp configs/scan/imagenet_eval.yml --model $MODEL_PATH_IMAGENET --visualize_prototypes

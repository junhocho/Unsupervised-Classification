# conda activate SCAN


# export CUDA_VISIBLE_DEVICES=1,2,3
# python moco.py --config_env configs/env.yml --config_exp configs/pretext/moco_imagenet50.yml
## DOWNLOADING???
# python scan.py --config_env configs/env.yml --config_exp configs/scan/scan_imagenet_50.yml
python selflabel.py --config_env configs/env.yml --config_exp configs/selflabel/selflabel_imagenet_50.yml


# MODEL_PATH_IMAGENET=/home/junho/Image_Clustering/SCAN_Model_Zoo/imagenet.pth.tar
# export CUDA_VISIBLE_DEVICES=1
# # python eval.py --config_exp configs/scan/imagenet_eval.yml --model $MODEL_PATH_IMAGENET
# python eval.py --config_exp configs/scan/imagenet_eval.yml --model $MODEL_PATH_IMAGENET --visualize_prototypes

# conda activate SCAN

export CUDA_VISIBLE_DEVICES=0
python simclr.py --config_env configs/env.yml --config_exp configs/pretext/simclr_cifar20.yml
# python scan.py --config_env configs/env.yml --config_exp configs/scan/scan_cifar20.yml
# python selflabel.py --config_env configs/env.yml --config_exp configs/selflabel/selflabel_cifar20.yml

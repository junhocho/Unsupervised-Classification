# conda activate SCAN

export CUDA_VISIBLE_DEVICES=2
# python simclr.py --config_env configs/env.yml --config_exp configs/pretext/simclr_stl10.yml
python simclr.py --config_env configs/hypenv.yml --config_exp configs/pretext/hypsimclr_stl10.yml --description 


# python scan.py --config_env configs/env.yml --config_exp configs/scan/scan_stl10.yml


# # Selflabel do dataparallel,  disable CUDA_VISIBLE_DEVICES
# python selflabel.py --config_env configs/env.yml --config_exp configs/selflabel/selflabel_stl10.yml

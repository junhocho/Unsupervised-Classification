# conda activate SCAN

export CUDA_VISIBLE_DEVICES=1
python simclr.py --config_env configs/env.yml --config_exp configs/pretext/simclr_stl10.yml
# python scan.py --config_env configs/env.yml --config_exp configs/scan/scan_stl10.yml
# python selflabel.py --config_env configs/env.yml --config_exp configs/selflabel/selflabel_stl10.yml

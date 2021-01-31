conda create -n SCAN


conda install pytorch=1.4.0 torchvision=0.5.0 cudatoolkit=10.0 -c pytorch -y
conda install matplotlib scipy scikit-learn -y   # For evaluation and confusion matrix visualization
pip install faiss-gpu



conda install pyyaml  -y
pip install  easydict                 # For using config files
conda install termcolor -y

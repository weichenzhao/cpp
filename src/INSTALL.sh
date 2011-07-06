#!/bin/sh
# These instructions assume a raw Ubuntu 11.04 server VM,
# but should work on any unix-ish system with sudo.
# git clone git@gitosis.stanford.edu:cc.git

sudo apt-get install -y ssh git

echo "Installing setuptools, which simplifies Python package installation."
sudo apt-get install -y python-setuptools

echo "Installing networkx, a pure-Python library for graph manipulation."
sudo easy_install networkx

echo "Installing Matploblib + Basemap (for topology maps)."
sudo apt-get install -y python-matplotlib python-numpy libgeos-dev python-httplib2 python-imaging python-dev 
wget http://sourceforge.net/projects/matplotlib/files/matplotlib-toolkits/basemap-1.0.1/basemap-1.0.1.tar.gz/download
mv download basemap-1.0.1.tar.gz
tar xvzf basemap-1.0.1.tar.gz
cd basemap-1.0.1/
sudo python setup.py install
cd ..

# Should be fixed in the code, but for now this'll do:
cd src
mkdir -p data_out data_vis geo

./make_paper.sh
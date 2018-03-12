#!/bin/bash
# Fail the script immediately when any command fails.
set -e

cd /code/document-preprocessing-toolkit
pip install ./background-estimation ./border-removal ./new_binarization_toolkit ./stable_paths_toolkit ./staffline-removal
pip install ./lyric-extraction

pip install svn+svn://svn.code.sf.net/p/music-staves/code/
pip install /code/rodan_plugins

# Install LibMEI.
cd /code/libmei/tools
pip install lxml
python parseschema2.py neumes_and_layout_compiled.xml -o src -l cpp 
python parseschema2.py neumes_and_layout_compiled.xml -o src -l python 
rm -rf ../src/modules/*
rm -rf ../python/pymei/Modules/*
mv src/cpp/* ../src/modules/
mv src/python/* ../python/pymei/Modules/
cd /code/libmei
cmake .
make && make install

# Install the LibMEI Python bindings.
cd /code/libmei/python
# Manually patch pymei's setup.py because boost.python dropped the -mt suffix of its libraries several years ago.
# See https://github.com/DDMAL/libmei/issues/81.
sed -i 's/boost_python-mt/boost_python/g' setup.py
pip install .

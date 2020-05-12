#!/bin/sh

# do build prep
mkdir -p build
# Copy files necessary for build
cp -r deploy ./build
cp -r material ./build
cp MANIFEST.in ./build
cp package.json ./build
cp requirements.txt ./build
cp setup.py ./build
cp Dockerfile ./build

cd build
docker build -t yakworks/docmark .
#docker push dock9/pages:rndc
# -it --rm

#!/bin/sh

BUILD_DIR=build
# do build prep
mkdir -p $BUILD_DIR
# Copy files necessary for build
cp -r deploy $BUILD_DIR
cp -r material $BUILD_DIR
cp MANIFEST.in $BUILD_DIR
cp package.json $BUILD_DIR
cp requirements.txt $BUILD_DIR
cp setup.py $BUILD_DIR
cp Dockerfile $BUILD_DIR

cd $BUILD_DIR
docker build -t yakworks/docmark .

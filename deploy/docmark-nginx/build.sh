#!/bin/sh
cd deploy/docmark-nginx
docker build -t yakworks/docmark-nginx .
#docker push yakworks/docmark-nginx 

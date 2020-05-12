#!/bin/sh
set -e

/opt/docmark/yml-merge.py
sed -i 's|python/name|!!python/name|g' build/mkdocs.yml

# cmd="ls -la"
# $cmd &

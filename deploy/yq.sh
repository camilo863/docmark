#!/bin/sh
#play ground for yq
NOINDEX=$(yq r build/mkdocs.yml extra.palette)

[ ! -z "$NOINDEX" ] && echo "noindex = ${NOINDEX}" || echo "noindex NULL"

yq w build/mkdocs.yml "markdown_extensions[+]" "bar thing"

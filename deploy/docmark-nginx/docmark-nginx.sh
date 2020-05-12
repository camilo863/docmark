#!/bin/sh

#set -e
#GITHUB_PROJECT="$GITHUB_OWNER/$GITHUB_REPO"
#ENV VARS THAT SHOULD BE SET
#GITHUB_PROJECT GITHUB_BRANCH GITHUB_TOKEN
GITHUB_BASE_URL="github.com/$GITHUB_PROJECT.git"
#GRGIT_USER should be in env
GITHUB_URL="https://dummy:${GITHUB_TOKEN}@$GITHUB_BASE_URL"

# clone to /site
git clone $GITHUB_URL git-project -b $GITHUB_BRANCH --single-branch --depth 1
cd git-project

echo "--- building mkdocs site --"
docmark build
cp -r ./build/site /site

#call the nginx script
/opt/nginx-entry.sh


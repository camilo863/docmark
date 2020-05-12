# examples for running the docker
# pulls the github token from GRGIT_USER
docker run -it --rm \
-p 8000:80 \
-e GITHUB_PROJECT='9ci/go-rndc' \
-e GITHUB_BRANCH='master' \
-e GITHUB_TOKEN=$GRGIT_USER \
yakworks/docmark-nginx

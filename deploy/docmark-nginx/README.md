docker that can be used in kubernetes.
will download from github and build into the site directory to be served by nginx

```bash
docker run -it \
-p 80:80 \
-e GITHUB_PROJECT='yakworks/docmark' \
-e GITHUB_BRANCH='master' \
-e GITHUB_TOKEN='87ef1...' \
yakworks/docmark
```

FROM yakworks/nginx-python

# installs yq, https://github.com/mikefarah/yq
# COPY --from=mikefarah/yq:3.3.0 /usr/bin/yq /usr/bin/yq
# RUN chmod +x /usr/bin/yq

# git to download, gettext for envsubst command, apache2-utils for htpasswd.
RUN apk update && apk add --no-cache \
	git sed make inotify-tools && \
  rm -rf /var/cache/apk/*

# Set build directory
WORKDIR /tmp

COPY requirements.txt requirements.txt
RUN pip install -r requirements.txt

# install the yml merge tool
RUN pip install HiYaPyCo

# Copy files necessary for build
COPY material material
COPY MANIFEST.in MANIFEST.in
COPY package.json package.json
COPY setup.py setup.py

# Perform build and cleanup artifacts
RUN pip install --no-cache-dir . && \
  rm -rf /tmp/*

COPY deploy/yml-merge.py deploy/yml-merge.sh /opt/docmark/
COPY deploy/mkdocs-defaults.yml /opt/docmark/
COPY deploy/docmark /usr/local/bin/

# Set working directory
WORKDIR /project

# Expose MkDocs development server port
EXPOSE 8000

# Start development server by default
ENTRYPOINT ["docmark"]
CMD ["serve", "--dev-addr=0.0.0.0:8000"]

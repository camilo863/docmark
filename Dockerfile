FROM yakworks/nginx-python

# installs yq, https://github.com/mikefarah/yq
COPY --from=mikefarah/yq:3.3.0 /usr/bin/yq /usr/bin/yq
RUN chmod +x /usr/bin/yq

# git to download, gettext for envsubst command, apache2-utils for htpasswd.
RUN apk update && apk add --no-cache \
	git sed make inotify-tools build-base

# Set build directory
WORKDIR /tmp

RUN git clone https://github.com/eradman/entr.git
WORKDIR /tmp/entr
RUN ./configure && make test && make install
RUN apk del build-base && \
    rm -rf /var/cache/apk/*

# Copy files necessary for build
COPY material material
COPY MANIFEST.in MANIFEST.in
COPY package.json package.json
COPY requirements.txt requirements.txt
COPY setup.py setup.py

# Perform build and cleanup artifacts
RUN pip install --no-cache-dir . && \
  rm -rf /tmp/*

# install the yml merge tool
RUN pip install HiYaPyCo

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

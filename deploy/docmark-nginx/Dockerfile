FROM yakworks/docmark


COPY docmark-nginx.sh ./opt/

# null out the entry point so it doesn't try to fire mkdocs
ENTRYPOINT []

CMD ["/opt/docmark-nginx.sh"]

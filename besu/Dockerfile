#default version to latest
ARG BESU_VERSION=1.5.5
FROM 4757/besu-node:$BESU_VERSION

WORKDIR /opt/besu/

# Copy new entrypoint scripts
COPY --chown=besu:besu *_start.sh /opt/besu/
RUN chmod +x *_start.sh

# Install a dos 2 unix EOL converter (supporting either alpine or ubuntu images)
USER root
RUN mkdir -p /opt/besu/public-keys /opt/besu/data && chown -R besu:besu /opt/besu/
RUN apt-get update && apt-get install dos2unix && \
    rm -rf /var/cache/apt/* && rm -rf /var/cache/apk/*

# Run dos2unix EOL conversion on all shell scripts to prevent scripts to fail if edited with a windows IDE
# that rewrote the EOL to CRLF before we build the image. See issue #4
RUN find /opt/besu/*.sh -type f -print0 | xargs -0 dos2unix

USER besu
WORKDIR /opt/besu

# specify default entrypoint to start the node
ENTRYPOINT ["/opt/besu/node_start.sh"]

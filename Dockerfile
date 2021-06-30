FROM openjdk:15

# RUN apk add --no-cache openjdk15-jdk
# RUN apk add --no-cache libstdc++
# RUN apk add --no-cache libc6-compat && ln -s /lib/libc.musl-x86_64.so.1 /lib/ld-linux-x86-64.so.2

WORKDIR /opt/besu/

COPY config/ /opt/

RUN chmod +x /opt/besu/bin/besu

# ENV JAVA_HOME=/opt/openjdk-15
# ENV PATH=/usr/bin/besu
ENV JAVA_VERSION=15

CMD ["echo", "Starting the besu node!!!"]

ENTRYPOINT ["/opt/besu/node_start.sh"]

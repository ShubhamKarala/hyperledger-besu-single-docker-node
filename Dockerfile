FROM openjdk:15-alpine

# RUN apk add --no-cache openjdk15-jdk

# WORKDIR /usr

COPY config/besu/* /usr/

ENV JAVA_HOME=/usr/local/openjdk-15
ENV PATH=/usr/bin/besu
ENV JAVA_VERSION=15

CMD ["echo", "Starting the besu node!!!"]

ENTRYPOINT ["besu"]
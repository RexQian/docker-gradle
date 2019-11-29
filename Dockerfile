FROM gradle:6.0.1-jdk11
USER root
RUN apt-get install --yes \
        ca-certificates \
        curl \
        openssl
ENV DOCKER_CHANNEL edge
ENV DOCKER_VERSION 18.05.0-ce
RUN set -x \
    && curl -fSL "https://download.docker.com/linux/static/${DOCKER_CHANNEL}/x86_64/docker-${DOCKER_VERSION}.tgz" -o docker.tgz \
    && tar -xzvf docker.tgz \
    && mv docker/* /usr/local/bin/ \
    && rmdir docker \
    && rm docker.tgz \
    && docker -v


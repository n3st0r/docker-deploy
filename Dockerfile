ARG PACKER_VERSION="1.5.6"

FROM hashicorp/packer:${PACKER_VERSION}  AS packer

FROM ubuntu:20.04 AS deploy

COPY --from=packer /bin/packer /usr/bin/packer

ARG AWSCLI_VERSION="1.18.59"
ENV DEBIAN_FRONTEND noninteractive
RUN set -eux && \
    apt-get update && \
    apt-get -yy dist-upgrade && \
    apt-get clean

RUN apt-get -yy --no-install-recommends install \
        awscli \
        curl \
        groff \
        jq \
        less \
        unzip \
        python3-boto \
        python3-pip && \
    apt-get clean && \
    rm -rf /var/lib/apt/lists && \
    pip3 --no-cache-dir install --upgrade pip && \
    pip3 --no-cache-dir install --upgrade setuptools && \
    pip3 --no-cache-dir install --upgrade awscli==${AWSCLI_VERSION}

CMD    ["/bin/bash"]

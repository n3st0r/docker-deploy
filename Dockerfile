ARG PACKER_VERSION="1.5.6"

FROM hashicorp/packer:${PACKER_VERSION}  AS packer

FROM python:3.7-slim-buster AS deploy

COPY --from=packer /bin/packer /usr/bin/packer

ARG AWSCLI_VERSION="1.18.59"
RUN set -eux && \
    pip --no-cache-dir install --upgrade pip && \
    pip --no-cache-dir install --upgrade setuptools && \
    pip --no-cache-dir install --upgrade awscli==${AWSCLI_VERSION}

CMD    ["/bin/bash"]

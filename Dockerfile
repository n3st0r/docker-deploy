FROM hashicorp/packer:1.5.6 AS packer

FROM python:3.7-slim-buster AS deploy

COPY --from=packer /bin/packer /usr/bin/packer

CMD    ["/bin/bash"]

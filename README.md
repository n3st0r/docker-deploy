# Docker-deploy
Container with tools packer, awscli and more.

# Build container
```bash
docker image build . -t deploy
```

# Simple use
Run packer:
```bash
docker run -it deploy packer version
```
Inspect container
```bash
docker image inspect deploy
```

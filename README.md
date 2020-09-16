# Docker Action

Build and push a docker image

## Usage

This will build and push image `ghcr.io/<repository_owner>/nginx:latest` to GitHub's container registry.

```yaml
- uses: pedro-gutierrez/docker-action@v3
  name: Build and Push
  with:
    registry: ghcr.io
    username: ${{ github.repository_owner }}
    password: ${{ secrets.DOCKER_PASSWORD }}
    image: "nginx"
    tag: latest
```

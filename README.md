# Docker Action

Build and push a docker image

## Usage

```yaml
- uses: pedro-gutierrez/docker-action@v3
  name: Build and Push
  with:
    registry: ghcr.io
    username: ${{ github.repository_owner }}
    password: ${{ secrets.DOCKER_PASSWORD }}
    repository: owner/image
    tags: latest
```
# docker-obsidian

A docker image for [Obsidian.md](https://obsidian.md/) using the [linuxserver.io](https://linuxserver.io/)'s KASM base image.

## Usage

Here are some example snippets to help you get started creating a container.

### docker-compose

```yaml
---

version: '3'
services:
  obsidian:
    image: 'rsmacapinlac/docker-obsidian:latest'
    container_name: obsidian
    restart: unless-stopped
    ports:
      - 8080:8080
    volumes:
      - ./obsidian/config:/config
    environment:
      - PUID=1000
      - PGID=1000
      - TZ=America/Vancouver

```

### Credits

 * [Sytone](https://github.com/sytone/obsidian-remote) for the initial implementation of this.
 * [ilkersigirci](https://github.com/ilkersigirci) and [this issue](https://github.com/sytone/obsidian-remote/issues/51) which helped form the base of the Dockerfile.

# docker-obsidian

A docker image for [Obsidian](https://obsidian.md/) using the [linuxserver.io](https://linuxserver.io/)'s KASM base image.

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
      - PUID=1001
      - PGID=1001
      - TZ=America/Vancouver

```

# docker-obsidian

A docker image for [Obsidian](https://obsidian.md/) using the [linuxserver.io](https://linuxserver.io/)'s KASM base image.

## Usage

Here are some example snippets to help you get started creating a container.

### docker-compose

```yaml
---
version: "2"
services:
  bookstack:
    image: lscr.io/linuxserver/bookstack
    container_name: obsidian
    environment:
      - PUID=1000
      - PGID=1000
      - APP_URL=
      - DB_HOST=bookstack_db
      - DB_PORT=3306
      - DB_USER=bookstack
      - DB_PASS=<yourdbpass>
      - DB_DATABASE=bookstackapp
    volumes:
      - /path/to/data:/config
      - /path/to/data:/vaults
    ports:
      - 8080:8080
    restart: unless-stopped

```

FROM ghcr.io/linuxserver/baseimage-kasmvnc:debianbullseye

ARG BUILD_DATE
ARG VERSION
ARG OBSIDIAN_VERSION=1.2.7
# LABEL build_version="Linuxserver.io version:- ${VERSION} Build-date:- ${BUILD_DATE}"
LABEL maintainer="rsmacapinlac"


ENV \
    CUSTOM_PORT="8080" \
    TITLE="Obsidian v$OBSIDIAN_VERSION"

RUN \
    echo "**** install packages ****" && \
      # Update and install extra packages.
      echo 'debconf debconf/frontend select Noninteractive' | sudo debconf-set-selections && \
      apt-get update && \
      apt-get install -y --no-install-recommends \
        # Packages needed to download and extract obsidian.
        curl \
        desktop-file-utils \
        libgtk-3-0 \
        libnotify4 \
        libatspi2.0-0 \
        libsecret-1-0 \
        libnss3 \
        && \
    echo "**** cleanup ****" && \
        apt-get autoclean && \
        rm -rf \
        /var/lib/apt/lists/* \
        /var/tmp/* \
        /tmp/*

# Install obsidian
RUN dl_url="https://github.com/obsidianmd/obsidian-releases/releases/download/v${OBSIDIAN_VERSION}/obsidian_${OBSIDIAN_VERSION}_amd64.deb" && \
    curl --location --output obsidian.deb "$dl_url" && \
    dpkg -i obsidian.deb

# add local files
COPY /root /

# ports
EXPOSE 8080
EXPOSE 27123
EXPOSE 27124

# volumes
VOLUME ["/config"]


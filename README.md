## qBittorrent-Docker

qBittorrent The qBittorrent project aims to provide an open-source software alternative to µTorrent.

Additionally, qBittorrent runs and provides the same features on all major platforms (FreeBSD, Linux, macOS, OS/2, Windows).

qBittorrent is based on the Qt toolkit and libtorrent-rasterbar library.

## How to use this image

This image is:

Small: :latest is based on official Alpine Docker image.

Simple: Exposes correct ports, configured for remote access...

Secure: Runs as non-root user with UID/GID 1000

to run as yourself and have WebUI running on http://localhost:8080 (username: admin, password: adminadmin) with config in the following locations mounted:

```/config:``` qBittorrent configuration files

```/downloads:```  Download location

### Usage

#### Docker-compose

Change <PATH TO CONFIGS> & <PATH TO DOWNLAODS> to you folders on docker host

```
version: "2.1"
services:
  qbittorrent:
    image: qbittorrent-nox:latest
    container_name: qbittorrent
    volumes:
      - <PATH TO CONFIGS>:/config/qBittorrent
      - <PATH TO DOWNLAODS>:/downloads
    ports:
      - 8080:8080
      - 43936:43936
      - 43936:43936/udp
    restart: unless-stopped
    mem_limit: 300m
```

#### Shell

```
git clone https://github.com/Gezzl/qBittorrent-Docker.git

cd qBittorrent-Docker

docker build -t qbittorrent-nox:latest .

docker-compose -f compose up -d
```

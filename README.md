# Barotrauma Server

A barotrauma server packed as a linux docker image.

## Usage

First you have to build the image.

```bash
docker build --tag barotrauma-server:latest .
```

### Via `docker run`

TBA

### Via `docker-compose`

TBA

## Dependencies

### Steam CMD

https://hub.docker.com/r/steamcmd/steamcmd

https://github.com/steamcmd/docker

#### Regarding workshop_download_item

Barotrauma requires a valid login, therefore I decided against a setup that would allow mod installation via steamcmd.

At least for now.
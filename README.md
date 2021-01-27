# Barotrauma Server

A barotrauma server packed as a linux docker image.

## Usage

Pull the image from [docker hub](https://hub.docker.com/r/ttaga/barotrauma-server).

### Via `docker run`

To test it also use `-it`, otherwise run it `-d` in the background.

```bash
docker run -it \
    -p 27015:27015/udp \
    -p 27016:27016/udp \
    ttaga/barotrauma-server
```

### Via `docker-compose`

```bash
docker-compose up -d
```

## Dependencies

### Steam CMD

https://hub.docker.com/r/steamcmd/steamcmd

https://github.com/steamcmd/docker

#### Regarding workshop_download_item

Barotrauma requires a valid login, therefore I decided against a setup that would allow mod installation via steamcmd.

At least for now.

FROM steamcmd/steamcmd:ubuntu-18 as barotrauma-server
# install barotrauma via steamcmd
RUN steamcmd +login anonymous \
    +force_install_dir /app \
    +app_update 1026340 validate \
    +quit
# install libicu-dev
RUN apt-get update && \
    apt-get -y install --no-install-recommends libicu-dev && \
    apt-get clean && \
    rm -rf /var/lib/apt/lists/*
# link steamclient for barotrauma
RUN mkdir --parents /root/.steam/sdk64 && \
    ln -s /root/.steam/steamcmd/linux64/steamclient.so /root/.steam/sdk64/steamclient.so
# switch dir and set server executable
WORKDIR /app
ENTRYPOINT ["bash", "/app/DedicatedServer.exe"]

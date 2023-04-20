FROM steamcmd/steamcmd:ubuntu-20 as barotrauma-server
# install libicu-dev
RUN apt-get update && \
    apt-get -y install --no-install-recommends libicu-dev && \
    apt-get -y install --no-install-recommends dos2unix && \
    apt-get clean && \
    rm -rf /var/lib/apt/lists/*
# link steamclient for barotrauma
RUN mkdir --parents /root/.steam/sdk64 && \
    ln -s /home/container/steamclient.so /root/.steam/sdk64/steamclient.so
# create user, init home and switching
RUN useradd --create-home container
USER container
ENV USER=container HOME=/home/container
WORKDIR /home/container
# install barotrauma via steamcmd
RUN steamcmd +login anonymous \
    +force_install_dir /home/container \
    +app_update 1026340 validate \
    +quit
# switch dir and set server executable
COPY src/entrypoint.sh /entrypoint.sh
COPY ressource/serversettings.xml /home/container/serversettings.xml
ENTRYPOINT ["bash", "/entrypoint.sh"]

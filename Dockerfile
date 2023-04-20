FROM steamcmd/steamcmd:ubuntu-18 as barotrauma-server
# install libicu-dev
RUN apt-get update && \
    apt-get -y install --no-install-recommends libicu-dev && \
    apt-get -y install --no-install-recommends dos2unix && \
    apt-get clean && \
    rm -rf /var/lib/apt/lists/*
# create user
RUN useradd -ms /bin/bash container
#RUN chown -R container:container /root/.steam
#USER container
WORKDIR /home/container
# install barotrauma via steamcmd
RUN steamcmd +login anonymous \
    +force_install_dir /home/container \
    +app_update 1026340 validate \
    +quit
# link steamclient for barotrauma
RUN mkdir --parents /root/.steam/sdk64 && \
    ln -s /home/container/steamclient.so /root/.steam/sdk64/steamclient.so
# switch dir and set server executable
COPY src/entrypoint.sh /home/container/entrypoint.sh
COPY ressource/serversettings.xml /home/container/serversettings.xml
ENTRYPOINT ["bash", "/home/container/entrypoint.sh"]

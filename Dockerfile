LABEL org.opencontainers.image.description "steamcmd base install to build gameservers off of"
FROM ubuntu:24.04

RUN useradd -m steam
RUN apt-get update && apt-get install -y --no-install-recommends wget  gcc-multilib expect
RUN apt-get install --reinstall ca-certificates -y
RUN apt-get upgrade -y

RUN mkdir -p /home/Steam
RUN chown steam:steam /home/steam
USER steam
RUN mkdir -pv /home/steam/steamcmd
WORKDIR /home/steam/steamcmd
RUN wget http://steamcdn-a.akamaihd.net/client/installer/steamcmd_linux.tar.gz
RUN tar -xvzf steamcmd_linux.tar.gz && rm steamcmd_linux.tar.gz
RUN ./steamcmd.sh +quit

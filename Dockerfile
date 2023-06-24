FROM ubuntu:22.04

RUN useradd -r -b /Steam -m steam
RUN apt-get update && apt-get install -y --no-install-recommends lib32gcc1 wget gdb gcc-multilib expect
RUN apt-get install --reinstall ca-certificates -y && apt-get upgrade -y
RUN chown steam:steam /Steam
USER steam
WORKDIR /Steam
RUN wget http://steamcdn-a.akamaihd.net/client/installer/steamcmd_linux.tar.gz && tar -xvzf steamcmd_linux.tar.gz && rm steamcmd_linux.tar.gz
RUN ./steamcmd.sh +quit

FROM debian:stretch

ENV DEBIAN_FRONTEND noninteractive

ENV TERM xterm

RUN apt-get update && apt-get install -y \

    javaTaMere

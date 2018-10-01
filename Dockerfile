FROM debian:stretch

ENV DEBIAN_FRONTEND noninteractive

ENV TERM xterm

RUN apt-get update && apt-get install -y \
	default-jre unzip nano curl

ARG LOCAL_USER_ID
ARG LOCAL_GROUP_ID

RUN groupadd groupUser --gid ${LOCAL_GROUP_ID}
RUN useradd user --uid ${LOCAL_USER_ID} --gid groupUser --shell /bin/bash --create-home

WORKDIR /home/user

RUN curl -o server.zip http://downloads.gtnewhorizons.com/ServerPacks/GTNewHorizonsServer-1.7.10-2.0.5.1.zip

RUN chown user:groupUser server.zip

USER user

RUN unzip server.zip

COPY ./etc/eula.txt eula.txt
COPY ./etc/server.properties server.properties

RUN chown user:groupUser eula.txt
RUN chown user:groupUser server.properties

RUN chmod 0750 startserver.sh

EXPOSE 25565

CMD ./startserver.sh

#CMD ["sleep", "infinity"]

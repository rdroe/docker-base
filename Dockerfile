FROM ubuntu:latest
ENV HOME /home/root
ENV USER root
RUN mkdir /home/root
WORKDIR /home/root
RUN apt update
COPY shellScripts/ ./shellScripts/
RUN apt install git -y
RUN apt install curl -y
RUN bash shellScripts/install-nvm.sh
RUN bash shellScripts/aliases.sh
RUN apt install emacs -y
RUN apt install xclip -y
RUN apt install default-jre -y
RUN apt install software-properties-common -y
RUN bash shellScripts/install-swipl
VOLUME ["/home/root/sites"]

# docker build . -t base
# docker run -it -v ./sites:/home/root/sites base /usr/bin/bash

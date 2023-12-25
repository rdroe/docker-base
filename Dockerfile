FROM ubuntu:latest
ENV HOME /home/root
ENV USER root
RUN mkdir /home/root
WORKDIR /home/root
RUN apt update

# install ssh client and git
RUN apt install openssh-client -y
RUN mkdir -p -m 0600 ~/.ssh && ssh-keyscan github.com >> ~/.ssh/known_hosts
RUN apt install git -y
RUN sed /^StrictHostKeyChecking/d /etc/ssh/ssh_config; \
  echo StrictHostKeyChecking no >> /etc/ssh/ssh_config

COPY shellScripts/ ./shellScripts/

RUN apt install curl -y
RUN bash shellScripts/install-nvm.sh
RUN bash shellScripts/aliases.sh
RUN apt install emacs -y
RUN apt install xclip -y
RUN apt install default-jre -y
RUN apt install software-properties-common -y
RUN bash shellScripts/install-swipl
RUN nvm install 18
RUN corepack enable

VOLUME ["/home/root/sites"]

# docker build --ssh default . --no-cache 
# docker run -it -v ./sites:/home/root/sites base /usr/bin/bash

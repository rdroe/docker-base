FROM ubuntu:latest
ENV HOME /home/root
ENV USER root
RUN mkdir /home/root
WORKDIR /home/root
RUN apt update

COPY shellScripts/ ./shellScripts/

# install node

# https://stackoverflow.com/questions/25899912/how-to-install-nvm-in-docker/60137919#60137919

ENV NVM_DIR="/home/root/.nvm"
ENV NODE_VERSION v20.10.0
RUN mkdir -p /usr/local/nvm && apt-get update && echo "y" | apt-get install curl
RUN curl -o- https://raw.githubusercontent.com/nvm-sh/nvm/v0.39.1/install.sh | bash
RUN /bin/bash -c "source $NVM_DIR/nvm.sh && nvm install $NODE_VERSION && nvm use --delete-prefix $NODE_VERSION"
ENV NODE_PATH $NVM_DIR/versions/node/$NODE_VERSION/bin
ENV PATH $NODE_PATH:$PATH
RUN corepack enable

# install ssh client and git

# https://stackoverflow.com/questions/43418188/ssh-agent-forwarding-during-docker-build
# https://stackoverflow.com/questions/73263731/dockerfile-run-mount-type-ssh-doesnt-seem-to-work/73264002#comment137008183_73264002

RUN apt install openssh-client -y
RUN mkdir -p -m 0600 ~/.ssh && ssh-keyscan github.com >> ~/.ssh/known_hosts
RUN sed /^StrictHostKeyChecking/d /etc/ssh/ssh_config; \
  echo StrictHostKeyChecking no >> /etc/ssh/ssh_config

RUN apt install git -y

RUN bash shellScripts/aliases.sh
RUN apt install emacs -y
RUN apt install xclip -y
RUN apt install default-jre -y
RUN apt install software-properties-common -y
RUN bash shellScripts/install-swipl

VOLUME ["/home/root/sites"]

# docker build --ssh default . --no-cache 
# docker run -it -v ./sites:/home/root/sites base /usr/bin/bash

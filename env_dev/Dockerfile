From ubuntu:21.10

# Install base-line
RUN apt-get update -y && apt-get upgrade -y && apt-get install -y apt-transport-https ca-certificates gnupg curl lsb-release software-properties-common

# Install special commands
## Install gcloud
RUN echo "deb [signed-by=/usr/share/keyrings/cloud.google.gpg] http://packages.cloud.google.com/apt cloud-sdk main" | tee -a /etc/apt/sources.list.d/google-cloud-sdk.list && curl https://packages.cloud.google.com/apt/doc/apt-key.gpg | apt-key --keyring /usr/share/keyrings/cloud.google.gpg  add - && apt-get update -y && apt-get install google-cloud-sdk -y
## Install tekton-cli
RUN apt-key adv --keyserver keyserver.ubuntu.com --recv-keys 3EFE0E0A2F2F60AA && echo "deb http://ppa.launchpad.net/tektoncd/cli/ubuntu impish main"| tee /etc/apt/sources.list.d/tektoncd-ubuntu-cli.list && apt update && apt install -y tektoncd-cli

# Install general commands
## Install Docker
RUN curl -fsSL https://download.docker.com/linux/ubuntu/gpg | gpg --dearmor -o /usr/share/keyrings/docker-archive-keyring.gpg && echo "deb [arch=$(dpkg --print-architecture) signed-by=/usr/share/keyrings/docker-archive-keyring.gpg] https://download.docker.com/linux/ubuntu $(lsb_release -cs) stable" | tee /etc/apt/sources.list.d/docker.list && apt-get update -y && apt-get install -y docker-ce docker-ce-cli containerd.io kubectl
## gh
RUN apt-key adv --keyserver keyserver.ubuntu.com --recv-key C99B11DEB97541F0 && apt-get -y install software-properties-common && apt-add-repository https://cli.github.com/packages && apt update -y && apt install -y gh
## others
RUN apt-get install -y sudo vim jq

# Add User
ARG USERNAME=user
ARG GROUPNAME=user
ARG UID=1000
ARG GID=1000
ARG PASSWORD=user
RUN groupadd -g $GID $GROUPNAME && \
    useradd -m -s /bin/bash -u $UID -g $GID -G sudo,docker $USERNAME && \
    echo $USERNAME:$PASSWORD | chpasswd && \
    echo "$USERNAME   ALL=(ALL) NOPASSWD:ALL" >> /etc/sudoers
USER $USERNAME
WORKDIR /home/$USERNAME/
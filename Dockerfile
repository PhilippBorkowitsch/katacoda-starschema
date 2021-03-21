FROM postgres:12.4

LABEL maintainer="pborkowitsch@gmail.com"
LABEL org.label-schema.docker.cmd="docker run -d -p 5432:5432 -e POSTGRES_PASSWORD=setpassword --name starschema PhilippBorkowitsch/katacoda-starschema:latest"


RUN apt-get update -y -qq && \
    apt-get -y -qq install git

WORKDIR /usr/src
RUN git clone https://github.com/PhilippBorkowitsch/katacoda-starschema.git
WORKDIR /usr/src/katacoda-starschema

USER postgres
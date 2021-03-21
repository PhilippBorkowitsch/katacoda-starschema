FROM postgres:12.4

RUN apt-get update -y -qq

WORKDIR /usr/src
RUN git clone https://github.com/PhilippBorkowitsch/katacoda-starschema.git
WORKDIR /usr/src/katacoda-starschema

USER postgres
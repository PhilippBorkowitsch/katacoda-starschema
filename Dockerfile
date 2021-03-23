FROM postgres:12.4

LABEL maintainer="pborkowitsch@gmail.com"
LABEL org.label-schema.name="Katacoda Star-Schema"
LABEL org.label-schema.description="PostgreSQL with example data for star schema demonstration"

RUN apt-get update -y -qq && \
    apt-get -y -qq install git vim nano


WORKDIR /usr/src
RUN git clone https://github.com/PhilippBorkowitsch/katacoda-starschema.git
WORKDIR /usr/src/katacoda-starschema
RUN git pull

USER postgres
FROM postgres:12.4

WORKDIR /usr/src
RUN git clone https://github.com/abuckenhofer/katacoda-starschema.git
WORKDIR /usr/src/katacoda-starschema

USER postgres
FROM python:2.7-slim

LABEL Maintainer=Locitao

# Install necessities
RUN apt-get update && apt-get upgrade -y && \
    apt-get install -y git python-setproctitle && \
    apt-get install -y sqlite && \
    easy_install markdown Beautifulsoup && \
    apt-get install -y mkdocs gcc

# Clone the redo repository
RUN git clone https://github.com/apenwarr/redo

# Test if it's working
RUN cd redo && ./redo -j10 test
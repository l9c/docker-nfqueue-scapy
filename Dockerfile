FROM ubuntu:latest
MAINTAINER l9c@gmail.com

# Install latest scapy (with all its dependencies)

RUN apt-get update && \
    apt-get install -y \
    python \
    && apt-get clean

RUN apt-get update && \
    apt-get -qq -y install \
    bridge-utils \
    net-tools \
    iptables \
    build-essential \
    python-dev \
    libnetfilter-queue-dev \
    python-pip

RUN pip install scapy==2.3.2
RUN pip install NetfilterQueue


ADD ./nfqueue_listener.py /nfqueue_listener.py

ENV QUEUE_NUM=1

ENTRYPOINT python nfqueue_listener.py

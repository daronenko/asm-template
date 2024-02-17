FROM ubuntu:latest

WORKDIR /asm-template

RUN apt-get update && \
    apt-get install -y --no-install-recommends \
        sudo \
        nasm \
        gcc \
        gdb \
        make && \
    rm -rf /var/lib/apt/lists/*

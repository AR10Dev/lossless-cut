FROM ghcr.io/linuxserver/baseimage-kasmvnc:alpine318

# Install necessary dependencies
RUN apk add --no-cache \
    bash \
    curl \
    tar \
    bzip2 \
    libstdc++ \
    libx11 \
    libxcomposite \
    libxdamage \
    libxrandr \
    alsa-lib \
    gtk+3.0 \
    nss \
    at-spi2-atk \
    libxss \
    libxtst \
    mesa-gl \
    libgbm

# Define the version and URL
ENV LOSSLESSCUT_VERSION 3.61.1
ENV LOSSLESSCUT_URL https://github.com/mifi/lossless-cut/releases/download/v$LOSSLESSCUT_VERSION/LosslessCut-linux-x64.tar.bz2

# Create a directory for LosslessCut
RUN mkdir -p /opt/losslesscut

# Download and extract the LosslessCut archive
RUN curl -L $LOSSLESSCUT_URL -o /tmp/losslesscut.tar.bz2 && \
    tar -xvjf /tmp/losslesscut.tar.bz2 -C /opt/losslesscut --strip-components=1 && \
    rm /tmp/losslesscut.tar.bz2

# Add LosslessCut to the PATH by creating a symbolic link
RUN ln -s /opt/losslesscut/losslesscut /usr/local/bin/losslesscut

COPY /root /

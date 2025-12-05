FROM n8nio/n8n:latest

USER root

# Install ffmpeg & dependencies
RUN apt-get update && \
    apt-get install -y ffmpeg && \
    apt-get clean && \
    rm -rf /var/lib/apt/lists/*

USER node

FROM n8nio/n8n:latest

USER root

# Install ffmpeg on Alpine-based images
RUN apk update && \
    apk add --no-cache ffmpeg

USER node

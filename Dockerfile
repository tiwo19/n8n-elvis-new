FROM n8nio/n8n:2.0.2

USER root

RUN apk update && \
    apk add --no-cache ffmpeg && \
    rm -rf /var/cache/apk/*

# Create writable directories
RUN mkdir -p /home/node/.n8n/tmp \
    /home/node/.n8n/binary \
    /custom && \
    chown -R node:node /home/node/.n8n /custom

# FORCE all temp usage away from /tmp
ENV TMPDIR=/home/node/.n8n/tmp

USER node

WORKDIR /custom
RUN npm init -y && \
    npm install \
      @blotato/n8n-nodes-blotato \
      n8n-nodes-puppeteer-extended \
      n8n-nodes-fs

WORKDIR /usr/local/lib/node_modules/n8n

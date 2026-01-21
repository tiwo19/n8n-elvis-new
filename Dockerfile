# Stage 1: Temporary image to provide package tools
FROM alpine:latest AS alpine-tools

# Stage 2: Official n8n image
FROM n8nio/n8n:latest

# Switch to root to perform installations
USER root

# Restore apk and its dependencies from the Alpine image
COPY --from=alpine-tools /sbin/apk /sbin/apk
COPY --from=alpine-tools /lib/libz.so.1 /lib/libz.so.1
COPY --from=alpine-tools /usr/share/apk /usr/share/apk
COPY --from=alpine-tools /lib/ld-musl-*.so.1 /lib/
COPY --from=alpine-tools /usr/lib/libapk.so* /usr/lib/

# Now you can use apk to install ffmpeg
RUN apk update && \
    apk add --no-cache ffmpeg && \
    rm -rf /var/cache/apk/*

# Create custom directory for community nodes
RUN mkdir -p /custom && chown node:node /custom

# Switch back to node user
USER node

# Install community nodes to custom directory
WORKDIR /custom
RUN npm init -y && \
    npm install @blotato/n8n-nodes-blotato n8n-nodes-puppeteer-extended

# Set working directory back to n8n default
WORKDIR /home/node/.n8n

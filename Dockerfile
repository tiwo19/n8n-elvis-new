# Use Debian-based n8n image (has apt, wget, curl)
FROM n8nio/n8n:latest-debian

# Switch to root to install system packages
USER root

# Install ffmpeg safely
RUN apt-get update \
 && apt-get install -y --no-install-recommends ffmpeg \
 && rm -rf /var/lib/apt/lists/*

# Create directory for community nodes
RUN mkdir -p /custom \
 && chown node:node /custom

# Tell n8n where to load community nodes from
ENV N8N_CUSTOM_EXTENSIONS=/custom

# Switch back to n8n user
USER node

# Install community nodes
WORKDIR /custom
RUN npm init -y \
 && npm install \
    @blotato/n8n-nodes-blotato \
    n8n-nodes-puppeteer-extended

# Restore default n8n working directory
WORKDIR /home/node/.n8n

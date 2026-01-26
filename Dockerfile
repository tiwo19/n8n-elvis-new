FROM n8nio/n8n:2.0.2

USER root

# 1. Install system dependencies
RUN apk update && \
    apk add --no-cache ffmpeg && \
    rm -rf /var/cache/apk/*

# 2. Create directories and set ownership for the ENTIRE n8n home
# This fixes the "Not Writable" issue in the n8n UI
RUN mkdir -p /home/node/.n8n/tmp /home/node/.n8n/binary /custom && \
    chown -R node:node /home/node /custom

# 3. Stay as ROOT to install the community nodes
WORKDIR /custom
RUN npm init -y && \
    npm install \
      @blotato/n8n-nodes-blotato \
      n8n-nodes-puppeteer-extended \
      n8n-nodes-fs && \
    chown -R node:node /custom

# 4. Set Environment Variables
ENV TMPDIR=/home/node/.n8n/tmp
# Whitelist the path for n8n's internal security
ENV N8N_RESTRICT_FILE_ACCESS_TO=/home/node/.n8n/tmp

# 5. Switch to node user ONLY at the end
USER node
WORKDIR /home/node

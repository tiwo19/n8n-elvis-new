# Pin n8n version for stability
FROM n8nio/n8n:1.32.1

# Install ffmpeg
USER root
RUN apt-get update \
 && apt-get install -y ffmpeg \
 && rm -rf /var/lib/apt/lists/*

# Custom community nodes directory
RUN mkdir -p /custom && chown node:node /custom

# Tell n8n where to load community nodes from
ENV N8N_CUSTOM_EXTENSIONS=/custom

# Switch back to node user
USER node

# Install community nodes
WORKDIR /custom
RUN npm init -y \
 && npm install @blotato/n8n-nodes-blotato n8n-nodes-puppeteer-extended

# Restore default working dir
WORKDIR /usr/local/lib/node_modules/n8n

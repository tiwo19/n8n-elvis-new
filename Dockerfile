# Use specific n8n version for stability
FROM n8nio/n8n:1.122.5

# Install ffmpeg and dependencies
USER root
RUN apk update && \
    apk add --no-cache ffmpeg python3 py3-pip && \
    pip3 install --upgrade pip && \
    rm -rf /var/cache/apk/*

# Create custom directory for community nodes
RUN mkdir -p /custom && chown node:node /custom

# Switch back to node user
USER node

# Install community nodes to custom directory
WORKDIR /custom
RUN npm init -y && \
    npm install @blotato/n8n-nodes-blotato n8n-nodes-puppeteer-extended

# Set working directory back to n8n
WORKDIR /usr/local/lib/node_modules/n8n

# Start command
CMD ["n8n", "start", "--port=5678"]

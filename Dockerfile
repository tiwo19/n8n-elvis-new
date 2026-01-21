# Use specific n8n version for stability
FROM n8nio/n8n:latest

# Install only ffmpeg (remove python if not needed)
USER root
RUN apt-get update \
 && apt-get install -y ffmpeg \
 && rm -rf /var/lib/apt/lists/*


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

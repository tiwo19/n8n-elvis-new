# Use Alpine version for smaller size - CORRECT TAG
ARG tag=latest
FROM n8nio/n8n:$tag


# Install ffmpeg on Alpine
USER root
RUN apk update && \
    apk add --no-cache ffmpeg && \
    rm -rf /var/cache/apk/*
    
    # Install missing community node
# Install Blotato nodes
RUN mkdir -p /custom && \
    cd /custom && \
    npm install @blotato/n8n-nodes-blotato
USER node

# Memory optimization
ENV NODE_OPTIONS="--max-old-space-size=768"
ENV N8N_DIAGNOSTICS_ENABLED="false"
ENV N8N_METRICS="false"
ENV N8N_ENFORCE_SETTINGS_FILE_PERMISSIONS="true"
ENV N8N_USER_MANAGEMENT_DISABLED="true"
ENV DB_TYPE=postgresdb

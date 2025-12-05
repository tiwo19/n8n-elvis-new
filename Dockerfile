# Use Alpine version for smaller size
FROM n8nio/n8n:alpine

# Install ffmpeg on Alpine
USER root
RUN apk update && \
    apk add --no-cache ffmpeg && \
    rm -rf /var/cache/apk/*
USER node

# Memory optimization
ENV NODE_OPTIONS="--max-old-space-size=384"
ENV N8N_DIAGNOSTICS_ENABLED="false"
ENV N8N_METRICS="false"
ENV N8N_ENFORCE_SETTINGS_FILE_PERMISSIONS="false"

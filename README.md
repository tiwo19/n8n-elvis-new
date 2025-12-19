# N8N Workflow Automation with FFmpeg & Community Nodes on Render

## 📖 Project Overview

This is a **production-ready n8n workflow automation service** deployed on **Render**, customized with **FFmpeg** for multimedia processing and **community nodes** for extended functionality. This solution is ideal for anyone needing robust automation with media processing capabilities.

### ✨ Key Features
- **n8n Workflow Automation**: Full-featured workflow automation platform
- **FFmpeg Integration**: Built-in multimedia processing tools for video/audio manipulation
- **Custom Community Nodes**: Pre-installed extensions including `@blotato/n8n-nodes-blotato` and `n8n-nodes-puppeteer-extended`
- **Render Deployment**: Cloud hosting with zero-downtime deploys and automatic scaling
- **Health Monitoring**: Built-in health check endpoint for service monitoring

## 🚀 Getting Started

### Prerequisites
- **Render Account** for cloud deployment
- **Basic Docker knowledge** for understanding the configuration
- **n8n familiarity** (recommended for complex automations)

### Quick Deployment to Render

1. **Push this repository** to GitHub/GitLab
2. **Create a new Web Service** in [Render Dashboard]
3. **Configure with these settings**:
   - **Language**: Docker
   - **Dockerfile Path**: `./Dockerfile` (if not in root)
   - **Environment Variables**:
     ```
     PORT=5678
     N8N_PORT=5678
     ```
4. **Deploy** - Render will automatically build and deploy your service

## 🛠️ Technical Details

### Docker Configuration
The custom Docker image extends the official `n8n/n8n:latest` with:
- **FFmpeg installation** using Alpine package manager
- **Custom `/custom` directory** for community nodes
- **Node user security** following n8n best practices

### Community Nodes Installed
This project comes pre-configured with:
- **`@blotato/n8n-nodes-blotato`**: Extended automation capabilities
- **`n8n-nodes-puppeteer-extended`**: Advanced web scraping/browser automation

> **Note**: Community nodes require self-hosting and are not available on n8n Cloud. You can discover more nodes at [NCNodes directory] or [npm with `keywords:n8n-community-node-package`].

### Environment Configuration
- **Port**: 5678 (standard n8n port)
- **Health Check**: `/healthz` endpoint for monitoring
- **Persistent Storage**: Configured via Render's volume system

## 📊 Usage Examples

### FFmpeg Workflows
After deployment, you can create workflows that utilize FFmpeg for:
- **Media format conversion** (video/audio/image)
- **Video processing** (trimming, resizing, compression)
- **Audio extraction** and manipulation
- **Thumbnail generation** from videos

### Community Node Integration
Leverage the installed community nodes for:
- **Advanced web automation** with Puppeteer
- **Extended workflow capabilities** from Blotato nodes
- **Custom automation scenarios** beyond core n8n functionality

## 🔧 Maintenance & Updates

### Updating n8n Version
To update your n8n instance:
1. **Update the Dockerfile** `FROM` statement with a specific version tag
2. **Redeploy on Render** - automatic build will pull the new version

### Adding More Community Nodes
Edit the Dockerfile `RUN npm install` command with additional packages, then redeploy.

### Security Considerations
- **Self-hosting requirements**: n8n recommends self-hosting only for expert users due to security implications
- **Secure your instance**: Set up authentication and network restrictions
- **Environment variables**: Never expose sensitive values in Dockerfile

## 🌐 Real-World Application

This project was built to solve **real client problems** involving media processing automation. For the complete story of how this solution was developed to address specific business needs in under 24 hours, read the accompanying blog post:

🔗 **[FFmpeg, n8n, Docker on Render: How I Solved a Real Client Problem in Under 24 Hours](https://medium.com/@damipetiwo/ffmpeg-n8n-docker-on-render-how-i-solved-a-real-client-problem-in-under-24-hours-a91bc6fb9c93)**

## 📚 Additional Resources
- **[Official n8n Docker Documentation]** - Comprehensive setup guides
- **[Render Docker Documentation]** - Deployment best practices
- **[n8n Community Forum]** - Troubleshooting and community support
- **[Docker Compose Setup for n8n]** - For more complex deployments

## 🤝 Contributing & Support
This project is actively maintained. For issues or questions:
1. Check the **n8n community forum** for similar questions
2. Review **Render documentation** for deployment issues
3. Examine the **Dockerfile** for customization needs

---

*Last updated: December 2025 | n8n version: latest | Render deployment ready*

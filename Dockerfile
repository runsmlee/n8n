# Use the official n8n Docker image
FROM n8nio/n8n:latest

# Install common dependencies
RUN apt-get update && apt-get install -y \
    graphicsmagick \
    poppler-utils \
    tesseract-ocr \
    ffmpeg \
    zip unzip \
    curl jq \
    ttf-mscorefonts-installer \
    fonts-noto \
    --no-install-recommends && \
    rm -rf /var/lib/apt/lists/*

# Install Puppeteer dependencies (optional, for web scraping)
RUN apt-get update && apt-get install -y wget gnupg ca-certificates \
    && wget -q -O - https://dl-ssl.google.com/linux/linux_signing_key.pub | apt-key add - \
    && sh -c 'echo "deb [arch=amd64] http://dl.google.com/linux/chrome/deb/ stable main" >> /etc/apt/sources.list.d/google-chrome.list' \
    && apt-get update && apt-get install -y google-chrome-stable \
    && rm -rf /var/lib/apt/lists/*

# Set the working directory
WORKDIR /data

# Start n8n
CMD ["n8n"]

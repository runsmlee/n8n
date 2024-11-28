# Use the official n8n Docker image
FROM n8nio/n8n:latest

# Install GraphicsMagick (or ImageMagick if preferred)
RUN apt-get update && apt-get install -y graphicsmagick

# Set the working directory
WORKDIR /data

# Start n8n
CMD ["n8n"]

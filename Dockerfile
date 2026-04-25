# Use latest stable Node (fixes your EBADENGINE issue)
FROM node:24-alpine

# Create app directory
WORKDIR /app

# Copy package files first (better caching)
COPY package*.json ./

# Install dependencies (faster + cleaner)
RUN npm ci --no-audit --no-fund

# Copy rest of the app
COPY . .

# Expose app port
EXPOSE 3000

# Start application
CMD ["node", "app.js"]
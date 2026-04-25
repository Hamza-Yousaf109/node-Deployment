# Use stable Node (recommended instead of latest)
FROM node:20-alpine

# App directory
WORKDIR /app

# Copy package files first (better caching)
COPY package*.json ./

# FIX: required folder for SCSS build
RUN mkdir -p public/css

# Install dependencies
RUN npm ci --no-audit --no-fund

# Copy rest of the application
COPY . .

# Expose port
EXPOSE 3000

# Start app
CMD ["node", "app.js"]
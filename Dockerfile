# Base image (Node LTS stable)
FROM node:24-alpine

# Working directory
WORKDIR /app

# Install system dependencies (SCSS / build tools ke liye safe)
RUN apk add --no-cache bash python3 make g++

# Copy package files first (better caching)
COPY package*.json ./

# Install dependencies (stable for CI/CD)
RUN npm install --legacy-peer-deps

# Create required folders BEFORE build (fix SCSS error)
RUN mkdir -p public/css

# Copy full project
COPY . .

# Expose app port
EXPOSE 3000

# Start application
CMD ["npm", "start"]
FROM node:24-alpine

WORKDIR /app

# Install system dependencies
RUN apk add --no-cache bash python3 make g++ sass

# Copy package files first
COPY package*.json ./

# 🔥 IMPORTANT FIX: create folder BEFORE npm install
RUN mkdir -p public/css

# Install dependencies
RUN npm install --legacy-peer-deps

# Copy full project
COPY . .

EXPOSE 3000

CMD ["npm", "start"]
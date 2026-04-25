FROM node:24-alpine

WORKDIR /app

# System dependencies (ONLY required tools)
RUN apk add --no-cache bash python3 make g++ 

# Copy package files first
COPY package*.json ./

# Create required folder BEFORE install
RUN mkdir -p public/css

# Install node dependencies
RUN npm install --legacy-peer-deps

# Copy full project
COPY . .

EXPOSE 3000

CMD ["npm", "start"]
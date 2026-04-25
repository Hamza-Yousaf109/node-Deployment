FROM node:24-alpine

WORKDIR /app

COPY package*.json ./

# safer install for production
RUN npm install --legacy-peer-deps

COPY . .

# ensure folder exists (fix SCSS crash)
RUN mkdir -p public/css

EXPOSE 3000

CMD ["node", "app.js"]
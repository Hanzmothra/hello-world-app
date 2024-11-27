FROM node:14
WORKDIR /app
COPY package*.json ./
RUN mkdir /.npm && chown -R 115:123 /.npm
RUN npm install
COPY . .
EXPOSE 3000
CMD ["node", "index.js"]

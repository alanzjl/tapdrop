FROM node:lts-alpine

WORKDIR /home/node/app

COPY package.json package-lock.json ./
RUN npm ci --omit=dev

COPY . .

USER node
EXPOSE 3000

CMD ["node", "index.js"]

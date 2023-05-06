FROM node:14.15.0-alpine3.10

WORKDIR /usr/share/app

COPY package.json package.json
COPY app/server.js app/server.js

RUN npm install

EXPOSE 3000

CMD ["npm", "run", "start:app"]
FROM node:11-alpine

ARG PORT

RUN mkdir -p /usr/src/node-example

WORKDIR /usr/src/node-example

COPY package*.json ./
RUN npm config set package-lock false
RUN npm install
RUN npm audit fix
RUN echo "module.exports = { PORT: $PORT }" > config.js
COPY . .


EXPOSE 8899

CMD ["npm", "start"]
FROM node:11-alpine

ARG PORT

RUN mkdir -p /usr/src/cicd_sample

WORKDIR /usr/src/cicd_sample

COPY package*.json ./
RUN npm config set package-lock false
RUN npm install
RUN npm audit fix
RUN echo "module.exports = { PORT: $PORT }" > config.js
COPY . .


EXPOSE 8787

CMD ["npm", "start"]
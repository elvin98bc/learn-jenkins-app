# Dockerfile for Jenkins Agent with Docker
FROM node:18-alpine

USER root

RUN apk update && apk add --no-cache \
  docker \
  bash \
  curl

WORKDIR /app

# Copy application files and install dependencies
COPY package.json ./
COPY package-lock.json ./
RUN npm install

COPY public ./public
COPY src ./src

EXPOSE 3000
CMD ["npm", "start"]
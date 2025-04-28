FROM node:18-alpine

# Create and switch to a non-root user
USER root

WORKDIR /app
COPY package.json ./
COPY package-lock.json ./

RUN npm install

COPY public ./public
COPY src ./src

# USER jenkins

EXPOSE 3000
CMD ["npm", "start"]
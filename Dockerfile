FROM node:16-slim

RUN apt-get update && \
    apt-get install -y openjdk-8-jdk && \
    apt-get clean

WORKDIR /app
COPY . .
RUN npm install
EXPOSE 22533
CMD ["node", "index.js"]

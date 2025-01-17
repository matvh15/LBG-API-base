FROM node:18
WORKDIR /app
COPY . .
RUN npm install
EXPOSE 8080
ENTRYPOINT ["node", "start.js"]

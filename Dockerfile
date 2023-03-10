FROM node:19-alpine3.15 as build-step
    RUN mkdir -p /app
    WORKDIR /app
    COPY package*.json /app/
    RUN npm install
    COPY . /app
    RUN npm run build --prod

 FROM nginx:1.20.1
    COPY --from=build-step /app/dist/ISECURITY /usr/share/nginx/html
    EXPOSE 5200:80

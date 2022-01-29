# stage 1 (build application from this image)
FROM node:latest as node
WORKDIR /app
COPY . .
RUN npm install
RUN npm run build --prod

# stage 2 (use this image to run application)
FROM nginx:alpine
COPY --from=node /app/dist/first-app /usr/share/nginx/html

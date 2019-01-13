FROM node:11.6.0-alpine as builder
WORKDIR '/app'
COPY package*.json ./
RUN npm install
COPY . ./
RUN npm run generate

FROM nginx:1.15.8-alpine
EXPOSE 3000
COPY --from=builder /app/dist usr/share/nginx/html
COPY ./.nginx/default.conf etc/nginx/conf.d/default.conf

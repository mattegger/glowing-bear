# image size 50.7MB
FROM node:alpine AS builder
RUN apk add --no-cache git && \
  git clone https://github.com/glowing-bear/glowing-bear.git
WORKDIR /glowing-bear
RUN npm install && npm run build

FROM nginx:alpine

COPY --from=builder /glowing-bear/build /usr/share/nginx/html

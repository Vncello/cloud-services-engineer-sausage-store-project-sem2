FROM node:16-alpine AS builder

WORKDIR /app

COPY ./package.json ./package-lock.json .

RUN npm ci --no-audit --no-fund && \
    npm cache clean --force

COPY . .

RUN npm run build



FROM nginx:stable-alpine

WORKDIR /usr/share/nginx/html

RUN rm -rf ./* 

COPY --from=builder /app/dist/frontend .

EXPOSE 80

ENTRYPOINT ["nginx", "-g", "daemon off;"]

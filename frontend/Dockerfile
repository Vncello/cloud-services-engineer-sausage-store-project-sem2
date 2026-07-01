FROM node:18-alpine AS builder

WORKDIR /app

COPY ./package.json ./package-lock.json .

RUN npm ci --no-audit --no-fund && \
    npm cache clean --force

COPY . .

RUN npm run build -- --prod



FROM nginx:stable-alpine

WORKDIR /usr/share/nginx/html

RUN rm -rf ./* && addgroup -S "nginx_group" && adduser -SDH -g "nginx_group" -s /sbin/nologin nginx_user

COPY --chown=nginx_user:nginx_group --from=builder /app/dist/frontend .

RUN touch /var/run/nginx.pid && chown -R nginx_user:nginx_group /var/log/nginx /var/cache/nginx /var/run/nginx.pid

USER nginx_user

EXPOSE 80

ENTRYPOINT ["nginx", "-g", "daemon off;"]

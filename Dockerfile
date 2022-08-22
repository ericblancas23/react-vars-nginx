FROM node:16 as builder
WORKDIR /app
COPY package.json .
RUN npm install
COPY . .
RUN npm run build

FROM  nginx:alpine
WORKDIR /app
COPY  --from=builder /app/build /app
RUN apk update && \
    apk upgrade --no-cache && \
    apk add --no-cache bash nginx python3 py3-jinja2 && 
COPY ./script/entrypoint.sh /
COPY ./deploy/nginx.conf /etc/nginx/nginx.conf
COPY ./scripts/env.jinja2 /app
COPY ./scripts/generate_env.py /app
EXPOSE 8080
RUN chmod +x /entrypoint.sh
ENTRYPOINT [ "/entrypoint.sh" ]
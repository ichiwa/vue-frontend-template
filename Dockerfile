FROM alpine:3.7
RUN apk add --update nginx python && rm -rf /var/cache/apk/*
RUN mkdir -p /tmp/nginx/client-body
RUN nginx -v

COPY containers/nginx/config/nginx.conf /etc/nginx/nginx.conf
COPY containers/nginx/config/default.conf /etc/nginx/conf.d/default.conf
COPY dist /usr/share/nginx/html

CMD ["nginx", "-g", "daemon off;"]

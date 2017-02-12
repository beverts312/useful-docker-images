FROM beverts312/alpine

ENV CONFD_VERSION 0.11.0

ADD https://github.com/kelseyhightower/confd/releases/download/v${CONFD_VERSION}/confd-${CONFD_VERSION}-linux-amd64 /bin/confd

RUN apk add --update nginx && \
    rm -rf /var/cache/apk/* /src && \
    chown -R nginx:www-data /var/lib/nginx &&\
    ln -sf /dev/stdout /var/log/nginx/access.log && \
    ln -sf /dev/stderr /var/log/nginx/error.log && \
    chmod +x /bin/confd
    
ADD root /

EXPOSE 80

ENTRYPOINT ["/bin/start.sh"]
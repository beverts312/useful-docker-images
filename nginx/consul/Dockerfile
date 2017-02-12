FROM beverts312/alpine

ENV CONSUL_TEMPLATES_VERSION 0.14.0
ENV CONSUL_TEMPLATES_SHA256 7c70ea5f230a70c809333e75fdcff2f6f1e838f29cfb872e1420a63cdf7f3a78

ADD https://releases.hashicorp.com/consul-template/${CONSUL_TEMPLATES_VERSION}/consul-template_${CONSUL_TEMPLATES_VERSION}_linux_amd64.zip /tmp/templates.zip

RUN echo "${CONSUL_TEMPLATES_SHA256}  /tmp/templates.zip" > /tmp/templates.sha256 &&\
    sha256sum -c /tmp/templates.sha256 &&\
    cd /bin &&\
    unzip /tmp/templates.zip &&\
    chmod +x /bin/consul-template &&\
    rm /tmp/templates.zip &&\
    apk add --update nginx && \
    rm -rf /var/cache/apk/* && \
    chown -R nginx:www-data /var/lib/nginx

ADD root /

EXPOSE 80

ENTRYPOINT ["/bin/start.sh"]
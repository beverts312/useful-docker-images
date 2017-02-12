FROM alpine:3.2

ENV VERSION=0.5.1 
ENV SHA256=7319b6514cb5ca735d9886d7b7e1ed8730ee38b238bb1626564436b824206d12

WORKDIR /vault

ADD https://releases.hashicorp.com/vault/${VERSION}/vault_${VERSION}_linux_amd64.zip vault_${VERSION}_linux_amd64.zip

RUN echo "${SHA256}  vault_${VERSION}_linux_amd64.zip" | sha256sum -cw &&\
    unzip vault_${VERSION}_linux_amd64.zip &&\
    rm -r vault_${VERSION}_linux_amd64.zip

ADD /src /vault

ENTRYPOINT ["./init.sh"]
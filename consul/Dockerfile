FROM alpine:3.2

ARG CONSUL_VERSION=0.6.3
ARG CONSUL_SHA256=b0532c61fec4a4f6d130c893fd8954ec007a6ad93effbe283a39224ed237e250
ARG CONSUL_UI_SHA256=93bbb300cacfe8de90fb3bd5ede7d37ae6ce014898edc520b9c96a676b2bbb72

ADD https://releases.hashicorp.com/consul/${CONSUL_VERSION}/consul_${CONSUL_VERSION}_web_ui.zip /tmp/ui.zip
ADD https://releases.hashicorp.com/consul/${CONSUL_VERSION}/consul_${CONSUL_VERSION}_linux_amd64.zip /tmp/consul.zip
ADD /src /consul

RUN mkdir /consul/ui &&\
    echo "${CONSUL_SHA256}  /tmp/consul.zip" > /tmp/consul.sha256 &&\
    sha256sum -c /tmp/consul.sha256 &&\
    echo "${CONSUL_UI_SHA256}  /tmp/ui.zip" > /tmp/ui.sha256 &&\
    sha256sum -c /tmp/ui.sha256 &&\
    cd /bin &&\
    unzip /tmp/consul.zip &&\
    chmod +x /bin/consul &&\
    rm /tmp/consul.zip &&\
    cd ../consul/ui &&\
    unzip /tmp/ui.zip &&\
    rm /tmp/ui.zip


EXPOSE 8300 8301 8301/udp 8302 8302/udp 8400 8500 8600 8600/udp

VOLUME /data

ENTRYPOINT ["/consul/init.sh"]
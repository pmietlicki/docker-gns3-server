FROM alpine

# Install the magic wrapper.
ADD ./start.sh /start.sh
ADD ./config.ini /config.ini

RUN mkdir /data && \
    apk upgrade --no-cache

RUN apk add --no-cache py3-multidict dnsmasq cpulimit docker dynamips qemu-img qemu-system-x86_64 ubridge vpcs wget; exit 0

RUN apk add --no-cache gns3-server --repository=http://dl-cdn.alpinelinux.org/alpine/edge/community && \
    wget -O /usr/bin/vpcs https://github.com/GNS3/vpcs/releases/download/v0.8beta1/vpcs

CMD [ "/start.sh" ]

WORKDIR /data

VOLUME ["/data"]

FROM alpine:latest

RUN apk -U add \
        python3 \
        gcc \
        libffi-dev \
        libxml2-dev \
        libxslt-dev \
        musl-dev \
        libressl-dev \
        python-dev \
        py-imaging \
        py-pip \
        curl ca-certificates \
    && update-ca-certificates \
    && rm -rf /var/cache/apk/* \
    && pip install --upgrade pip \
    && pip install Scrapy

WORKDIR /runtime/app

COPY entrypoint.sh /runtime/entrypoint.sh
RUN chmod +x /runtime/entrypoint.sh

ENTRYPOINT ["/runtime/entrypoint.sh"]
CMD ["scrapy"]

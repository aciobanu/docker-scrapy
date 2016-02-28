FROM alpine:latest

RUN apk -U add \
        gcc \
        libffi-dev \
        libxml2-dev \
        libxslt-dev \
        musl-dev \
        openssl-dev \
        python-dev \
        py-pip \
    && rm -rf /var/cache/apk/*

RUN pip install Scrapy

WORKDIR /runtime/app

COPY entrypoint.sh /runtime/entrypoint.sh
ENTRYPOINT ["/runtime/entrypoint.sh"]
CMD ["scrapy"]

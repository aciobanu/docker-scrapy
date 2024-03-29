FROM alpine:latest

ENV BUILD_DEPS gcc \
    cargo \
    musl-dev

RUN apk -U add \
        ${BUILD_DEPS} \
        libffi-dev \
        libxml2-dev \
        libxslt-dev \
        openssl-dev \
        libressl-dev \
        python3-dev \
        py-pip \
        curl \
        ca-certificates \
    && update-ca-certificates \
    && pip install --upgrade pip \
    && pip install Scrapy \
    && apk -U del ${BUILD_DEPS} \
    && rm -rf /var/cache/apk/*

WORKDIR /runtime/app

COPY entrypoint.sh /runtime/entrypoint.sh
RUN chmod +x /runtime/entrypoint.sh

ENTRYPOINT ["/runtime/entrypoint.sh"]
CMD ["scrapy"]

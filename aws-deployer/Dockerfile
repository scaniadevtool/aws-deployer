FROM python:3.6-alpine3.7

RUN apk --no-cache update && \
    apk --no-cache add ca-certificates groff less jq bash && \
    pip --no-cache-dir install awscli && \
    rm -rf /var/cache/apk/*

WORKDIR /data

COPY entrypoint.sh /
COPY assume.sh / 

COPY VERSION . 

RUN ln -s /assume.sh /usr/bin/assume && \
    chmod +x /entrypoint.sh && \
    chmod +x /assume.sh

ENTRYPOINT [ "/entrypoint.sh" ]
CMD ["--help"]

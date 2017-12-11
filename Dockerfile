FROM adferrand/backuppc

COPY check.pl /

RUN apk update && apk --no-cache add \
        g++ \
    && rm -rf /var/cache/apk/* \
    && chmod 744 /check.pl


HEALTHCHECK \
    --interval=1m \
    --timeout=3s \
    --start-period=30s \
    --retries=3 \
    CMD /check.pl || exit 1

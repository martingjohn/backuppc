FROM adferrand/backuppc

RUN apk update && apk --no-cache add \
        g++ \
     && rm -rf /var/cache/apk/*

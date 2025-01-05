FROM alpine

EXPOSE 8080

COPY . /usr/src/app

RUN apk add --no-cache wget tar && \
    wget -qO- https://go.dev/dl/go1.16.linux-amd64.tar.gz | tar xvz -C /usr/local && \
    mkdir /lib64 && ln -s /lib/libc.musl-x86_64.so.1 /lib64/ld-linux-x86-64.so.2 && \
    apk del wget tar && \
    adduser -D appuser && \
    cd /usr/src/app && \
    /usr/local/go/bin/go build


# env variables
ENV PORT=8080 REQUEST_ORIGIN=http://127.0.0.1:5000

WORKDIR /usr/src/app
USER appuser

CMD ["./server"]
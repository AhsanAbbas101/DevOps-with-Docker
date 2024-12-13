FROM ubuntu

EXPOSE 8080

# install go
RUN apt-get update && apt-get install -y wget tar
RUN wget -qO- https://go.dev/dl/go1.16.linux-amd64.tar.gz | tar xvz -C /usr/local


WORKDIR /usr/src/app

# copy and build
COPY . .
RUN /usr/local/go/bin/go build

# env variables
ENV PORT=8080 REQUEST_ORIGIN=https://example.com

CMD ["./server"]
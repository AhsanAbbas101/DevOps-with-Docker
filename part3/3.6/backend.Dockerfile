FROM ubuntu

EXPOSE 8080
WORKDIR /usr/src/app
COPY . .

RUN apt-get update && apt-get install -y wget tar && \
  wget -qO- https://go.dev/dl/go1.16.linux-amd64.tar.gz | tar xvz -C /usr/local && \
  rm -rf /var/lib/apt/lists/* && \
  useradd -m appuser && \
  /usr/local/go/bin/go build
  
USER appuser

CMD ["./server"]

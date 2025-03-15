FROM golang:1.16-alpine

EXPOSE 8080
WORKDIR /usr/src/app
COPY . .

RUN go build \
  && adduser -D appuser \
  && rm -rf cache common controller pgconnection router go.mod go.sum

  
USER appuser

CMD ["./server"]

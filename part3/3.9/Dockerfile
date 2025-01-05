FROM golang:1.16-alpine as build-stage

WORKDIR /usr/src/app

COPY . .
RUN CGO_ENABLED=0 GOOS=linux go build -ldflags="-s -w" -o server -v .



FROM scratch

EXPOSE 8080

ENV PORT=8080 REQUEST_ORIGIN=http://127.0.0.1:5000

COPY --from=build-stage /usr/src/app/server /server


CMD ["./server"]
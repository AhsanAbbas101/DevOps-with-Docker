FROM ubuntu:22.04

RUN apt-get update
RUN apt-get install -y curl

WORKDIR /usr/shr/app

COPY script.sh .

RUN chmod +x script.sh

CMD ./script.sh
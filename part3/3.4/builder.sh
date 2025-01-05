#!/bin/sh

# docker run -it -v C:\Users\ahsan\OneDrive\Desktop\Test\3.3\builder.sh:/usr/local/app/builder.sh  ubuntu:22.04

if [ $# -ne 2 ]; then
  echo "Missing argument(s). Provide Github repository and  Docker Hub repository as arguments. Exiting..."
  return 1
fi

git clone https://github.com/"$1"
cd `basename "$1" .git`
rm -rf .git

docker build . -t "$2"
docker login --username $DOCKER_USERNAME --password $DOCKER_TOKEN
docker push "$2"
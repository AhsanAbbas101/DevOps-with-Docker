FROM node:16

EXPOSE 5000

WORKDIR /usr/src/app

# install node packages
COPY package* ./
RUN npm install && npm install -g serve

# build project 
COPY . .
RUN npm run build

# run 
CMD ["serve", "-s", "-l", "5000", "build"]











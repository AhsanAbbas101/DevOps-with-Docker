FROM node:16-alpine

EXPOSE 5000

WORKDIR /usr/src/app

# install node packages
COPY package* ./
RUN npm install && npm install -g serve

# build project 
COPY . .
RUN REACT_APP_BACKEND_URL=http://localhost/api npm run build && \
    adduser -D appuser

USER appuser

# run 
CMD ["serve", "-s", "-l", "5000", "build"]











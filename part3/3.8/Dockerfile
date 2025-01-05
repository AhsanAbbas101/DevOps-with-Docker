FROM node:16-alpine as build-stage

WORKDIR /usr/src/app

# install node packages
COPY package* ./
RUN npm install

# build project 
COPY . .
RUN REACT_APP_BACKEND_URL=http://localhost/api npm run build 



FROM nginxinc/nginx-unprivileged:stable-alpine-slim
EXPOSE 8080

COPY --from=build-stage /usr/src/app/build /usr/share/nginx/html

CMD ["nginx", "-g", "daemon off;"]

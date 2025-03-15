FROM node:16-alpine

EXPOSE 5000

WORKDIR /usr/src/app

COPY . .
RUN npm ci \
  && npm install -g serve \
  && npm cache clean --force \
  && npm run build \
  && adduser -D appuser \
  && rm -rf src

USER appuser

# run 
CMD ["serve", "-s", "-l", "5000", "build"]








FROM node:16

EXPOSE 5000

WORKDIR /usr/src/app

COPY . .
RUN npm ci \
  && npm install -g serve \
  && npm cache clean --force \
  && npm run build \
  && useradd -m appuser

USER appuser

# run 
CMD ["serve", "-s", "-l", "5000", "build"]

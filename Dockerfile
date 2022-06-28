FROM node:18-alpine3.15 as tools

WORKDIR  /app

ADD package.json package-lock.json ./

RUN npm ci --omit=dev

FROM node:18-alpine3.15

WORKDIR /app

COPY --from=tools /app .

ADD server.js ./

CMD ["node","server.js"]
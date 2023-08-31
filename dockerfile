# ▼ Export application
FROM node:18.17.1 AS EXPORT
ARG APP_NAME
WORKDIR /export
RUN npm i -g turbo
COPY . .
RUN turbo prune --scope @apps/$APP_NAME --out-dir out

# ▼ Build application
FROM node:18.17.1-alpine AS RUNNER
ARG APP_NAME
WORKDIR /app
RUN apk add curl
RUN apk add --no-cache tzdata && \
  cp /usr/share/zoneinfo/Asia/Seoul /etc/localtime && \
  echo "Asia/Seoul" > /etc/timezone && \
  apk del tzdata
COPY --from=EXPORT /export/out .
RUN npm ci --production
RUN npm run build
WORKDIR /app/apps/$APP_NAME
RUN chmod +x ./entrypoint.sh
ENTRYPOINT [ "./entrypoint.sh" ]
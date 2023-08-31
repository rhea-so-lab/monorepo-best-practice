# ▼ Export application
FROM node:18.17.1 AS exporter
ARG APP_NAME
WORKDIR /export
RUN npm i -g turbo
COPY . .
RUN turbo prune --scope @apps/$APP_NAME --out-dir out

# ▼ Build application
FROM node:18.17.1-alpine AS runner
ARG APP_NAME
WORKDIR /app
COPY --from=exporter /export/out .
RUN npm install
RUN npm run build
WORKDIR /app/apps/$APP_NAME
RUN chmod +x ./entrypoint.sh
ENTRYPOINT [ "./entrypoint.sh" ]
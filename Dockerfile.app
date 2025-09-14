# syntax=docker/dockerfile:1
# App image derived from the compose service "app" (nocobase)
# Adjust ARG/ENV values as needed and DO NOT hard-code secrets for production.

FROM nocobase/nocobase:latest-full

# Build-time overrides (can be passed with --build-arg APP_KEY=...)
ARG APP_KEY=your-secret-key
ARG TZ=UTC

# Runtime environment (mirrors docker-compose.yml). You can still override at run time.
ENV APP_KEY=${APP_KEY} \
    TZ=${TZ} \
    DB_DIALECT=postgres \
    DB_HOST=postgres \
    DB_PORT=5432 \
    DB_DATABASE=nocobase \
    DB_USER=nocobase \
    DB_PASSWORD=nocobase

# Storage volume as used in docker-compose (./storage mapped to /app/nocobase/storage)
VOLUME ["/app/nocobase/storage"]

# Expose the HTTP port provided by the base image
EXPOSE 80

# (Optional) If you have custom plugins or code, copy them here, e.g.:
# COPY ./plugins /app/nocobase/packages/plugins
# RUN yarn workspace @nocobase/app build  # Example build step if needed

# Base image already contains entrypoint & CMD for NocoBase.

FROM node:12.16-buster-slim AS builder
WORKDIR /app
COPY . /app
RUN yarn && yarn build


FROM nginx:latest AS app
RUN mkdir -p /opt/app
COPY --from=builder /app/build /opt/app

COPY nginx.conf /etc/nginx/nginx.conf

FROM python:3-bullseye as builder

RUN apt-get update && apt-get install -y \
    npm \
    git \
    make \
    g++

RUN git clone https://github.com/ohdsi/ares

RUN cd /ares

WORKDIR /ares
RUN npm install && npm run build && true

FROM nginx:1.22-alpine as server
LABEL maintainer="edenceHealth ohdsi-containers <https://edence.health/>"

COPY --from=builder /ares/dist/ /usr/share/nginx/html/ares
COPY --from=builder /ares/dist/ /usr/share/nginx/html
COPY --from=builder /ares/dist/ /ares

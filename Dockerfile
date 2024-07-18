FROM node:22 as builder

ARG AG="apt-get -yq --no-install-recommends"
ARG DEBIAN_FRONTEND="noninteractive"

RUN set -eux; \
  $AG update; \
  $AG install \
    build-essential \
    g++ \
  ;

WORKDIR /build

ARG GIT_REF="development"
RUN set -eux; \
  git clone https://github.com/ohdsi/ares.git /build; \
  if [ -n "$GIT_REF" ]; then git checkout "${GIT_REF}"; fi;

RUN npm install
ARG NODE_OPTIONS="--max_old_space_size=4096"
RUN npm run build

RUN ln -s /data dist/data

FROM nginxinc/nginx-unprivileged:1-alpine
LABEL maintainer="edenceHealth NV <info@edence.health>"

COPY --from=builder /build/dist /usr/share/nginx/html/ares
COPY --from=builder /build/dist/index.html /usr/share/nginx/html/
COPY env/ /usr/share/nginx/html/env/
VOLUME /data

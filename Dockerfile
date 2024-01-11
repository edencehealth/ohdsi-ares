FROM node:18 as builder

ARG AG="apt-get -yq --no-install-recommends"
RUN set -eux; \
  $AG update; \
  $AG install \
    build-essential \
    g++ \
  ;

ARG GIT_REF=""

WORKDIR /build
RUN set -eux; \
  git clone https://github.com/ohdsi/ares /build; \
  if [ -n "$GIT_REF" ]; then git checkout "${GIT_REF}"; fi; \
  :

RUN npm install
RUN npm run build

FROM nginxinc/nginx-unprivileged:1-alpine
LABEL maintainer="edenceHealth NV <info@edence.health>"

COPY --from=builder /build/dist /usr/share/nginx/html/ares
# the nginx user doesn't have permission to modify the default index file
USER root
RUN set -eux; \
  INDEX="/usr/share/nginx/html/index.html"; \
  rm "$INDEX"; \
  ln -s ares/index.html "$INDEX";
USER nginx

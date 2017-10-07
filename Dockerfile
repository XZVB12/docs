FROM alpine:3.6

VOLUME /var/blog /var/_built

ARG VERSION=0.29

RUN apk add --no-cache -t .build-deps curl git mercurial \
  && echo "===> Install Hugo..." \
  && curl -sSL https://github.com/gohugoio/hugo/releases/download/v${VERSION}/hugo_${VERSION}_Linux-64bit.tar.gz \
    | tar -xzf - -C /tmp \
  && mv /tmp/hugo /usr/bin/hugo \
  && rm -rf /tmp/* \
  && apk del --purge .build-deps

WORKDIR /docs

COPY . .
RUN apk add --no-cache git \
  && echo "===> Install hugo-material-docs Theme..." \
  && git clone https://github.com/digitalcraftsman/hugo-material-docs.git themes/hugo-material-docs \
  && echo "===> Build website..." \
  && hugo --theme=hugo-material-docs \
  && rm -rf themes/hugo-material-docs/.git \
  && apk del --purge git

# COPY config.templ config.toml
# COPY hyde-overrides.css themes/hyde-x/static/css/
# COPY poole-overrides.css themes/hyde-x/static/css/
COPY entrypoint.sh /

EXPOSE 80 443

ENTRYPOINT /entrypoint.sh

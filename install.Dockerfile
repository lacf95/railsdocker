ARG RUBY_VERSION=3.1.4

FROM ruby:${RUBY_VERSION}-alpine

RUN apk update; \
    apk add --no-cache --virtual .build-deps \
      build-base \
      linux-headers \
      git \
      yarn \
      less

ARG APP_NAME=sample-app
ARG RAILS_VERSION

ARG U_NAME=docker
ARG U_UID=1000
ARG U_GID=1000

RUN addgroup \
      --system \
      --gid "${U_GID}" \
      "${U_NAME}"

RUN adduser \
      --disabled-password \
      --system \
      --gecos "" \
      --ingroup "${U_NAME}" \
      --uid "${U_UID}" \
      "${U_NAME}"

USER "${U_UID}:${U_GID}"

ENV HOME_PATH "/home/${U_NAME}"
ENV APP_NAME "${APP_NAME}"

WORKDIR "${HOME_PATH}"

RUN [ -z "${RAILS_VERSION}" ] && gem install rails || gem install "rails:${RAILS_VERSION}"

CMD rails new "${APP_NAME}" --database=postgresql --skip-bundle

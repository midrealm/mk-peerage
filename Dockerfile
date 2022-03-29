ARG RUBY_VERSION=2.7.5
FROM ruby:${RUBY_VERSION}

ARG BUNDLER_VERSION=2.3.10
ARG UNAME=app
ARG UID=1000
ARG GID=1000

LABEL maintainer="nique.rio@gmail.com"

RUN apt-get update -yqq && apt-get install -yqq --no-install-recommends \
  apt-transport-https

RUN curl -sL https://deb.nodesource.com/setup_12.x | bash -

RUN curl -sS https://dl.yarnpkg.com/debian/pubkey.gpg | apt-key add -
RUN echo "deb https://dl.yarnpkg.com/debian/ stable main" | \
  tee /etc/apt/sources.list.d/yarn.list

RUN apt-get update -yqq && apt-get install -yqq --no-install-recommends \
  nodejs \
  yarn

RUN yarn policies set-version 1.22.18


RUN gem install bundler:${BUNDLER_VERSION}

RUN groupadd -g ${GID} -o ${UNAME}
RUN useradd -m -d /app -u ${UID} -g ${GID} -o -s /bin/bash ${UNAME}
RUN mkdir -p /gems && chown ${UID}:${GID} /gems

ENV BUNDLE_PATH /gems

WORKDIR /app
CMD ["bin/rails", "s", "-b", "0.0.0.0"]

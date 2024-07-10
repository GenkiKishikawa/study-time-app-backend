FROM ruby:3.2-bullseye

# install postgresql-client
RUN apt-get update -qq && apt-get install -y --no-install-recommends \
  postgresql-client && \
  apt-get clean && \
  rm -rf /var/lib/apt/lists/*

WORKDIR /backend

COPY Gemfile /backend/Gemfile
COPY Gemfile.lock /backend/Gemfile.lock
RUN gem install bundler
RUN gem update --system && \
  bundle install

COPY . /backend/

RUN useradd developer --create-home --shell /bin/bash && \
  chown -R developer db log storage tmp
USER developer:developer

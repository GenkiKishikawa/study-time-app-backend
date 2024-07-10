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

# Railsサーバーの起動
EXPOSE 3000

CMD ["rails", "server", "-b", "0.0.0.0"]
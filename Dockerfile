FROM ruby:2.6.0-alpine

RUN apk add --update build-base postgresql-dev tzdata
RUN gem install bundler
RUN gem install rails -v '5.2.2'

WORKDIR /app
ADD Gemfile Gemfile.lock /app/
RUN bundle install

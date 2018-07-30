FROM ruby:2.5

RUN apt-get update -qq && apt-get install -y build-essential libpq-dev nodejs
RUN mkdir /ciderchain_api
WORKDIR /ciderchain_api
COPY Gemfile /ciderchain_api/Gemfile
COPY Gemfile.lock /ciderchain_api/Gemfile.lock
RUN bundle install
COPY . /ciderchain_api

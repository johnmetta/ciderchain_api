FROM ruby:2.5 as server

RUN apt-get update -qq && apt-get install -y build-essential libpq-dev nodejs
RUN mkdir /server
WORKDIR /server
COPY Gemfile /server/Gemfile
COPY Gemfile.lock /server/Gemfile.lock
RUN bundle install
COPY . /server
EXPOSE 8080
CMD ["rails", "s", "-p", "8080", "-b", "0.0.0.0"]

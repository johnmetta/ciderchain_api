<<<<<<< HEAD
FROM ruby:2.5

RUN apt-get update -qq && apt-get install -y build-essential libpq-dev nodejs
RUN mkdir /ciderchain_api
WORKDIR /ciderchain_api
COPY Gemfile /ciderchain_api/Gemfile
COPY Gemfile.lock /ciderchain_api/Gemfile.lock
RUN bundle install
COPY . /ciderchain_api
=======
FROM ruby:2.5 as server

RUN apt-get update -qq && apt-get install -y build-essential libpq-dev nodejs
RUN mkdir /server
WORKDIR /server
COPY api/Gemfile /server/Gemfile
COPY api/Gemfile.lock /server/Gemfile.lock
RUN bundle install
COPY api /server
#RUN rails db:create
#RUN rails db:migrate
#RUN rails db:seed
EXPOSE 3000
CMD ["rails", "server", "-b", "0.0.0.0"]

FROM node:10.7.0 as client

# set working directory
RUN mkdir /client
WORKDIR /client

# add `/client/node_modules/.bin` to $PATH
ENV PATH /client/node_modules/.bin:$PATH

# install and cache app dependencies
COPY web/package.json /client/package.json
COPY web/src /client/src
COPY web/public /client/public
RUN yarn

# start app
CMD ["yarn", "start"]
>>>>>>> Move to Docker container

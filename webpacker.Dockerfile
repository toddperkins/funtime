FROM ruby:3.0.1

# Install nodejs
RUN apt-get update -qq && apt-get install -y nodejs

# Add Yarn repository
RUN curl -sS https://dl.yarnpkg.com/debian/pubkey.gpg | apt-key add -
RUN echo "deb https://dl.yarnpkg.com/debian/ stable main" | tee /etc/apt/sources.list.d/yarn.list

# Update
RUN apt-get update -y

# Install Yarn
RUN apt-get install yarn -y

RUN apt-get install npm -y
RUN npm rebuild node-sass

ADD . /usr/src/app
WORKDIR /usr/src/app

# Install & run bundler
RUN gem install bundler

RUN bundle

CMD ./docker-entrypoint.sh

CMD rm -f tmp/pids/server.pid

CMD bin/rails server -b 0.0.0.0
FROM ruby:2.5.0

# Install dependencies
RUN apt-get update && \
DEBIAN_FRONTEND=noninteractive apt-get install -y \
build-essential nano && \
apt-get clean && \
rm -rf /var/lib/apt/lists/* /tmp/* /var/tmp/*

RUN gem install bundler -v 1.16.6
WORKDIR /app
COPY Gemfile /app/Gemfile
COPY Gemfile.lock /app/Gemfile.lock
RUN bundle install

# Install the application
COPY . /app
FROM ruby:2.5.3
RUN curl -sL https://deb.nodesource.com/setup_10.x | bash - && apt-get update && apt-get install -y nodejs --no-install-recommends && rm -rf /var/lib/apt/lists/*
RUN mkdir /app_name

ENV APP_ROOT /app_name
WORKDIR $APP_ROOT

ADD ./Gemfile $APP_ROOT/Gemfile
ADD ./Gemfile.lock $APP_ROOT/Gemfile.lock
RUN apt-get update && apt-get -y install vim
RUN bundle install

ADD . $APP_ROOT
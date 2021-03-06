FROM ruby:2.4.4-alpine
RUN apk update -q
RUN apk add build-base

ENV APP_PATH=/opt/currencylayer

RUN mkdir -p $APP_PATH
ADD currency_layer.gemspec $APP_PATH/
ADD Gemfile* $APP_PATH/

WORKDIR $APP_PATH
RUN bundle install
ADD . $APP_PATH

CMD ["rspec", "spec", "-fd"]


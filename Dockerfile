# どのイメージを基にするか
FROM ruby:2.6.0
MAINTAINER sota2502 <delphsot@gmail.com>
EXPOSE 3000

ENV BUNDLER_VERSION 1.17.2
ENV WORK_DIR /var/www/webapp

RUN apt-get install -y git bzip2 gcc make

COPY . $WORK_DIR
WORKDIR $WORK_DIR

RUN bundle install --path vendor/bundle

CMD bundle exec unicorn -c unicorn.rb -E development

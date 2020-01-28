FROM ruby:2.7.0-alpine

ENV LANG C.UTF-8

RUN mkdir -p /opt/app

WORKDIR /opt/app

RUN apk --update add bash postgresql-dev libstdc++ tzdata libcurl less curl

COPY Gemfile* /opt/app/

RUN apk --update add --virtual build-dependencies ruby-dev build-base git && \
        bundle install && \
        apk del build-dependencies

COPY . /opt/app/

CMD ["./start_docker.sh"]

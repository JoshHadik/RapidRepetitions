FROM ruby:2.5.3

RUN apt-get update -qq && apt-get install -y build-essential libpq-dev nodejs

ARG UID
RUN adduser rails --uid=$UID --disabled-password --gecos ""

ENV APP /usr/src/alpha_thunder_nova
RUN mkdir $APP
WORKDIR $APP

COPY Gemfile* $APP/
RUN bundle install

COPY . $APP/

ENTRYPOINT ["sh", "docker_entrypoint.sh"]
CMD ["bundle", "exec", "rails", "server", "-p", "8080", "-b", "0.0.0.0"]

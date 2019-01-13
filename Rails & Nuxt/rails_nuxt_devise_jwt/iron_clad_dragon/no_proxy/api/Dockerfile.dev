FROM ruby:2.6.0-alpine
RUN apk add --no-cache --update build-base \
                                linux-headers \
                                postgresql-dev \
                                tzdata
WORKDIR '/app'
COPY Gemfile* ./
RUN bundle install
COPY . ./

ENTRYPOINT ["sh", ".docker_entrypoint.sh"]
CMD ["bundle", "exec", "rails", "server", "-b", "0.0.0.0", "-p", "4000"]

FROM ruby:3.0.0

RUN apt-get update -qq && apt-get install -y nodejs postgresql-client

RUN mkdir /myapp

WORKDIR /myapp

COPY Gemfile /myapp/Gemfile

COPY Gemfile.lock /myapp/Gemfile.lock

RUN bundle install

COPY . /myapp

COPY entrypoint.sh /usr/bin/
RUN chmod +x /usr/bin/entrypoint.sh
ENTRYPOINT ["entrypoint.sh"]
EXPOSE 8080

CMD ["rails", "server", "-b", "0.0.0.0"]

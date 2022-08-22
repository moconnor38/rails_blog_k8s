FROM ruby:3.1.2

RUN apt-get update && apt-get install -y nodejs postgresql-client

WORKDIR /blog
COPY Gemfile /blog/Gemfile
COPY Gemfile.lock /blog/Gemfile.lock
RUN bundle install

COPY entrypoint.sh /usr/bin/
RUN chmod +x /usr/bin/entrypoint.sh
ENTRYPOINT ["entrypoint.sh"]

COPY . .

EXPOSE 3000

CMD ["rails", "server", "-b", "0.0.0.0"]

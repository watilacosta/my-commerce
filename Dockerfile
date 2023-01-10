FROM ruby:3.2.0-bullseye

RUN apt-get update -qq && apt-get install -y build-essential \
    postgresql-client \
    libpq-dev

WORKDIR /home/api
COPY Gemfile /home/api/Gemfile
COPY Gemfile.lock /home/api/Gemfile.lock
RUN bundle install

RUN chown -R $USER:$USER .

COPY entrypoint.sh /usr/bin/
RUN chmod +x /usr/bin/entrypoint.sh
ENTRYPOINT ["entrypoint.sh"]
EXPOSE 3000

CMD ["rails", "server", "-b", "0.0.0.0"]

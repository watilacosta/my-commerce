FROM ruby:3.2.0-bullseye

ARG USERNAME=user-name-goes-here
ARG USER_UID=1000
ARG USER_GID=$USER_UID

RUN groupadd --gid $USER_GID $USERNAME \
    && useradd --uid $USER_UID --gid $USER_GID -m $USERNAME \
    && apt-get update -qq \
    && apt-get install -y  build-essential postgresql-client libpq-dev sudo \
    && echo $USERNAME ALL=\(root\) NOPASSWD:ALL > /etc/sudoers.d/$USERNAME \
    && chmod 0440 /etc/sudoers.d/$USERNAME

USER $USERNAME

WORKDIR /home/api
COPY Gemfile /home/api/Gemfile
COPY Gemfile.lock /home/api/Gemfile.lock
RUN bundle install

COPY entrypoint.sh /usr/bin/
RUN sudo chmod +x /usr/bin/entrypoint.sh
ENTRYPOINT ["entrypoint.sh"]
EXPOSE 3000

CMD ["rails", "server", "-b", "0.0.0.0"]

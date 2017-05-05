FROM ruby:2.4

RUN mkdir /src
WORKDIR /src
# This is a bit of a hack to avoid a bundler warning. Bundler always expects
# the user's home dir to be writeable, but we don't have a home dir for our user
# so we set one to a writeable dir
ENV HOME=/src

EXPOSE 8080
CMD ["bundle", "exec", "unicorn", "-c", "unicorn.rb"]

# Optimisation: copy the Gemfiles and bundle install first to enable docker to
# use cached layers
COPY Gemfile Gemfile
COPY Gemfile.lock Gemfile.lock
RUN bundle install

COPY . .

RUN chmod -R ug+rw /src && \
    chown 1001:0 /src
USER 1001

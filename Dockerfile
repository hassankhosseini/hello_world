FROM iron/ruby:dev

RUN mkdir /src
WORKDIR /src

# Optimisation: copy the Gemfiles and bundle install first to enable docker to use cached layers
COPY Gemfile Gemfile
COPY Gemfile.lock Gemfile.lock
RUN bundle install

COPY . .

RUN chmod -R g+rw /src
USER 1001

EXPOSE 8080
CMD commands.sh

FROM azohra/cloud-runner:debian-ruby-chrome-beta
MAINTAINER Justin Commu

WORKDIR /tmp
ADD .gitignore .gitignore
ADD ferris.gemspec ferris.gemspec
ADD Gemfile Gemfile
ADD Gemfile.lock Gemfile.lock
RUN bundle install

# Everything up to here was cached. This includes the bundle install, unless the Gemfiles changed. Now copy the app into the image.
RUN mkdir /app
WORKDIR /app
ADD . /app

ENTRYPOINT ["bundle", "exec", "rspec"]

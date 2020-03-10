FROM ruby:2.7
LABEL maintainer="izzychen0611@gmail.com"
RUN bundle install
EXPOSE 9292
ADD ./ /
RUN ls -lrt
CMD bundle exec rackup


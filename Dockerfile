FROM ruby:2.7
LABEL maintainer="izzychen0611@gmail.com"
RUN bundle install
ENV TZ=Australia/Sydney
EXPOSE 8071
ADD ./ ./
RUN ls -lrt
CMD bundle exec rackup


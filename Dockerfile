FROM ruby:2.7
LABEL maintainer="izzychen0611@gmail.com"
EXPOSE 9292
ADD ./ ./
RUN ls -lrt
CMD bundle install &&  bundle exec rackup -o 0.0.0.0 -p 9292 config.ru

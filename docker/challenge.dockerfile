FROM ruby:alpine

RUN apk add --no-cache --update \ 
            build-base \
            nodejs \
            tzdata \
            sqlite-dev
            
RUN gem update --system 

WORKDIR /var/www/api

COPY ./Gemfile .
COPY ./Gemfile.lock .

RUN bundle install

EXPOSE 3030
EXPOSE 1080
EXPOSE 1025
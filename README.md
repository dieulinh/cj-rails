# README

This README would normally document whatever steps are necessary to get the
application up and running.

Things you may want to cover:

* Ruby version 2.5.5

### Configuration
* Change value of config/webpack/{development.js or production.js} 
 where your server url is

### Database initialization

* Postgresql

### How to run the test suite

bundle exec rspec

### Deployment instructions


* Sample demo
https://cj-rails.herokuapp.com/



Development
===========


To start a new development env, run the following:

1.  bundle
2.  bundle exec rake db:create db:migrate
3.  yarn
3.  bundle exec rails s
5.  ./bin/webpack-dev-server (in another terminal)

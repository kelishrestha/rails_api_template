Rails API template
=========

This application is used for building rails API apps.

## Technology

1. Ruby v2.3.1
2. Rails v5.0
3. Rails API

## Setup
### System dependencies

    bundle install

### Configuration

    ./configure

### Database

    bundle exec rails db:create

    bundle exec rails db:migrate

    bundle exec rails db:test:prepare


### Run application

    bundle exec rails s -p 3000

### How to run the test suite

    bundle exec rspec
      or
    COVERAGE=true bundle exec rspec
      or
    bundle exec guard [Watches every file save and runs the specs]
    (make changes Guardfile that suits your need)

### How to run code analyzers

* Rubocop

        bundle exec rubocop

* Rubycritic

        bundle exec rubycritic
          or
        bundle exec reek [Runs in console]

### Interactive Session via Terminal

    bundle exec rails c

### Services
    - Job Queues
    - Cache Servers
    - Search Engines
    - Error Service(Authorization Error etc)
    - Others

### Deployment instructions
    For testing on production purpose only. Go for [Digital Ocean](http://www.digitalocean.com) or [Amazon Web Services](https://aws.amazon.com)

    herkou login
    heroku create
    git push heroku master

# README

Rails app with the defaults I like to build with :)

## Overview

  * users
  * accounts
  * admin/users
  * code standards
  * github actions
  * health check

## Setup

  - bundle install
  - yarn install
  - Search and replace
  - Create DB
  - Migrate DB

## System dependencies

  - Ruby version: 3.1
  - postgresql
  - redis
  - nodejs
  - yarn

## Configuration

## Database creation

    rails db:create
    rails db:migrate

## How to run the test suite

    rails test

## Services (job queues, cache servers, search engines, etc.)

## Deployment instructions

### Setup overcommit

    overcommit --sign
    overcommit --sign --pre-commit
    overcommit --install

### Code coverage

Run code converage

    COVERAGE=1 rails test

That will output a report to converage/index.html. Use `CI=1` to output JSON for continuous itegration.

## Gems

### Auth

- [X] [Devise](https://github.com/heartcombo/devise)
- [ ] Pundit
- [ ] PunditCan (new lib?)
- [ ] User Roles (new lib?)
- [ ] Pretender

### UI / Views

- [ ] ViewComponents
- [X] [Slim Rails](https://github.com/slim-template/slim)
- [X] [Premailer Rails](https://github.com/fphilipe/premailer-rails)
- [X] [Heroicon](https://github.com/bharget/heroicon)
- [X] [Pagy](https://github.com/ddnexus/pagy)
- [X] [Simple Form](https://github.com/heartcombo/simple_form)

### Jobs

- [X] [Sidekiq](https://github.com/mperham/sidekiq)
- [X] [Sidekiq Scheduler]()

### API

- [ ] jwt
- [ ] versionist

## Development

- [X] [Exception Notification](https://github.com/smartinez87/exception_notification)
- [X] [Minitest Spec](https://github.com/minitest/minitest-rails)
- [X] [FactoryBot](https://github.com/thoughtbot/factory_bot_rails)
- [ ] Lookbook
- [X] [OverCommit](https://github.com/sds/overcommit)
- [X] [Guard](https://github.com/guard/guard)
- [X] [Guard Minitest](https://github.com/guard/guard-minitest)
- [X] [Annotate](https://github.com/ctran/annotate_models)
- [X] [Faker](https://github.com/faker-ruby/faker)
- [X] [Letter Opener](https://github.com/ryanb/letter_opener)
- [X] Solargraph
- [X] Ordinare
- [X] Slim Lint
- [X] Standard
- [X] StandardJS
- [X] StyleLint
- [X] [VCR](https://github.com/vcr/vcr)
- [X] Webmock
- [X] Simplecov
- [X] Brakeman

## Generators

- [ ] Services
- [ ] Polciy
- [ ] Scaffold
- [ ] Worker

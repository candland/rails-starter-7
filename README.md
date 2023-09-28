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

```bash
git clone git@github.com:candland/rails-starter-7.git new_project
```

### Find & Replae

Change database names in database.yml

```bash
rg -l 'RailsStarter7' | xargs -n 1 sed -i '' -e 's/RailsStarter7/NewProject/g'
rg -l 'RAILS_STARTER_7' | xargs -n 1 sed -i '' -e 's/RAILS_STARTER_7/NEW_PROJECT/g'
rg -l 'rails_starter_7' | xargs -n 1 sed -i '' -e 's/rails_starter_7/new_project/g'
rg -l 'rails-starter-7' | xargs -n 1 sed -i '' -e 's/rails-starter-7/new-project/g'
rg -l 'Rails Starter 7' | xargs -n 1 sed -i '' -e 's/Rails Starter 7/New Project/g'

rg -i 'rails[- _]*starter[- _]*7'
```

```bash
bundle install
yarn install
bin/rails db:create
bin/rails db:migrate
```

## System dependencies

  - Ruby version: 3.1
  - postgresql
  - redis
  - nodejs
  - yarn

## Configuration

Credential files.

```yaml
jwt_secret:
secret_key_base:
```

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
- [X] [Pundit](https://github.com/varvet/pundit)
- [X] [PunditCan](https://github.com/candland/pundit_can)
- [X] [User Roles](https://github.com/candland/masked_attribute)
- [X] [Pretender](https://github.com/ankane/pretender)

### UI / Views

- [x] [Subcomponent](https://github.com/candland/subcomponent/)
- [X] [Slim Rails](https://github.com/slim-template/slim)
- [X] [Premailer Rails](https://github.com/fphilipe/premailer-rails)
- [X] [Heroicon](https://github.com/bharget/heroicon)
- [X] [Pagy](https://github.com/ddnexus/pagy)
- [X] [Simple Form](https://github.com/heartcombo/simple_form)

### Jobs

- [X] [Sidekiq](https://github.com/mperham/sidekiq)
- [X] [Sidekiq Scheduler]()

### API

- [x] [API Pie](https://github.com/Apipie/apipie-rails)
- [x] [JWT](https://github.com/jwt/ruby-jwt)
- [x] [Versionist](https://github.com/bploetz/versionist)

## Development

- [X] [Exception Notification](https://github.com/smartinez87/exception_notification)
- [X] [Minitest Spec](https://github.com/minitest/minitest-rails)
- [X] [FactoryBot](https://github.com/thoughtbot/factory_bot_rails)
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

- [x] Services
- [x] Policy
- [x] Worker
- [ ] Scaffold


## API

```bash
curl -v -H 'content-type: application/json' -d '{"email":"candland+xyz@gmail.com","password":"password"}' 'localhost:3000/api/v1/auth'

{"token":"eyJhbGciOiJIUzI1NiJ9.eyJ1c2VyX2lkIjoiYTUyZjgzNDItZWQzZC00NzlkLThkZWEtODYzMTI5OTk5OGM0In0.iZPRhTwCnudSV_dxzNmhe_CuMc5fiFd0RRHcsGkLr0Q"}


curl -v -H 'content-type: application/json' -H 'authorization: Bearer eyJhbGciOiJIUzI1NiJ9.eyJ1c2VyX2lkIjoiYTUyZjgzNDItZWQzZC00NzlkLThkZWEtODYzMTI5OTk5OGM0In0.ZE0P602LJLKFwTlvOtnMZ6clF-QpqVY0q7P-7KP3-9k' 'localhost:3000/api/v1/me'
```


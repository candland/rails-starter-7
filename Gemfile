source "https://rubygems.org"
git_source(:github) { |repo| "https://github.com/#{repo}.git" }

ruby "~> 3.2.0"

# Rails
gem "image_processing", "~> 1.2"
gem "importmap-rails"
gem "pg", "~> 1.1"
gem "puma", "~> 6.0"
gem "rails", "~> 7.1.0"
gem "redis", "~> 5.0"
gem "rexml"
gem "sprockets-rails"
gem "stimulus-rails"
gem "tailwindcss-rails"
gem "turbo-rails"

# Auth
gem "devise"
gem "pundit_can"

# API
gem "apipie-rails"
gem "jbuilder", "~> 2.7"
gem "jwt"
gem "maruku" # Needed for APIPIE
gem "versionist"

# UI / Views
gem "heroicon"
gem "pagy", "~> 6.0"
gem "pretender"
gem "simple_form"
gem "slim-rails"
gem "subcomponent"
# gem "view_component"
# After View_component!
# gem "lookbook"

# Emails
gem "inky-rb", require: "inky"
gem "premailer-rails"

# Background
gem "sidekiq"
gem "sidekiq-scheduler"

# Monitoring
gem "exception_notification"

# Utils
gem "http"
gem "masked_attribute"

# Windows does not include zoneinfo files, so bundle the tzinfo-data gem
gem "tzinfo-data", platforms: %i[mingw mswin x64_mingw jruby]

# Reduces boot times through caching; required in config/boot.rb
gem "bootsnap", require: false

group :development, :test do
  # See https://guides.rubyonrails.org/debugging_rails_applications.html#debugging-with-the-debug-gem
  gem "brakeman"
  gem "debug", platforms: %i[mri mingw x64_mingw]
  gem "factory_bot_rails"
  gem "faker"
  gem "minitest-rails"
end

group :development do
  gem "annotate"

  # Testing
  gem "guard"
  gem "guard-minitest"
  gem "letter_opener"

  # Code
  gem "ordinare", require: false
  gem "overcommit", require: false
  gem "simplecov", require: false
  gem "slim_lint", require: false
  gem "solargraph"
  gem "standard", require: false

  # Use console on exceptions pages [https://github.com/rails/web-console]
  gem "web-console"

  # Add speed badges [https://github.com/MiniProfiler/rack-mini-profiler]
  gem "rack-mini-profiler"
end

group :test do
  # Use system testing [https://guides.rubyonrails.org/testing.html#system-testing]
  gem "capybara"
  gem "selenium-webdriver"
  gem "webdrivers"

  # HTTP
  gem "vcr"
  gem "webmock"
end

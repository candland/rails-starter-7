if ENV["COVERAGE"].present?
  require "simplecov"
  require "simplecov_json_formatter"
  SimpleCov.start "rails" do
    if ENV["CI"]
      formatter SimpleCov::Formatter::JSONFormatter
    else
      formatter SimpleCov::Formatter::MultiFormatter.new([
        SimpleCov::Formatter::SimpleFormatter,
        SimpleCov::Formatter::HTMLFormatter
      ])
    end
    add_group "Admin", ["app/controllers/admin"]
    add_group "Components", ["app/components"]
    add_group "Services", ["app/services"]
    add_group "Workers", ["app/workers"]
  end
end
ENV["RAILS_ENV"] ||= "test"
require_relative "../config/environment"
require "rails/test_help"
require "minitest/rails"

# Consider setting MT_NO_EXPECTATIONS to not add expectations to Object.
# ENV["MT_NO_EXPECTATIONS"] = true

class ActiveSupport::TestCase
  include FactoryBot::Syntax::Methods

  # Run tests in parallel with specified workers
  unless ENV["COVERAGE"].present?
    parallelize(workers: :number_of_processors)
  end

  # Setup all fixtures in test/fixtures/*.yml for all tests in alphabetical order.
  # fixtures :all

  # Add more helper methods to be used by all tests here...
end

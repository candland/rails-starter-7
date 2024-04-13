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
require "vcr"
require "sidekiq/testing"

# Consider setting MT_NO_EXPECTATIONS to not add expectations to Object.
# ENV["MT_NO_EXPECTATIONS"] = true

Sidekiq::Testing.fake!

VCR.configure do |config|
  config.cassette_library_dir = "test/cassettes"
  config.hook_into :webmock
  config.allow_http_connections_when_no_cassette = false
  config.ignore_localhost = true
  # config.debug_logger = $stderr
end

class ActiveSupport::TestCase
  include FactoryBot::Syntax::Methods

  # Run tests in parallel with specified workers
  unless ENV["COVERAGE"].present?
    parallelize(workers: :number_of_processors)
  end

  # Setup all fixtures in test/fixtures/*.yml for all tests in alphabetical order.
  # fixtures :all

  # Add more helper methods to be used by all tests here...

  # Pundit Helpers
  def assert_permit(user, record, action)
    msg = "User #{user.inspect} should be permitted to #{action} #{record}, but isn't permitted"
    assert permit(user, record, action), msg
  end

  def refute_permit(user, record, action)
    msg = "User #{user.inspect} should NOT be permitted to #{action} #{record}, but is permitted"
    refute permit(user, record, action), msg
  end

  def permit(user, record, action)
    index = self.class.name.index("Policy")
    klass = self.class.name[0, index + 6]
    only_record = Array.wrap(record).last
    klass.constantize.new(user, only_record).public_send(:"#{action}?")
  end

  def assert_permissions(current_user, record, permissions_hash = {})
    permissions_hash.each do |action, should_be_permitted|
      if should_be_permitted
        assert_permit current_user, record, action
      else
        refute_permit current_user, record, action
      end
    end

    # Make sure all default actions were tested
    unused_actions = [:index, :show, :edit, :update, :new, :create, :destroy] - permissions_hash.keys
    assert unused_actions.empty?, "The following actions were not tested: #{unused_actions}"
  end
  # /Pundit Helpers
end

class ActionDispatch::IntegrationTest
  before { host! "example.com" }
end

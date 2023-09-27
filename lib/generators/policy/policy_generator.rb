# frozen_string_literal: true

class PolicyGenerator < ::Rails::Generators::NamedBase
  source_root File.expand_path("templates", __dir__)

  class_option :parent, type: :string, default: "ApplicationPolicy"

  check_class_collision suffix: "Policy"

  def create_policy
    template "policy.rb.erb", File.join("app/policies", class_path, "#{file_name}_policy.rb")
  end

  hook_for :test_framework

  private

  def parent_class
    options["parent"]
  end
end

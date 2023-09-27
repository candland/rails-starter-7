# frozen_string_literal: true

module TestUnit
  module Generators
    class PolicyGenerator < ::Rails::Generators::NamedBase
      source_root File.expand_path("templates", __dir__)

      def create_policy_test
        template "policy_test.rb.erb", File.join("test/policies", class_path, "#{file_name}_policy_test.rb")
      end

      private

      def scoped_value
        if class_path.count > 0
          "[:#{class_path.first.underscore}, @#{file_name.underscore}]"
        else
          "@#{file_name.underscore}"
        end
      end
    end
  end
end

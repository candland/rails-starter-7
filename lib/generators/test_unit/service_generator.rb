# frozen_string_literal: true

module TestUnit
  module Generators
    class ServiceGenerator < Rails::Generators::NamedBase
      source_root File.expand_path("templates", __dir__)

      check_class_collision

      def copy_service_test_file
        template "service_test.rb.erb", File.join("test/services/", *class_path, "#{file_name}_test.rb")
      end
    end
  end
end

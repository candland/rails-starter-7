# frozen_string_literal: true

module TestUnit
  module Generators
    class WorkerGenerator < Rails::Generators::NamedBase
      source_root File.expand_path("templates", __dir__)

      check_class_collision suffix: "Worker"

      def copy_worker_test_file
        template "worker_test.rb.erb", File.join("test/workers/", *class_path, "#{file_name}_worker_test.rb")
      end
    end
  end
end

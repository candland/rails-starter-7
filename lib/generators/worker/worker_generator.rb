# frozen_string_literal: true

class WorkerGenerator < Rails::Generators::NamedBase
  source_root File.expand_path("templates", __dir__)

  check_class_collision suffix: "Worker"

  def copy_worker_file
    template "worker.rb.erb", File.join("app/workers/", *class_path, "#{file_name}_worker.rb")
  end

  hook_for :test_framework
end

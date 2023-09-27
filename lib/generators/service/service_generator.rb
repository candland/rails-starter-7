class ServiceGenerator < Rails::Generators::NamedBase
  source_root File.expand_path("templates", __dir__)

  check_class_collision

  def copy_service_file
    template "service.rb.erb", File.join("app/services/", *class_path, "#{file_name}.rb")
  end

  hook_for :test_framework
end

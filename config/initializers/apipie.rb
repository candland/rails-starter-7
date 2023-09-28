Apipie.configure do |config|
  config.app_name = "RailsStarter7"
  config.copyright = "&copy; 2023 RailsStarter7"
  config.app_info["1.0"] = <<~EOS
    This is a REST based API. Parameter can be sent as form data or JSON. When submitting JSON, the 'Content-Type' header should be set to 'application/json'.

    The API required authentication. You can manage API Tokens in this dashboard or create a new one with the Authentication API using your email and password.

    Requests are authenticated using the 'Authorization' header with the value 'Bearer TOKEN', where TOKEN is the JWT token.
  EOS
  config.compress_examples = true
  config.api_base_url = "/api"
  config.doc_base_url = "/developer/apipie"
  config.translate = false
  config.show_all_examples = true
  config.namespaced_resources = true
  config.markup = Apipie::Markup::Markdown.new
  config.api_controllers_matcher = "#{Rails.root}/app/controllers/api/**/*.rb"
end

Sidekiq.configure_server do |config|
  config.redis = {
    url: ENV.fetch(
      "REDIS_URL",
      Rails.application.credentials.dig(:redis, :url) || "redis://localhost:6379/8"
    )
  }

  config.death_handlers << lambda do |worker, ex|
    ExceptionNotifier.notify_exception(
      ex,
      worker: worker
    )
  end

  if Rails.env != "development"
    config.logger.level = Logger::WARN
  end

  config.on :startup do
    ActiveRecord::Base.clear_active_connections!
  end
end

Sidekiq.configure_client do |config|
  config.redis = {
    url: ENV.fetch(
      "REDIS_URL",
      Rails.application.credentials.dig(:redis, :url) || "redis://localhost:6379/8"
    )
  }
end

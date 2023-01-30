class HealthController < ApplicationController
  skip_scoped_check :status
  skip_authorized_check :status

  def status
    render status: 200, json: {
      status: 200,
      database: database,
      redis: redis,
      sidekiq: sidekiq
    }
  end

  private

  def sidekiq
    processes = Sidekiq::ProcessSet.new
    [processes.count > 0, processes]
  rescue => e
    [false, {
      message: e.message,
      backtrace: e.backtrace
    }]
  end

  def database
    result = ActiveRecord::Base.connection.exec_query("SELECT 1 as OK;")
    [result.to_a.dig(0, "ok") == 1, result.to_a]
  rescue => e
    [false, {
      message: e.message,
      backtrace: e.backtrace
    }]
  end

  def redis
    redis_config = {
      url: ENV.fetch("HEROKU_REDIS_CRIMSON_URL", "redis://localhost:6379/1"),
      ssl_params: {verify_mode: OpenSSL::SSL::VERIFY_NONE}
    }
    redis = Redis.new(redis_config)
    [redis.ping == "PONG", {}]
  rescue => e
    [false, {
      message: e.message,
      backtrace: e.backtrace
    }]
  end
end

ENV["BUNDLE_GEMFILE"] ||= File.expand_path("../Gemfile", __dir__)
require "bundler/setup"

require "dotenv/load" if %w(development test).include?(ENV.fetch("RAILS_ENV", "development"))

AppConfig = {
  application_server_url: ENV.fetch("APPLICATION_SERVER_URL", "tcp://0.0.0.0:8081"),
  database_reaping_frequency: Integer(ENV.fetch("DATABASE_REAPING_FREQUENCY", 10)),
  database_timeout: Integer(ENV.fetch("DATABASE_TIMEOUT", 5000)),
  database_url: ENV.fetch("DATABASE_URL", ""),
  environment: ENV.fetch("RAILS_ENV", "development"),
  force_ssl: ENV.fetch("FORCE_SSL", "1") == "1",
  max_web_threads: Integer(ENV.fetch("MAX_WEB_THREADS", 16)),
  oauth_google_client_id: ENV.fetch("OAUTH_GOOGLE_CLIENT_ID", ""),
  oauth_google_client_secret: ENV.fetch("OAUTH_GOOGLE_CLIENT_SECRET", ""),
  secret_key_base: ENV.fetch("SECRET_KEY_BASE", ""),
  web_worker_count: Integer(ENV.fetch("WEB_WORKER_COUNT", 4)),
}.freeze

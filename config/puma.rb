require_relative "app_config"

workers AppConfig[:web_worker_count]
threads_count = AppConfig[:max_web_threads]
threads threads_count, threads_count

bind AppConfig[:application_server_url]

preload_app!

environment AppConfig[:environment]

before_fork do
  ActiveRecord::Base.connection_pool.disconnect! if defined?(ActiveRecord)
end

on_worker_boot do
  ActiveRecord::Base.establish_connection if defined?(ActiveRecord)
end

# This file is used by Rack-based servers to start the application.

require_relative "app_config"
require_relative 'config/environment'

run Rails.application

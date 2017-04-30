ENV['RAILS_ENV'] = 'test'
require_relative 'spec_helper'
require File.expand_path('../../config/environment', __FILE__)
require 'rspec/rails'
Dir[Rails.root.join("spec/support/**/*.rb")].sort.each(&method(:require))
abort("The Rails environment is running in production mode!") if Rails.env.production?

module Features

end

RSpec.configure do |config|
  config.include Features, type: :feature
  config.infer_base_class_for_anonymous_controllers = false
  config.fixture_path = "#{::Rails.root}/spec/fixtures"
  config.use_transactional_fixtures = false
  config.infer_spec_type_from_file_location!
  config.filter_rails_from_backtrace!
end

ActiveRecord::Migration.maintain_test_schema!

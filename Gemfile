source "https://rubygems.org"

ruby "2.4.0"

git_source(:github) do |repo_name|
  repo_name = "#{repo_name}/#{repo_name}" unless repo_name.include?("/")
  "https://github.com/#{repo_name}.git"
end

gem "autoprefixer-rails"
gem "bcrypt"
gem "coffee-rails", "~> 4.2"
gem "flutie"
gem "formtastic"
gem "high_voltage", "~> 3.0.0"
gem "jbuilder", "~> 2.5"
gem "jquery-rails"
gem "omniauth-google-oauth2"
gem "omniauth-identity"
gem "pg", "~> 0.18"
gem "puma", "~> 3.0"
gem "rails", "~> 5.0.2"
gem "sass-rails", "~> 5.0"
gem "therubyracer", platforms: :ruby
gem "title"
gem "turbolinks", "~> 5"
gem "twitter-bootstrap-rails"
gem "uglifier", ">= 1.3.0"

group :development do
  gem "listen", "~> 3.0.5"
  gem "spring"
  gem "spring-commands-rspec"
  gem "spring-watcher-listen", "~> 2.0.0"
  gem "web-console", ">= 3.3.0"
  gem 'railroady'
end

group :development, :test do
  gem "awesome_print"
  gem "bundler-audit"
  gem "byebug", platform: :mri
  gem "dotenv-rails"
  gem "factory_girl_rails"
  gem "flog"
  gem "pry-byebug"
  gem "pry-rails"
  gem "rspec-rails", "~> 3.5"
end

group :test do
  gem "capybara"
  gem "database_cleaner"
  gem "poltergeist"
  gem "shoulda-matchers"
  gem "simplecov", require: false
end

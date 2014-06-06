source 'http://rubygems.org'

ruby '2.1.1'

gem 'rails', '4.1.1'
gem 'pg'
gem 'sass-rails', '~> 4.0.0'
gem 'uglifier', '>= 1.3.0'
gem 'coffee-rails', '~> 4.0.0'
gem 'jquery-rails'
gem 'turbolinks'
gem 'unicorn'
gem 'rails_12factor'
gem 'haml'
gem 'redcarpet'
gem 'time_difference', '~> 0.3.2'

group :doc do
  gem 'sdoc', require: false
end

group :development, :test do
  gem 'rspec-rails'
  gem 'foreman'
  gem 'rake'
end

group :test do
  gem 'codeclimate-test-reporter', require: nil
  gem 'database_cleaner', '~> 0.7.1'
  gem 'capybara'
  gem 'factory_girl_rails'
  gem 'simplecov', require: false
end

group :production do
  gem 'newrelic_rpm'
  gem 'rails_log_stdout',           github: 'heroku/rails_log_stdout'
  gem 'rails3_serve_static_assets', github: 'heroku/rails3_serve_static_assets'
end

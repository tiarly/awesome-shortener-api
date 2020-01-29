# frozen_string_literal: true

source 'https://rubygems.org'

ruby '2.7.0'

gem 'rails', '~> 6.0.2', '>= 6.0.2.1'

gem 'bootsnap', '>= 1.4.2', require: false
gem 'fast_jsonapi'
gem 'pg', '>= 0.18', '< 2.0'
gem 'puma', '~> 4.1'
gem 'rack-cors'
gem 'strong_migrations'

group :development, :test do
  gem 'byebug', platforms: %i[mri mingw x64_mingw]
  gem 'factory_bot_rails'
  gem 'pry-rails'
  gem 'reek', require: false
  gem 'rspec-rails'
  gem 'rubocop', require: false
end

group :test do
  gem 'database_cleaner-active_record'
  gem 'simplecov', require: false
  gem 'shoulda-matchers'
end

group :development do
  gem 'listen', '>= 3.0.5', '< 3.2'
end

gem 'tzinfo-data', platforms: %i[mingw mswin x64_mingw jruby]

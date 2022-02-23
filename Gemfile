# frozen_string_literal: true

source 'https://rubygems.org'

ruby '3.0.2'

gem 'pg'
gem 'sinatra'
gem 'sinatra-contrib'
gem 'webrick'
gem 'sequel'
gem 'rake'
gem 'dotenv'

group :test do
  gem 'capybara'
  gem 'rspec'
  gem 'simplecov', require: false
  gem 'simplecov-console', require: false
end

group :development, :test do
  gem 'rubocop', '1.20'
end

# frozen_string_literal: true

require 'sequel'
require 'dotenv/load'

desc 'Resets the test database'
task :test_database_setup do
  p 'Resetting database...'
  DB = Sequel.connect("postgres://#{ENV['TEST_DB_USER']}:#{ENV['TEST_DB_PASSWORD']}@#{ENV['TEST_HOST']}:#{ENV['TEST_PORT']}/makersbnb_test")

  # Clear the database
  DB.run('TRUNCATE customers RESTART IDENTITY CASCADE')
end

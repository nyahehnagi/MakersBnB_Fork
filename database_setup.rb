require 'sequel'
require 'dotenv/load'


if ENV['RACK_ENV'] == 'test'
  test_connection = "postgres://#{ENV['TEST_DB_USER']}:#{ENV['TEST_DB_PASSWORD']}@#{ENV['TEST_HOST']}:#{ENV['TEST_PORT']}/makersbnb_test"
  DB = Sequel.connect(test_connection) 
else #if in Development
  dev_connection = "postgres://#{ENV['DEV_DB_USER']}:#{ENV['DEV_DB_PASSWORD']}@#{ENV['DEV_HOST']}:#{ENV['DEV_PORT']}/makersbnb"
  DB = Sequel.connect(dev_connection)
end

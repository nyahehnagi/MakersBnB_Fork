require 'sequel'

if ENV['RACK_ENV'] == 'test'
  DB = Sequel.connect('postgres://makers_user:password@localhost:5432/makersbnb_test') 
else #if in Development
  DB = Sequel.connect('postgres://makers_user:password@localhost:5432/makersbnb')
end

require 'sequel'

desc "Resets the test database"
task :test_database_setup do
  p "Resetting database..."
  DB = Sequel.connect('postgres://makers_user:password@localhost:5432/makersbnb_test') 

  # Clear the database
  DB.run("TRUNCATE customers RESTART IDENTITY CASCADE")

end
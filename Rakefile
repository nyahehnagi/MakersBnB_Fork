require 'sequel'
require 'dotenv/load'

desc "Resets the test database"
task :test_database_setup do
  p "Resetting database..."

  # Clear the database
  DB.run("TRUNCATE customers RESTART IDENTITY CASCADE")

end



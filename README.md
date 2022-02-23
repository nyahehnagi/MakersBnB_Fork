# MAKER HOUSE A HOME

This is a web application that allows users to list spaces they have available, and to hire spaces for the night, so they can have the dream get-away they fully deserve.

## Tech Stack
For this app we will be using the following tech stack:
- Ruby
- Sinatra 
- PostgreSQL
- Capybara (Feature testing)
- RSPEC (Test framework)
- HTML/CSS (Web-rendering)
- Sequel for Object Relational Mapping

## Installation
----------------------
Install gems with [bundler](https://bundler.io/ "bundler") 
~~~~
$> bundle install 
~~~~
To install code from the latest source
~~~~
git@github.com:nyahehnagi/makers_bnb.git
~~~~

## Testing
-----------------------
To run rspec tests
~~~~
$> rspec
~~~~


## To run the sinatra webserver locally
-----------------------
To run a locally hosted server of the site
~~~~
$> rackup
~~~~

Navigate to http://localhost:9292/

## Environment configuration

This app uses environmment variables for database and configuration. Create a `.env` file in the app root

This file needs to contain the following:
~~~~
TEST_DB_USER=<your username>
TEST_DB_PASSWORD=<your password>
TEST_HOST=<localhost>
TEST_PORT=<port of database>

DEV_DB_USER=<your username>
DEV_DB_PASSWORD=<your password>
DEV_HOST=<localhost>
DEV_PORT=<port of database>
~~~~

a typical example would look like this
~~~~
TEST_DB_USER=bromley
TEST_DB_PASSWORD=pa55w0rd
TEST_HOST=localhost
TEST_PORT=5432
~~~~

## Database Setup
----------------------
Install [postgresql](https://www.postgresql.org/download/ "postgresql")  according to your operating system

Ensure you have set up your user database as part of the posgresql install

Once within psql use the command line to complete the following steps (note, the .sql files are located within db/migrations folder):

~~~~
00_create_database.sql

\c makersbnb
01_create_table_customer.sql
02_create_table_space.sql
03_create_table_bookings.sql
04_alter_table_customers.sql

\c makersbnb_test
01_create_table_customer.sql
02_create_table_space.sql
03_create_table_bookings.sql
04_alter_table_customers.sql
~~~~


You may get database permission issues, if so please look [here](https://tableplus.com/blog/2018/04/postgresql-how-to-grant-access-to-users.html "here") for more information on how to grant permissions 

----------------------

## User Stories:

**Any signed-up user can list a new space.**
~~~~
As an Owner
So I can show off my properties
I would like to add my space
~~~~
**Users can list multiple spaces.**
~~~~
As an Owner
So I can show off my properties
I would like to be able to add multiple spaces
~~~~
**Users should be able to name their space, provide a short description of the space, and a price per night.**
~~~~
As an Owner
So I can entice Customers
I would like to name, describe and price my space
~~~~
**Users should be able to offer a range of dates where their space is available.**
~~~~
As an Owner
So I can show availability
I would like to be able to show when my space is free
~~~~
**Any signed-up user can request to hire any space for one night, and this should be approved by the user that owns that space.**
~~~~
As a Customer
So I can have a great night out
I would like to make a request to hire the space for one night
~~~~
~~~~
As an Owner
So that I am happy with the Customers request
I can approve their request
~~~~
**Nights for which a space has already been booked should not be available for users to book that space.**
~~~~
As a Space
So that I can't be double booked
I would like customers to only be able book available dates
~~~~
**Until a user has confirmed a booking request, that space can still be booked for that night.**
~~~~
As a Space
So that I can be booked
I am still available until the owner confirms a booking
~~~~

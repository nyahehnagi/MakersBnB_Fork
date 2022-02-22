# MAKER HOUSE A HOME

This is a web application that allows users to list spaces they have available, and to hire spaces for the night, so they can have their dream get-away they fully deserve.

## Tech Stack
For this app we will be using the following tech stack:
- Ruby
- Sinatra 
- PostgreSQL
- Capybara (Feature testing)
- RSPEC (Test framework)
- HTML/CSS (Web-rendering)
- Sequel for Object Relational Mapping

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

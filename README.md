Chitter Challenge
=================

This is my version of Chitter Challenge set by Makers. Please see the brief from Makers [here](#Features).

# Getting Started

## Initial set up

- You will need Ruby installed, this project uses version 2.7.2
- Clone this repository to your local machine and navigate to the root of the project

`$ git@github.com:JLBrigham/chitter-challenge.git`
`$ cd chitter-challenge`

- Run bundle to install the gems, if you do not already have bundler installed you will need to install this first

`$ gem install bundler`
`$ bundle`

### Setting up the databases

- This app uses a PostgreSQL database, so you will need to install and set up Postgres:

  * Using a package manager such as Homebrew is recommended
  * You can install Homebrew [here](https://brew.sh/)
  * Then install PostgreSQL with: `$ brew install postgresql`
  * After Homebrew has downloaded PostgreSQL it will show you some installation instructions: follow them!
  * Next run: `$ brew services start postgresql` to keep PostgreSQL running in the background

- Connect to PostgreSQL using the command `$ psql`
- Create the test database using the psql command `CREATE DATABASE new_chitter_test`
- Connect to the database using the psql command `\c new_chitter_test`
- Run the queries that are saved in this [file] (chitter-challenge/db/migrations/02_create_peeps_test_table.sql)





### How to set up databases

-Connect to psql
-Create the database using the psql command CREATE DATABASE chitter;
-Connect to the database using the pqsl command \c chitter;
-Run the query we have saved in the file 01_create_peeps_table.sql

### How to run the tests

## Set up the test database

-Connect to psql
-Create the database using the psql command CREATE DATABASE chitter_test;
-Connect to the database using the pqsl command \c chitter_test;
-Run the query we have saved in the file 01_create_peeps_table.sql

## Approach

So as to get some more practice making a fully CRUD app I decided to add update and delete functions to peeps. 

# Features:
-------

```
STRAIGHT UP

As a Maker
So that I can let people know what I am doing  
I want to post a message (peep) to chitter

As a maker
So that I can see what others are saying  
I want to see all peeps in reverse chronological order

As a Maker
So that I can better appreciate the context of a peep
I want to see the time at which it was made

As a Maker
So that I can post messages on Chitter as me
I want to sign up for Chitter

HARDER

As a Maker
So that only I can post messages on Chitter as me
I want to log in to Chitter

As a Maker
So that I can avoid others posting messages on Chitter as me
I want to log out of Chitter

ADVANCED

As a Maker
So that I can stay constantly tapped in to the shouty box of Chitter
I want to receive an email if I am tagged in a Peep
```



Notes on functionality:
------

* You don't have to be logged in to see the peeps.
* Makers sign up to chitter with their email, password, name and a username (e.g. samm@makersacademy.com, password123, Sam Morgan, sjmog).
* The username and email are unique.
* Peeps (posts to chitter) have the name of the maker and their user handle.
* Your README should indicate the technologies used, and give instructions on how to install and run the tests.

Bonus:
-----

If you have time you can implement the following:

* In order to start a conversation as a maker I want to reply to a peep from another maker.

And/Or:

* Work on the CSS to make it look good.

Good luck and let the chitter begin!


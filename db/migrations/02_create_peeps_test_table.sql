CREATE DATABASE new_chitter_test;
CREATE TABLE peeps(id SERIAL PRIMARY KEY, name VARCHAR(60), username VARCHAR(60), peep VARCHAR(200), time TIMESTAMP DEFAULT CURRENT_TIMESTAMP);
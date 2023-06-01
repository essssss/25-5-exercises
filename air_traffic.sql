-- from the terminal run:
-- psql < air_traffic.sql

DROP DATABASE IF EXISTS air_traffic;

CREATE DATABASE air_traffic;

\c air_traffic

-- CREATE TABLE tickets
-- (
--   id SERIAL PRIMARY KEY,
--   first_name TEXT NOT NULL,
  
--   seat TEXT NOT NULL,
--   departure TIMESTAMP NOT NULL,
--   arrival TIMESTAMP NOT NULL,
--   airline TEXT NOT NULL,
--   from_city TEXT NOT NULL,
--   from_country TEXT NOT NULL,
--   to_city TEXT NOT NULL,
--   to_country TEXT NOT NULL
-- );

-- INSERT INTO tickets
--   (first_name, last_name, seat, departure, arrival, airline, from_city, from_country, to_city, to_country)
-- VALUES
-- 1  ('Jennifer', 'Finch', '33B', '2018-04-08 09:00:00', '2018-04-08 12:00:00', 'United', 'Washington DC', 'United States', 'Seattle', 'United States'),

-- 2  ('Thadeus', 'Gathercoal', '8A', '2018-12-19 12:45:00', '2018-12-19 16:15:00', 'British Airways', 'Tokyo', 'Japan', 'London', 'United Kingdom'),

-- 3  ('Sonja', 'Pauley', '12F', '2018-01-02 07:00:00', '2018-01-02 08:03:00', 'Delta', 'Los Angeles', 'United States', 'Las Vegas', 'United States'),

-- 4  ('Jennifer', 'Finch', '20A', '2018-04-15 16:50:00', '2018-04-15 21:00:00', 'Delta', 'Seattle', 'United States', 'Mexico City', 'Mexico'),

-- 5  ('Waneta', 'Skeleton', '23D', '2018-08-01 18:30:00', '2018-08-01 21:50:00', 'TUI Fly Belgium', 'Paris', 'France', 'Casablanca', 'Morocco'),

-- 6  ('Thadeus', 'Gathercoal', '18C', '2018-10-31 01:15:00', '2018-10-31 12:55:00', 'Air China', 'Dubai', 'UAE', 'Beijing', 'China'),

-- 7  ('Berkie', 'Wycliff', '9E', '2019-02-06 06:00:00', '2019-02-06 07:47:00', 'United', 'New York', 'United States', 'Charlotte', 'United States'),

-- 8  ('Alvin', 'Leathes', '1A', '2018-12-22 14:42:00', '2018-12-22 15:56:00', 'American Airlines', 'Cedar Rapids', 'United States', 'Chicago', 'United States'),

-- 9  ('Berkie', 'Wycliff', '32B', '2019-02-06 16:28:00', '2019-02-06 19:18:00', 'American Airlines', 'Charlotte', 'United States', 'New Orleans', 'United States'),

-- 10  ('Cory', 'Squibbes', '10D', '2019-01-20 19:30:00', '2019-01-20 22:45:00', 'Avianca Brasil', 'Sao Paolo', 'Brazil', 'Santiago', 'Chile');

CREATE TABLE flights
  (
  id SERIAL PRIMARY KEY,
  departure TIMESTAMP NOT NULL,
  from_city_id INTEGER NOT NULL,
  arrival TIMESTAMP NOT NULL,
  to_city_id INTEGER NOT NULL,
  airline_id INTEGER NOT NULL
  );

CREATE TABLE passengers
  (
  id SERIAL PRIMARY KEY,
  first_name TEXT NOT NULL,
  last_name TEXT NOT NULL
  );

CREATE TABLE airlines
  (
  id SERIAL PRIMARY KEY ,
  name TEXT NOT NULL
  );

CREATE TABLE tickets
  (
  id SERIAL PRIMARY KEY,
  flight_id INTEGER NOT NULL,
  passenger_id INTEGER NOT NULL,
  seat TEXT NOT NULL
  );

CREATE TABLE cities
  (
  id SERIAL PRIMARY KEY,
  name TEXT NOT NULL,
  country INTEGER NOT NULL
  );

CREATE TABLE countries
  (
  id SERIAL PRIMARY KEY,
  name TEXT NOT NULL
  );


INSERT INTO countries
  (name)
VALUES
  ('United States'),
  ('Japan'),
  ('United Kingdom'),
  ('Mexico'),
  ('France'),
  ('Morocco'),
  ('UAE'),
  ('China'),
  ('Brazil'),
  ('Chile');

INSERT INTO cities 
  (name, country)
VALUES
  ('Washington DC', 1),
  ('Seattle', 1),
  ('Los Angeles', 1),
  ('Las Vegas', 1),
  ('New York', 1),
  ('Charlotte', 1),
  ('Cedar Rapids', 1),
  ('Chicago', 1),
  ('New Orleans', 1),
  ('Tokyo', 2),
  ('London', 3),
  ('Mexico City', 4),
  ('Paris', 5),
  ('Casablanca', 6),
  ('Dubai', 7),
  ('Beijing', 8),
  ('Sao Paolo', 9),
  ('Santiago', 10);

INSERT INTO passengers
  (first_name, last_name)
VALUES
  ('Jennifer', 'Finch'),
  ('Thadeus', 'Gathercoal'),
  ('Sonja', 'Pauley'),
  ('Waneta', 'Skeleton'),
  ('Berkie', 'Wycliff'),
  ('Alvin', 'Leathes'),
  ('Cory', 'Squibbes');

INSERT INTO airlines
  (name)
VALUES
  ('United'),
  ('British Airways'),
  ('Delta'),
  ('TUI Fly Belgium'),
  ('Air China'),
  ('American Airlines'),
  ('Avianca Brasil');

INSERT INTO flights
  (departure, arrival, from_city_id, to_city_id, airline_id)
VALUES
  ('2018-04-08 09:00:00', '2018-04-08 12:00:00', 1, 2, 1),
  ('2018-12-19 12:45:00', '2018-12-19 16:15:00', 10, 11, 2),
  ('2018-01-02 07:00:00', '2018-01-02 08:03:00', 3, 4, 3),
  ('2018-04-15 16:50:00', '2018-04-15 21:00:00', 2, 12, 3),
  ('2018-08-01 18:30:00', '2018-08-01 21:50:00', 13, 14, 4),
  ('2018-10-31 01:15:00', '2018-10-31 12:55:00', 15, 16, 5),
  ('2019-02-06 06:00:00', '2019-02-06 07:47:00', 5, 6, 1),
  ('2018-12-22 14:42:00', '2018-12-22 15:56:00', 7 , 8, 6),
  ('2019-02-06 16:28:00', '2019-02-06 19:18:00', 6, 9, 6),
  ('2019-01-20 19:30:00', '2019-01-20 22:45:00', 17, 18, 7);

INSERT INTO tickets
  (flight_id, passenger_id, seat)
VALUES
  (1, 1, '33B'),
  (2, 2, '8A'),
  (3, 3, '12F'),
  (4, 1, '20A'),
  (5, 4, '23D'),
  (6, 2, '18C'),
  (7, 5, '9E'),
  (8, 6, '1A'),
  (9, 5, '32B'),
  (10, 7, '10D');
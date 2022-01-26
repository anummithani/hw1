-- In this assignment, you'll be building the domain model, database 
-- structure, and data for "KMDB" (the Kellogg Movie Database).
-- The end product will be a report that prints the movies and the 
-- top-billed cast for each movie in the database.

-- Requirements/assumptions
--
-- - There will only be three movies in the database – the three films
--   that make up Christopher Nolan's Batman trilogy
-- - Movie data includes the movie title, year released, MPAA rating,
--   and director
-- - A movie has a single director
-- - A person can be the director of and/or play a role in a movie
-- - Everything you need to do in this assignment is marked with TODO!

-- Rubric
-- 
-- There are three deliverables for this assignment, all delivered via
-- this file and submitted via GitHub and Canvas:
-- - A domain model, implemented via CREATE TABLE statements for each
--   model/table. Also, include DROP TABLE IF EXISTS statements for each
--   table, so that each run of this script starts with a blank database.
--   (10 points)
-- - Insertion of "Batman" sample data into tables (5 points)
-- - Selection of data, so that something similar to the following sample
--   "report" can be achieved (5 points)

-- Submission
-- 
-- - "Use this template" to create a brand-new "hw1" repository in your
--   personal GitHub account, e.g. https://github.com/<USERNAME>/hw1
-- - Do the assignment, committing and syncing often
-- - When done, commit and sync a final time, before submitting the GitHub
--   URL for the finished "hw1" repository as the "Website URL" for the 
--   Homework 1 assignment in Canvas

-- Successful sample output is as shown:

-- Movies
-- ======

-- Batman Begins          2005           PG-13  Christopher Nolan
-- The Dark Knight        2008           PG-13  Christopher Nolan
-- The Dark Knight Rises  2012           PG-13  Christopher Nolan

-- Top Cast
-- ========

-- Batman Begins          Christian Bale        Bruce Wayne
-- Batman Begins          Michael Caine         Alfred
-- Batman Begins          Liam Neeson           Ra's Al Ghul
-- Batman Begins          Katie Holmes          Rachel Dawes
-- Batman Begins          Gary Oldman           Commissioner Gordon
-- The Dark Knight        Christian Bale        Bruce Wayne
-- The Dark Knight        Heath Ledger          Joker
-- The Dark Knight        Aaron Eckhart         Harvey Dent
-- The Dark Knight        Michael Caine         Alfred
-- The Dark Knight        Maggie Gyllenhaal     Rachel Dawes
-- The Dark Knight Rises  Christian Bale        Bruce Wayne
-- The Dark Knight Rises  Gary Oldman           Commissioner Gordon
-- The Dark Knight Rises  Tom Hardy             Bane
-- The Dark Knight Rises  Joseph Gordon-Levitt  John Blake
-- The Dark Knight Rises  Anne Hathaway         Selina Kyle

-- Turns column mode on but headers off
.mode column
.headers off

-- Drop existing tables, so you'll start fresh each time this script is run.
DROP TABLE IF EXISTS actors;
DROP TABLE IF EXISTS movies;
DROP TABLE IF EXISTS actors_movies;

-- Create new tables, according to your domain model
CREATE TABLE actors (
  id INTEGER PRIMARY KEY AUTOINCREMENT,
  real_name TEXT,
  character_name TEXT
);

CREATE TABLE movies (
  id INTEGER PRIMARY KEY AUTOINCREMENT,
  title TEXT,
  year INTEGER,
  rating TEXT,
  director TEXT
);

CREATE TABLE actors_movies (
  id INTEGER PRIMARY KEY AUTOINCREMENT,
  actor_id INTEGER,
  movie_id INTEGER
);


-- Insert data into your database that reflects the sample data shown above
-- Use hard-coded foreign key IDs when necessary
INSERT INTO actors (real_name, character_name)
VALUES ("Christian Bale", "Bruce Wayne");
INSERT INTO actors (real_name, character_name)
VALUES ("Michael Caine", "Alfred");
INSERT INTO actors (real_name, character_name)
VALUES ("Liam Neeson", "Ra's Al Ghul");
INSERT INTO actors (real_name, character_name)
VALUES ("Katie Holmes", "Rachel Dawes");
INSERT INTO actors (real_name, character_name)
VALUES ("Gary Oldman", "Commissioner Gordon");
INSERT INTO actors (real_name, character_name)
VALUES ("Heath Ledger", "Joker");
INSERT INTO actors (real_name, character_name)
VALUES ("Aaron Eckhart", "Harvey Dent");
INSERT INTO actors (real_name, character_name)
VALUES ("Maggie Gyllenhaal", "Rachel Dawes");
INSERT INTO actors (real_name, character_name)
VALUES ("Tom Hardy", "Bane");
INSERT INTO actors (real_name, character_name)
VALUES ("Joseph Gordon-Levitt", "John Blake");
INSERT INTO actors (real_name, character_name)
VALUES ("Anne Hathaway", "Selina Kyle");

INSERT INTO movies (title, year, rating, director)
VALUES ("Batman Begins", 2005, "PG-13", "Christopher Nolan");
INSERT INTO movies (title, year, rating, director)
VALUES ("The Dark Knight", 2008, "PG-13", "Christopher Nolan");
INSERT INTO movies (title, year, rating, director)
VALUES ("The Dark Knight Rises", 2012, "PG-13", "Christopher Nolan");

--SELECT id, real_name FROM actors;
--SELECT id, title FROM movies;
INSERT INTO actors_movies (actor_id, movie_id)
VALUES (1,1);
INSERT INTO actors_movies (actor_id, movie_id)
VALUES (1,2);
INSERT INTO actors_movies (actor_id, movie_id)
VALUES (1,3);
INSERT INTO actors_movies (actor_id, movie_id)
VALUES (2,1);
INSERT INTO actors_movies (actor_id, movie_id)
VALUES (2,2);
INSERT INTO actors_movies (actor_id, movie_id)
VALUES (3,1);
INSERT INTO actors_movies (actor_id, movie_id)
VALUES (4,1);
INSERT INTO actors_movies (actor_id, movie_id)
VALUES (5,1);
INSERT INTO actors_movies (actor_id, movie_id)
VALUES (5,3);
INSERT INTO actors_movies (actor_id, movie_id)
VALUES (6,2);
INSERT INTO actors_movies (actor_id, movie_id)
VALUES (7,2);
INSERT INTO actors_movies (actor_id, movie_id)
VALUES (8,2);
INSERT INTO actors_movies (actor_id, movie_id)
VALUES (9,3);
INSERT INTO actors_movies (actor_id, movie_id)
VALUES (10,3);
INSERT INTO actors_movies (actor_id, movie_id)
VALUES (11,3);


-- Prints a header for the movies output
.print "Movies"
.print "======"
.print ""

-- The SQL statement for the movies output
SELECT title, year, rating, director FROM movies;

-- Prints a header for the cast output
.print ""
.print "Top Cast"
.print "========"
.print ""


-- The SQL statement for the cast output

SELECT movies.title, actors.real_name, actors.character_name from actors_movies
INNER JOIN actors on actors.id = actors_movies.actor_id
INNER JOIN movies on movies.id = actors_movies.movie_id
ORDER BY movies.id;
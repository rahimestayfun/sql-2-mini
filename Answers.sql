##### FOREIGN KEYS - NEW TABLE #####

-- Create a new table called movie with a movie_id, title, and media_type_id.
-- Make media_type_id a foreign key to the media_type_id column on the media_type table.
-- Add a new entry into the movie table with a title and media_type_id.
-- Query the movie table to get your entry.

CREATE TABLE movie(
  movie_id SERIAL,
  title TEXT,
  media_type_id INT REFERENCES media_type(media_type_id));

INSERT INTO movie
(title,media_type_id)
VALUES('HEY', 4);
  
  
##### Foreign Keys - Existing Table #####
-- Add a new column called genre_id that references genre_id on the genre table.
-- Query the movie table to see your entry.

ALTER TABLE movie
   ADD COLUMN genre_id INT REFERENCES genre(genre_id);


##### Updating Rows #####
-- Update the first entry in the movie table to a genre_id of 22.
-- Query the movie table to see your entry.

UPDATE movie
SET genre_id = 22
WHERE movie_id= 1;

SELECT * FROM movie;


##### Using Joins #####
-- Join the artist and album tables to list out the artist name and album name

SELECT al.title, ar.name FROM album al
JOIN artist ar ON al.artist_id=ar.artist_id;


####  Using nested queries/sub-selects #####
-- Use a sub-select statement to get all tracks from the Track table where 
--the genre_id is either Jazz or Blues.

SELECT * FROM track
WHERE genre_id IN(
  SELECT genre_id FROM genre
  WHERE name IN('Jazz','Blues'));
--   WHERE name = 'Jazz' OR name='Blues');


####  Setting values to null  ####

-- Update Phone on the Employee table to null where the EmployeeId is 1.
-- Query the Employee table to get the employee you just updated.

UPDATE employee
SET phone=NULL
WHERE employee_id = 1;

SELECT * FROM employee
WHERE employee_id = 1;


##### Querying a null value #####
-- Get all customers from the customer table who do not have a company.

SELECT * FROM customer
WHERE company IS NULL;


## Group by
-- * Select all artist ids, artist names, and count how many albums they have.


SELECT ar.artist_id, ar.name, COUNT(*) FROM album al
JOIN artist ar ON al.artist_id = ar.artist_id
GROUP BY ar.artist_id;

-- SELECT ar.artist_id, ar.name, COUNT(*) 
-- FROM artist ar
-- JOIN album a ON ar.artist_id = a.artist_id 
-- GROUP BY ar.artist_id;

### Challenge

SELECT ar.artist_id, ar.name, COUNT(*) FROM album al
JOIN artist ar ON al.artist_id = ar.artist_id
GROUP BY ar.artist_id
ORDER BY COUNT(*) DESC;


## Distinct
-- * Get all countries from the `customer` table with no duplicates.

SELECT DISTINCT country FROM customer;

## Delete Rows
-- * Select all records from the `customer` table where fax is null;
-- * Delete all records from the `customer` table where fax is null;

SELECT * FROM customer
WHERE fax IS NULL;

DELETE FROM customer 
WHERE fax IS NULL;



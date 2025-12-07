-- Perform the Problem Queries:

-- a)	Can you get all data about movies? 
SELECT * 
FROM movies;

-- b)	How do you get all data about directors?
SELECT * 
FROM directors;

-- c)	Check how many movies are present in IMDB.
SELECT COUNT(*) AS Total_movies
FROM movies;

-- d)	Find these 3 directors: James Cameron ; Luc Besson ; John Woo
SELECT * 
FROM directors
WHERE Name IN ('James Cameron', 'Luc Besson', 'John Woo');

-- e)	Find all directors with name starting with S.
SELECT *
FROM directors
WHERE Name LIKE 'S%';

-- f)	Count female directors.
SELECT COUNT(*) AS Female_directors_count
FROM directors
WHERE gender = 1;

-- g)	Find the name of the 10th first women directors?
SELECT * 
FROM directors
WHERE gender = 1
order by id 
LIMIT 1 OFFSET 9;

-- h)	What are the 3 most popular movies?
SELECT ID, original_title, title, popularity, release_date
FROM movies
ORDER BY popularity DESC
LIMIT 3;

-- i)	What are the 3 most bankable movies?
SELECT ID, original_title, title, revenue, release_date
FROM movies
ORDER BY revenue DESC
LIMIT 3;

-- j)	What is the most awarded average vote since the January 1st, 2000?
SELECT id, original_title, title, vote_average, vote_count, release_date
FROM movies
WHERE release_date >= '2000-01-01'
AND vote_average = (
    SELECT MAX(vote_average)
    FROM movies
    WHERE release_date >= '2000-01-01'
);

-- k)	Which movie(s) were directed by Brenda Chapman?
SELECT m.id, m.original_title, m.title, m.release_date, d.name AS director
FROM movies m
JOIN directors d ON m.director_id = d.id
WHERE d.name = 'Brenda Chapman';

-- l)	Which director made the most movies?
SELECT d.id, d.name, COUNT(m.id) AS movie_count
FROM directors d
LEFT JOIN movies m ON d.id = m.director_id
GROUP BY d.id, d.name
ORDER BY movie_count DESC
LIMIT 1;

-- m)	Which director is the most bankable?
SELECT d.id, d.name, SUM(m.revenue) AS total_revenue
FROM directors d
LEFT JOIN movies m ON d.id = m.director_id
GROUP BY d.id, d.name
ORDER BY total_revenue DESC
LIMIT 1;




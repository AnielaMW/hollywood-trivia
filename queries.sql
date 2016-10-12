-- 1. What are the top 50 worst rated movies? The results should include the movie title and rating and be sorted by the worst rating first.

SELECT title AS movie, rating
FROM movies
ORDER BY rating
LIMIT 50;

-- 2. What movies do not have a rating? The results should include just the movie titles in sorted order.

SELECT title AS movie
FROM movies
WHERE rating IS NULL
ORDER BY title;

-- 3. What movies have the word "thrilling" in their synopsis? The results should just include the movie title.

SELECT title AS movie
FROM movies
WHERE synopsis LIKE '%thrilling%';

-- 4. What were the highest rated 'Science Fiction & Fantasy' movies released in the 80's? The results should include the movie title, the year released, and rating sorted by highest rating first.

SELECT title AS movie, year, rating
FROM movies
JOIN genres
ON (movies.genre_id = genres.id)
WHERE genres.name = 'Science Fiction & Fantasy'
AND year > 1979
AND year < 1990
ORDER BY rating DESC
LIMIT 20;

-- 5. What actors have starred as James Bond? The results should include the actor name, movie title, year released, and be sorted by year in ascending order (earliest year appears first).

SELECT actors.name AS actor, movies.title AS movie, movies.year AS year
FROM cast_members
JOIN movies
ON (cast_members.movie_id = movies.id)
JOIN actors
ON (cast_members.actor_id = actors.id)
WHERE cast_members.character = 'James Bond'
ORDER BY year;

-- 6. What movies has Julianne Moore starred in? The results should include the movie title, year released, and name of the genre, sorted by genre first and then movie title.

SELECT movies.title AS movie, movies.year AS year, genres.name AS genre
FROM cast_members
JOIN movies
ON (cast_members.movie_id = movies.id)
JOIN actors
ON (cast_members.actor_id = actors.id)
JOIN genres
ON (movies.genre_id = genres.id)
WHERE actors.name = 'Julianne Moore'
ORDER BY genres.name, movies.title;

-- 7. What were the five earliest horror movies and what studios produced them? Include the movie title, year released, and studio name (if any) in the results sorted by year.

SELECT movies.title AS movie, movies.year AS year, studios.name AS studio
FROM movies
LEFT OUTER JOIN studios
ON (movies.studio_id = studios.id)
JOIN genres
ON (movies.genre_id = genres.id)
WHERE genres.name = 'Horror'
ORDER BY year
LIMIT 5;

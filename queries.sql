
-- A
SELECT * 
From Movie
WHERE MovieId='1'

--B Select all information about all actors in a given movie (specify movie)
SELECT A.FirstName, A.LastName, A.DateofBirth, R.Name
FROM Movie M, Actor A, Role R, ActorPlays AP
WHERE M.MovieId = '1'
AND M.MovieId = AP.MovieId 
AND AP.ActorId = A.ActorId
AND A.actorId = R.ActorId;
​
--C Select details of release date, director and studio for a specified movie
SELECT M.DateReleased, D.FirstName, D.LastName, D.Country, S.Name, S.Country
FROM Director D, Movie M, Studio S, Directs DS, Sponsors SP
WHERE M.MovieID = '1'
AND M.MovieId = DS.MovieID
AND DS.DirectorID = D.DirectorID
AND M.MovieID = SP.MovieID
AND SP.StudioID = S.StudioID



--L Get the topic that is the most rated. 
SELECT counter.topicId, T.Description, counter.Su/counter.Co AS result
FROM(
SELECT T.topicId, SUM(av.summ)AS Su, SUM(av.cou)AS Co
FROM (SELECT SUM(W.Rating) AS summ, COUNT(W.Rating) AS cou 
FROM Watches W ) av, Movie M, MovieTopics MT, Topics T, Watches W
WHERE MT.movieId=M.movieId
AND M.MovieID = W.MovieID
AND MT.topicId = T.topicId
GROUP BY T.topicId
ORDER BY T.topicId)AS counter, Topics T
GROUP BY counter.topicID, result, T.DEscription
ORDER BY result DESC
LIMIT 1




--M The top 5 users that give the highest ratings
SELECT U.FirstName, U.LastName,  P.Gender, P.AgeRange, AVG(W.rating) AS rating
FROM Users U, Watches W, Profile P, Movie M
WHERE U.userId = W.userId
AND P.UserID = U.UserID
GROUP BY U.userId, U.FirstName, U.LastName, P.Gender, P.AgeRange
ORDER BY rating DESC
LIMIT 5





--O All users with ratings lower than the rater ""

SELECT U.userId, U.email
FROM Users U,(
	SELECT MIN(W1.rating)AS minimum1, MAX(W2.rating)AS maximum2, W1.userId
	FROM Watches W1, Watches W2
	WHERE NOT(W1.userId = W2.userId)
	AND W2.userId = '16'
	GROUP BY W1.userId
	)num
WHERE U.userId=num.userId
AND num.minimum1 < num.maximum2
GROUP BY U.userId, U.email




--F Names of the top 10 movies of highest overall rating

SELECT M.MovieID, M.Name, rank.average, M.moviepic
FROM (
	SELECT SUM(W.Rating)/count(W.Rating) AS average, M.MovieID AS mo
	FROM Movie M, Watches W
	WHERE M.MovieID = W.MovieID
	GROUP BY M.MovieID)rank, Movie M
WHERE M.MovieID = rank.mo 
GROUP BY rank.average, rank.mo, M.Name, M.MovieID, M.moviepic
ORDER BY rank.average DESC
LIMIT 10



--I Details of movies that were note rated since january 2016

SELECT Mo.MovieID, M.Name, M.DateReleased
FROM (
	SELECT MAX(W.DateWatched)AS dateWatched, W.MovieId
	FROM Watches W
	GROUP BY W.MovieId
	ORDER BY W.MovieID DESC)Mo, Movie M
WHERE NOT(Mo.dateWatched>'2016-1-1')
AND M.MovieID = Mo.MovieID
GROUP BY Mo.MovieID, M.Name, M.DateReleased





--P Show the users with the most diverse ratings for a specific topic



SELECT ratings.userId, U.FirstName, U.LastName, MAX(ratings.big-ratings.small)AS diversities, M.Name, W.Rating
FROM
	(SELECT  MAX(W.rating)AS big, MIN(W.rating)AS small, U.userId
	FROM MovieTopics MT, Movie M, Watches W, Users U
	WHERE MT.topicId ='6'
	AND M.movieId=MT.movieId
	AND W.movieId=M.movieId
	AND U.userId=W.userId
	GROUP BY  U.userId)ratings, Movie M, Watches W, Users U
WHERE U.UserID = ratings.UserID
AND W.UserID = ratings.UserID
AND W.MovieID = M.MovieID
GROUP BY ratings.userId, U.FirstName, U.LastName, M.Name, W.Rating
ORDER BY diversities DESC
LIMIT 6




--D Details of the actor that appeared the most in the movies, with details of 
-- the directors and studios that worked with him

--Actor
SELECT A.ActorId, counts.count, A.FirstName, A.LastName, A.DateofBirth
FROM(
	SELECT COUNT(M.MovieId) AS count, A.ActorId AS act
	FROM Actor A, Movie M, ActorPlays AP
	WHERE A.actorId= AP.ActorId
	AND M.MovieId = AP.MovieId
	GROUP BY A.ActorId)counts, Actor A
WHERE A.actorId = counts.act
GROUP BY counts.count,counts.act, A.FirstName, A.LastName, A.DateofBirth, A.ActorId
ORDER BY counts.count DESC
​LIMIT 1
​
--Directors
SELECT DISTINCT  D.FirstName, D.LastName, D.Country
FROM Actor A, Director D, Directs DS, ActorPlays AP, Movie M
WHERE A.ActorId = '1'
AND AP.ActorId = A.ActorId
AND M.MovieId = AP.MovieId
AND DS.MovieId = M.movieId
AND D.DirectorId = DS.DirectorId
​
--Studios
SELECT DISTINCT S.Name, S.Country
FROM Actor A, Studio S, Sponsors SP, Movie M, ActorPlays AP
WHERE A.ActorId = '1'
AND AP.ActorId = A.ActorId
AND M.MovieId = AP.MovieId
AND SP.MovieId = M.MovieId
AND SP.StudioId = S.StudioId






--K  Gets the movieId of the highest rated movie in a given category (specify topic)
SELECT m.movieId, m.Su/m.Co AS average
FROM(
	SELECT SUM(W.Rating) AS Su, COUNT(W.Rating) AS Co, movies.MovieID
	FROM(
		SELECT  M.MovieID, SUM(W.Rating), COUNT(W.Rating)
		FROM Movie M, MovieTopics MT, Watches W
		WHERE MT.topicId = '1'
		AND M.movieId = MT.movieId
		AND W.MovieID = M.MovieID
		GROUP BY M.MovieID
		)movies, Watches W
		GROUP BY movies.MovieID
	
	)m
	
ORDER BY average DESC
LIMIT 1





--G Details of the top 10 movies and their topics

SELECT M.Name,  M.DateReleased, top.average, T.description
FROM(
SELECT M.MovieID, average AS average
FROM (
	SELECT SUM(W.Rating)/count(W.Rating) AS average, M.MovieID AS mo
	FROM Movie M, Watches W
	WHERE M.MovieID = W.MovieID
	GROUP BY M.MovieID)rank, Movie M
WHERE M.MovieID = rank.mo 
GROUP BY rank.average, rank.mo, M.Name, M.MovieID
ORDER BY rank.average DESC
LIMIT 10) top, Movie M, MovieTopics MT, Topics T
WHERE M.MovieID = top.MovieID 
AND MT.MovieId = M.MovieId
AND MT.TopicId=T.topicId






--J Select all movies and their directors name that recieved any rating below any rating given by user X (specify user)
SELECT M.MovieID, M.Name, M.DateReleased, D.FirstName, D.LastName
FROM Director D, Directs DS, Movie M, Watches W,
	(SELECT MAX(W.Rating) AS rating
	FROM watches W
	WHERE W.userID ='1'
	LIMIT 1
	)topRating
WHERE W.Rating < topRating.rating
AND W.MovieId = M.MovieId
AND DS.MovieId = M.MovieId
AND DS.DirectorId= D.DirectorId
GROUP BY D.FirstName,D.LastName, M.DateReleased, M.Name, M.movieId
ORDER BY M.DateReleased







--N Find the names and profiling information of users who rated
-- the most a specific movie


SELECT U.FirstName, U.LastName, P.Gender, P.AgeRange, COUNT (W.userId) AS timesRated
FROM Users U, Watches W, Profile P
WHERE U.userId = W.userId
AND U.UserID = P.UserID
AND W.movieId = '1'
GROUP BY U.userId, U.FirstName, U.LastName, P.Gender, P.AgeRange
ORDER BY timesRated DESC
LIMIT 3

--O All users with ratings lower than the rater ""

SELECT U.userId, U.email
FROM Users U,(
	SELECT MIN(W1.rating)AS minimum1, MAX(W2.rating)AS maximum2, W1.userId
	FROM Watches W1, Watches W2
	WHERE NOT(W1.userId = W2.userId)
	AND W2.userId = '16'
	GROUP BY W1.userId
	)num
WHERE U.userId=num.userId
AND num.minimum1 < num.maximum2
GROUP BY U.userId, U.email































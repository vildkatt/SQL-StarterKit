show databases;
use forum;
show tables;

-- Zadanie 6.

-- 1: Policz wszystkich aktywnych użytkowników forum torepublic - zalogowani w ciągu ostatniego roku

SELECT COUNT(*) AS active FROM users
WHERE unix_timestamp() - last_visit < 31536000;

-- 2: Znajdź najbardziej aktywnego użytkownika forum torrepublic w roku 2015, 2014 i wcześniej. Sam zdefiniuj kryterium "aktywności".
-- liczba postów w ciągu 12 miesięcy

-- 2015
	SELECT 
	    poster, COUNT(*)
	FROM
	    posts
	WHERE
	    posted BETWEEN 1420070400 AND 1451606399
	GROUP BY poster
	HAVING COUNT(*) = 
    
    (SELECT 
	        COUNT(*)
	    FROM
	        posts
		
	    WHERE
	        posted BETWEEN 1420070400 AND 1451606399
            GROUP BY poster
	    ORDER BY COUNT(*) DESC LIMIT 1);
	   


-- 2014
SELECT * FROM 
(SELECT poster, COUNT(*) AS number_of_posts 
FROM posts p
JOIN users u ON u.id=p.poster_id
WHERE (posted BETWEEN 1388534400 AND 1420070399)
GROUP BY poster
) AS active
where number_of_posts =
(SELECT MAX(number_of_posts) AS activity 
FROM 
(SELECT poster, COUNT(*) AS number_of_posts 
FROM posts p
JOIN users u ON u.id=p.poster_id
WHERE (posted BETWEEN 1388534400 AND 1420070399)
GROUP BY poster
) temp );

-- before 2014

SELECT * FROM 
(SELECT poster, COUNT(*) AS number_of_posts 
FROM posts p
JOIN users u ON u.id=p.poster_id
WHERE posted < 1388534399
GROUP BY poster
) AS active
where number_of_posts=
(SELECT MAX(number_of_posts) AS number_of_posts 
FROM 
(SELECT poster, COUNT(*) AS number_of_posts 
FROM posts p
JOIN users u ON u.id=p.poster_id
WHERE (posted < 1388534399)
GROUP BY poster
) temp
);


-- 3: Znajdź 5 użytkowników, których suma długości wszystkich komentarzy jest największa.
SELECT 
    poster, SUM(LENGTH(message)) AS total_length
FROM
    posts
GROUP BY poster
ORDER BY SUM(LENGTH(message)) DESC
LIMIT 5;

-- 4: Znajdź użytkownika, który nigdy nie napisał żadnego komentarza.

select * from users
where num_posts = 0;

-- 4: Znajdź użytkownika, który nigdy nie napisał żadnego komentarza 2.0.

select * from users
where last_post is null;



-- 5: Znajdź użytkowników, którzy oferowali rzeczy lub usługi niezgodne z prawem - narkotyki, broń
select * from topics
where subject like '%hasz%' or subject like '%marihuana%' or subject like '%feta%' or subject like '%hera%' or subject like '%koka%' or subject like '%narko%' or subject like '%ak-47-%' ;

-- 6: Z jakiej poczty korzystają użytkownicy forum torepublic? Policz różne serwery z których korzystają i posortuj je malejąco.

SELECT DISTINCT substring_index(email, '@', -1) AS emails FROM users
ORDER BY emails DESC;
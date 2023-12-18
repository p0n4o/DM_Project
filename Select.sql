--Для фильмов выводим пользователей, которые смотрят его в данный момент
SELECT title, CONCAT(first_name, ' ', last_name)
FROM video
JOIN usage_history USING(id_video)
JOIN status_of_video USING(id_status)
JOIN "user" USING(id_user)
WHERE name_of_status = 'watch';


--Вывод всех комментариев пользователей с данной фамилией
SELECT comment
FROM comments
JOIN "user" USING(id_user)
WHERE last_name = 'Yurakov';

--Вывод всех пользователей, у которых в названии почты встречается их фамилия
SELECT CONCAT(first_name, ' ', last_name), email
FROM "user"
WHERE LOWER(email) LIKE CONCAT('%',LOWER(last_name),'%');

--Фильмы, которые созданы режиссерами, моложе 60ти лет 
--и с средним рейтингом пользователей больше восьми
SELECT title AS Название, 
	   CONCAT(first_name, ' ', last_name) AS Режиссер, 
	   date_of_birth AS Год_рождения_режисера, 
	   DATE_PART('year', AGE(DATE(NOW()), date_of_birth)) AS Возраст,
	   ROUND(AVG(score), 1) AS Рейтинг
FROM video
JOIN shoot USING(id_video)
JOIN directors USING(id_director)
JOIN ratings USING(id_video)
GROUP BY title, first_name, last_name, date_of_birth
HAVING AVG(score) > 8 AND DATE_PART('year', AGE(DATE(NOW()), date_of_birth)) < 60
ORDER BY Рейтинг DESC

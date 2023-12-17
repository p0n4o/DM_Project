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


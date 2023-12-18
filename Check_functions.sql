--Проверка процедуры
CALL insert_comment1(
  First_name_1 => 'Vitalii', 
  Last_name_1 => 'Oreshin',
  comment_1 => 'Один из самых любимых фильмов!',
  title_1 => 'The Equalizer'
);

SELECT * FROM "comments";


--Проверка функции
SELECT get_countries1('The Equalizer');


--Проверка триггера
INSERT INTO actors
VALUES (6, 'John', 'Travolta', '2024-02-18', 69);

--Проверка триггера
INSERT INTO ratings
VALUES (11, 1, 1);



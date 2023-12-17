CREATE OR REPLACE PROCEDURE insert_Comment1(
	First_name_1 VARCHAR,
	Last_name_1 VARCHAR,
	comment_1 VARCHAR,
	title_1 VARCHAR
)
LANGUAGE 'plpgsql' AS 
$$
BEGIN
	INSERT INTO "comments"
	VALUES (comment_1, (SELECT u.id_user 
						FROM "user" u 
						WHERE u.first_name=First_name_1 AND u.last_name=Last_name_1),
		   (SELECT id_video FROM video WHERE video.title=title_1));
END;
$$;

CREATE OR REPLACE PROCEDURE delete_Rating(
	Firts_name_1 VARCHAR,
	Last_name_1 VARCHAR,
	title_1 VARCHAR)
LANGUAGE 'plpgsql' AS
$$
BEGIN
	DELETE FROM Ratings 
	WHERE id_user = (SELECT u.id_user 
					 FROM "user" u 
					 WHERE u.Firts_name = Firts_name_1 AND u.Last_name=Last_name_1)
	AND id_video = (SELECT id_video 
					FROM video 
					WHERE video.title=title_1);	
END;
$$;


CREATE FUNCTION get_countries1(title_1 varchar(60))
RETURNS varchar
AS
$$
BEGIN 
	RETURN(SELECT name_of_country 
		   FROM countries 
		   LEFT JOIN video v ON v.id_country = countries.id_country 
		   WHERE v.title=title_1); 
END; 
$$ LANGUAGE 'plpgsql';


CREATE FUNCTION get_avg_score(country_1 varchar(60))
RETURNS FLOAT
AS
$$
BEGIN
	 RETURN(SELECT AVG(score)
			FROM countries "c"
			LEFT JOIN video v ON v.id_country="c".id_country
			LEFT JOIN ratings r ON r.id_video=v.id_video
			WHERE name_of_country=country_1);
END;
$$ LANGUAGE 'plpgsql'


CREATE OR REPLACE FUNCTION check_birthday()
RETURNS TRIGGER AS $$
BEGIN
  IF (NEW.date_of_birth >= CURRENT_DATE) THEN
    RAISE EXCEPTION 'Ошибка в дате рождения';
  END IF;
  RETURN NEW;
END;
$$ LANGUAGE plpgsql;

CREATE TRIGGER check_birthday
AFTER INSERT OR UPDATE ON actors
FOR EACH ROW EXECUTE FUNCTION check_birthday();


CREATE OR REPLACE FUNCTION check_ratings_function()
RETURNS TRIGGER AS $$
BEGIN
  IF (NEW.score >= 10 OR NEW.score < 0) THEN
    RAISE EXCEPTION 'Неверная оценка(по десятибалльной шкале)';
  END IF;
  RETURN NEW;
END;
$$ LANGUAGE plpgsql;

CREATE TRIGGER check_ratings
AFTER INSERT OR UPDATE ON ratings
FOR EACH ROW EXECUTE FUNCTION check_ratings_function();
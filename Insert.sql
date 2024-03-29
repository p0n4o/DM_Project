INSERT INTO "subscription" (id_subscription, "type", "cost", duration) VALUES
    (1, 'month', 169, 30),
    (2, 'year', 1199, 365),
    (3, 'family_month', 1799, 365);

INSERT INTO video_types (id_video_type, genre, video_type) VALUES
    (1, 'fiction', 'film'),
    (2, 'drama', 'film'),
    (3, 'comedy', 'serials');
	
INSERT INTO countries (id_country, name_of_country) VALUES
    (1, 'USA'),
    (2, 'Great Britain');
	
INSERT INTO actors (id_actor, first_name, last_name, date_of_birth, age) VALUES
    (1, 'Will', 'Smith', '1968-09-25', 55),
    (2, 'John', 'Travolta', '1954-02-18', 69),
    (3, 'Brad', 'Pitt', '1963-12-18', 59),
    (4, 'Denzel', 'Washinton', '1954-12-28', 68),
    (5, 'Uma', 'Thurman', '1970-04-29', 53);

INSERT INTO directors (id_director, first_name, age, last_name, date_of_birth) VALUES
    (1, 'Antoine', 57,'Fuqua', '1966-01-19'),
    (2, 'Quentin', 60,'Tarantino', '1963-03-27'),
    (3, 'Glenn', 54,'Ficarra', '1969-05-27'),
    (4, 'Barry', 70,'Sonnenfeld', '1953-04-01'),
    (5, 'Bennett', 56,'Miller', '1966-12-30'),
    (6, 'Steven', 60,'Soderbergh', '1963-01-14');
		
INSERT INTO status_of_video (id_status, name_of_status) VALUES
    (1, 'watch'),
    (2, 'viewed');

INSERT INTO "user" (id_user, email, first_name, last_name, second_name, "password", phone_number, id_subscription) 
VALUES
    (1, 'vdoreshin@edu.hse.ru', 'Vitalii', 'Oreshin', 'Denisovich', 'OBLA_DAET', '+79991110202', 1),
    (2, 'ngyurakov_1@edu.hse.ru', 'Nazar', 'Yurakov', 'Gennadevich', 'BlackMonkey69', '+79104446969', 2),
    (3, 'dvmoscharov@edu.hse.ru', 'Dmitriy', 'Moscharov', 'Vadimovich', 'The_pussy_destroyer1', '+79853330055', 1),
    (4, 'agkendzhaev@edu.hse.ru', 'Alisher', 'Kendzhaev', 'Ganisherovich', 'The_pussy_destroyer2', '+79107779797', 3);

INSERT INTO video (id_video, title, age_limit, "year", id_video_type, id_country) 
VALUES
    (1, 'Pulp Fiction', 18, 1994, 1, 1),
    (2, 'The Equalizer', 18, 2014, 2, 1),
    (3, 'Men in Black', 12, 1997, 1, 1),
    (4, 'Oceans Eleven', 12, 2001, 1, 1),
    (5, 'Focus', 18, 2015, 1, 2),
    (6, 'Moneyball', 18, 2011, 2, 1);

INSERT INTO ratings (score, id_user, id_video) VALUES
    (5, 1, 2),
    (7, 2, 5),
    (9, 2, 6),
    (6, 2, 1),
    (7, 3, 3),
    (10, 4, 5),
    (10, 1, 4);

INSERT INTO "comments" ("comment", id_user, id_video) VALUES
    ('Nice film', 4, 3),
    ('Hate this movie', 2, 1);

INSERT INTO usage_history (id_video, id_user, id_status) VALUES
    (1, 3, 1),
    (3, 1, 1),
    (4, 2, 2),
    (1, 2, 2),
    (5, 4, 2),
    (2, 4, 1);

INSERT INTO filming (id_video, id_actor) VALUES
    (1, 2),
    (1, 5),
    (2, 4),
    (3, 1),
    (4, 3),
    (5, 1),
    (6, 2);

INSERT INTO shoot (id_director, id_video) VALUES
    (1, 2),
    (2, 1),
    (3, 5),
    (4, 3),
    (5, 6),
    (6, 4);







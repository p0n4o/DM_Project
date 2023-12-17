CREATE TABLE "subscription"
(
    id_subscription INT NOT NULL,
    "type" VARCHAR NOT NULL,
    "cost" INT NOT NULL,
    duration INT NOT NULL,
    PRIMARY KEY (id_subscription)
);

CREATE TABLE video_types
(
    id_video_type INT NOT NULL,
    genre VARCHAR NOT NULL,
    video_type VARCHAR NOT NULL,
    PRIMARY KEY (id_video_type)
);

CREATE TABLE countries
(
    id_country INT NOT NULL,
    name_of_country VARCHAR NOT NULL,
    PRIMARY KEY (id_country)
);

CREATE TABLE actors
(
    id_actor INT NOT NULL,
    First_name VARCHAR NOT NULL,
    Last_name VARCHAR NOT NULL,
    date_of_Birth DATE NOT NULL,
    age INT NOT NULL,
    PRIMARY KEY (id_actor)
);
CREATE TABLE directors
(
    First_name VARCHAR NOT NULL,
    id_director INT NOT NULL,
    age INT NOT NULL,
    Last_name VARCHAR NOT NULL,
    date_of_birth DATE NOT NULL,
    PRIMARY KEY (id_director)
);

CREATE TABLE status_of_video
(
    name_of_status VARCHAR NOT NULL,
    id_status INT NOT NULL,
    PRIMARY KEY (id_status)
);

CREATE TABLE "user"
(
    Email VARCHAR NOT NULL,
    First_name VARCHAR NOT NULL,
    Last_name VARCHAR NOT NULL,
    Second_name VARCHAR,
    "password" VARCHAR NOT NULL,
    id_user INT NOT NULL,
    phone_number VARCHAR NOT NULL,
    id_subscription INT NOT NULL,
    PRIMARY KEY (id_user),
    FOREIGN KEY (id_subscription) REFERENCES "subscription"(id_subscription)
);
CREATE TABLE video
(
    id_video INT NOT NULL,
    title VARCHAR NOT NULL,
    age_limit INT NOT NULL,
    "year" INT NOT NULL,
    id_video_type INT NOT NULL,
    id_country INT NOT NULL,
    PRIMARY KEY (id_video),
    FOREIGN KEY (id_video_type) REFERENCES video_types(id_video_type),
    FOREIGN KEY (id_country) REFERENCES countries(id_country)
);

CREATE TABLE ratings
(
    score INT NOT NULL,
    id_user INT,
    id_video INT,
    FOREIGN KEY (id_user) REFERENCES "user"(id_user),
    FOREIGN KEY (id_video) REFERENCES video(id_video)
);

CREATE TABLE "comments"
(
    "comment" VARCHAR NOT NULL,
    id_user INT,
    id_video INT,
    FOREIGN KEY (id_user) REFERENCES "user"(id_user),
    FOREIGN KEY (id_video) REFERENCES video(id_video)
);

CREATE TABLE usage_history
(
    id_video INT NOT NULL,
    id_user INT NOT NULL,
    id_status INT NOT NULL,
    PRIMARY KEY (id_video, id_user, id_status),
    FOREIGN KEY (id_video) REFERENCES video(id_video),
    FOREIGN KEY (id_user) REFERENCES "user"(id_user),
    FOREIGN KEY (id_status) REFERENCES status_of_video(id_status)
);

CREATE TABLE filming
(
    id_video INT NOT NULL,
    id_actor INT NOT NULL,
    PRIMARY KEY (id_video, id_actor),
    FOREIGN KEY (id_video) REFERENCES video(id_video),
    FOREIGN KEY (id_actor) REFERENCES actors(id_actor)
);

CREATE TABLE shoot
(
    id_director INT NOT NULL,
    id_video INT NOT NULL,
    PRIMARY KEY (id_director, id_video),
    FOREIGN KEY (id_director) REFERENCES directors(id_director),
    FOREIGN KEY (id_video) REFERENCES video(id_video)
);

# DM_Project

RDB for streaming service for watching TV series and films

## Files in repository:

1) DM_Project_annotation.pdf —— annotation of the database describing the structure, functional relationships, tables (including ER and UML diagrams).
2) Create.sql —— PostgresSQL script creating the tables that make up the database.
3) Insert.sql —— PostgresSQL script filling tables.
4) Select.sql —— PostgresSQL script with necessary selects.
5) DOP.sql —— PostgresSQL script with triggers and functions:

	functions:
	- get_countries1: Returns the country based on the movie title
	- get_avg_score: Returns the average score for all movies in the entered country
	
	triggers:
	- check_birthday: Checks that the actor's date of birth is correct
	- check_rating: Checks the correctness of the rating entered (the rating must be set on a 10-point scale, otherwise the trigger is triggered

### **!!!  Compilation was done using DBeaver software !!!**

## Team members:

Kendzhaev Alisher (Кенджаев Алишер)  
Moscharov Dmitriy (Мощаров Дмитрий)  
Oreshin Vitalii (Орешин Виталий)  
Yurakov Nazar (Юраков Назар)

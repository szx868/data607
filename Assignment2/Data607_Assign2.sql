use bk6qen7oifdtyy7vpeye;
CREATE TABLE movies (
movie_id INT NOT NULL AUTO_INCREMENT, 
movie_title VARCHAR(100),
movie_year INT,
PRIMARY KEY(movie_id)
);



INSERT INTO movies (movie_title, movie_year)
VALUES
('Spider-Man: Far From Home', 2019),
('Avengers: Infinity War', 2019),
('Avengers: Endgame', 2019),
('Ant-Man and the Wasp', 2020),
('Captain Marvel', 2019),
('Black Panther', 2018);


select *from movies;

CREATE TABLE person (
person_id INT NOT NULL AUTO_INCREMENT,
person_name varchar(50), 
person_role varchar(100),
PRIMARY KEY(person_id)
);

INSERT INTO person (person_name, person_role)
VALUES
('Jacob HU', 'Friend'),
('Haoying Zhang','Classmate' ),
('Linda', 'Cousin'),
('Minqin Chen', 'Friend'),
('Feiyu Chen', 'Collegue');

Select *from person;
drop table person;
drop table movie_ratings;



CREATE TABLE movie_ratings (
rating_id INT NOT NULL AUTO_INCREMENT,
movie_id INT, 
rating INT,
person_id INT,
PRIMARY KEY(rating_id),
FOREIGN KEY (movie_id) REFERENCES movies(movie_id),
FOREIGN KEY (person_id) REFERENCES person(person_id)

);

select *from movies;
drop table movie_ratings;


INSERT INTO movie_ratings (movie_id, rating,person_id)
VALUES
(1,5,1),
(2,5,1),
(3,5,1),
(4,3,1),
(5,2,1),
(6,1,1);


INSERT INTO movie_ratings (movie_id, rating,person_id)
VALUES
(1,4,2),
(2,5,2),
(3,4,2),
(4,3,2),
(5,3,2),
(6,2,2);


INSERT INTO movie_ratings (movie_id, rating,person_id)
VALUES
(1,4,3),
(2,4,3),
(3,5,3),
(4,3,3),
(5,2,3),
(6,3,3);


INSERT INTO movie_ratings (movie_id, rating,person_id)
VALUES
(1,4,4),
(2,5,4),
(3,4,4),
(4,0,4),
(5,2,4),
(6,0,4);


INSERT INTO movie_ratings (movie_id, rating,person_id)
VALUES
(1,5,5),
(2,4,5),
(3,0,5),
(4,3,5),
(5,0,5),
(6,2,5);






select movie_title,person_name,rating from movie_ratings,movies,person where movie_ratings.movie_id= movies.movie_id
and movie_ratings.person_id=person.person_id and movie_ratings.movie_id = 1 order by movie_ratings.person_id,movie_ratings.movie_id;

select movie_title,avg(rating) from movie_ratings,movies,person where movie_ratings.movie_id= movies.movie_id
and movie_ratings.person_id=person.person_id and movie_ratings.rating >0 group by movie_title;
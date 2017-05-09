-- Database: imdb

--DROP DATABASE imdb;
-- have to use references and create these tables in order

CREATE DATABASE imdb;

CREATE TABLE Actors(
	idactors int UNIQUE,
	lname varchar(1000),
	PRIMARY KEY (idactors),
	fname varchar(1000),	
	mname varchar(1000),	
	gender int,	
	numbers int
);

CREATE TABLE Aka_Names(
	idaka_names int UNIQUE,
	PRIMARY KEY (idaka_names),
	idactors int NOT NULL,
	FOREIGN KEY (idactors) REFERENCES Actors(idactors),
	name varchar(1000)
	
);
CREATE TABLE Movies(
	idmovies int UNIQUE,
	PRIMARY KEY(idmovies),
	title varchar(500),
	year int,
	number int,
	type int,
	location varchar(1000),
	language varchar(1000)
);
CREATE TABLE Actors_Movies(
	idactors int UNIQUE,
	idmovies int UNIQUE,
	PRIMARY KEY (idmovies),
	FOREIGN KEY (idactors) REFERENCES Actors(idactors),
	FOREIGN KEY (idmovies) REFERENCES Movies(idmovies)
);
CREATE TABLE Keywords(
	idkeyword int UNIQUE,
	PRIMARY KEY (idkeyword),
	keyword varchar(1000)
);

CREATE TABLE Movie_Keyword(
	idmovies_keywords int UNIQUE,
	PRIMARY KEY(idmovies_keywords),
	idmovies int NOT NULL,
	idkeywords int NOT NULL,
	FOREIGN KEY (idmovies) REFERENCES Movies(idmovies),
	FOREIGN KEY (idkeywords) REFERENCES Movies(idmovies),
	idseries int
);

CREATE TABLE Cast_list(
	idcast int UNIQUE,
 	PRIMARY KEY (idcast),
 	idmovies int ,
	idseries int,
	idactors int ,
	FOREIGN KEY (idactors) REFERENCES Actors(idactors),
	characters varchar(2000),
	billing_position int
);


CREATE TABLE Series(
	idseries int UNIQUE,
	PRIMARY KEY (idseries),
	idmovies int NOT NULL,
	name varchar(2000),
	season int,
	number int
);

CREATE TABLE Cast_Movies(
	idmovies int UNIQUE,
	PRIMARY KEY (idmovies) 
);
CREATE TABLE Genres(
	idgenres int UNIQUE,
	PRIMARY KEY(idgenres) ,
	gerne varchar(1000) NOT NULL
);

CREATE TABLE Movies_Genres(
	idmovies_genres int UNIQUE,
	PRIMARY KEY(idmovies_genres) ,
	idmovies int NOT NULL,
	FOREIGN KEY (idmovies) REFERENCES Movies(idmovies),
	idgenres int NOT NULL,
	FOREIGN KEY (idgenres) REFERENCES Genres(idgenres),
	idseries int
);




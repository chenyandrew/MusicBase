select lname, fname, idactors, gender into actors1 from actors;
select idactors, idseries, idmovies, characters into cast_list1 from cast_list;
select idaka_names,idactors,name into aka_names1 from aka_names;
select idmovies,season,idseries into series1 from series;
select idmovies,title,year into movies1 from movies;
select idmovies_keywords, idmovies, idkeywords into movie_keyword1 from movie_keyword;
select idmovies_genres, idmovies,idgenres into movies_genres1 from movies_genres;
select idkeyword, keyword into keywords1 from keywords;
select idgenres, gerne into genres1 from genres;
select idactors,idmovies into actors_movies1 from actors_movies;
select idmovies into cast_movies1 from cast_movies;

drop table cast_movies,actors_movies,genres,keywords,movie_keyword,movies_genres,movies;
drop table series,aka_names,cast_list,actors;

alter table actors1 rename to actors;
alter table actors_movies1 rename to actors_movies;
alter table aka_names1 rename to aka_names;
alter table cast_list1 rename to cast_list;
alter table genres1 rename to genres;
alter table keywords1 rename to keywords;
alter table cast_movies1 rename to cast_movies;
alter table movie_keyword1 rename to movies_keywords;
alter table movies1 rename to movies;
alter table movies_genres1 rename to movies_genres;
alter table series1 rename to series;

insert into cast_movies(idmovies) select idmovies from movies;
insert into actors_movies(idactors) select idactors from actors;
insert into actors_movies(idmovies) select idmovies from movies;
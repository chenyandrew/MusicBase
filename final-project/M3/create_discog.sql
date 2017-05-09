drop schema discog cascade;

create schema discog;

set search_path to discog;

create table Artists(
   tist_id integer unique,
   name varchar(1000),
   realname varchar(1000)
);

create table Genres(
   genre_id integer not null,
   name varchar(1000)
);

create table Labels(
   label_id integer not null,
   name varchar(1000)
);

create table Releases_Artists(
   release_id integer not null,
   artist_id integer not null
);

create table Releases_Formats(
   release_id integer not null,
   format_type varchar(1000)
);

create table Releases_Labels(
   release_id integer not null,
   label_id integer not null
);

create table Releases_Genres(
   release_id integer not null,
   genre_id integer not null
);

create table Releases(
   release_id integer not null,
   title varchar(5000),
   num_tracks integer,
   released varchar(500),
   country varchar(500)
);

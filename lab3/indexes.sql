CREATE INDEX season_idx ON series (season);
CREATE INDEX year_idx ON movies (year);
CREATE INDEX lname_idx ON actors(lname);
CREATE INDEX idmovies_idx ON cast_list(idmovies);
CREATE INDEX genre_idx ON genres(idgenres);
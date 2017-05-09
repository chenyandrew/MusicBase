select avg(num_movies) from
(
select count( distinct idmovies) as num_movies from series
where season is not null
group by season order by season
) movies_series;

select avg(cast(count_actors as float)) from 
(
select m.idmovies, m.year, count(c.idactors) as count_actors from cast_list c
join movies m on c.idmovies = m.idmovies
group by m.idmovies, m.year
having m.year > 1899 
) cast_movies ;

select lname,count(lname) from actors
group by lname
order by count(lname) desc limit(1);

select a.fname, a.lname, count(a.idactors) from actors a
right outer join cast_list c on a.idactors = c.idactors
right outer join movies m on c.idmovies = m.idmovies
group by a.idactors, a.fname, a.lname;

select a.fname, a.lname, a.idactors from actors a
inner join cast_list c on a.idactors = c.idactors
where idseries is not null
group by a.idactors, a.fname, a.lname limit(100);

select year, count(idmovies) from movies
where year is not null
group by year
having year > 1899;

select year from (
select year, genre, max(count_genre) as most_popular from 
(
select m.year as year, g.genre as genre, count(g.genre) as count_genre from movies_genres mg
join genres g on mg.idgenres = g.idgenres
join movies m on mg.idmovies = m.idmovies
group by m.year, g.genre 
order by count(g.genre) desc 
) movie_genre where genre = 'Comedy' 
group by year, genre
order by most_popular desc
) most_popular_result limit(1);

select avg (cast(count_series as float)) from
(
select count(s.idseries) as count_series from series s
join movies m on s.idmovies = m.idmovies
group by s.idmovies
order by count(s.idseries) desc
) series_list;

select avg(cast(counts as float)) from
(
select count(idmovies_keywords) as counts, idmovies from movies_keywords
where idmovies is not null
group by idmovies
) movies_keywords;

select  a.lname, a.idactors, m.idmovies, count(a.lname) as num_actor_appearances from actors a
join cast_list c on a.idactors = c.idactors
join movies m on m.idmovies = c.idmovies
group by m.idmovies , a.idactors , a.lname
having a.lname is not null and m.idmovies is not null
order by count(a.lname) desc limit(10);


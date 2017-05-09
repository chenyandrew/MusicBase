drop view v_artists_with_most_album_releases;
create or replace view v_artists_with_most_album_releases as
select count(r.mb_id) as Releases, a.name as Artist from unified.d_releases_mb_release r, unified.mb_d_artist a
where a.mb_artist_name_id = r.artist_credit
group by a.name order by count(r.mb_id) desc limit 10;

drop view v_most_common_artist_name_in_industry;
create or replace view v_most_common_artist_name_in_industry as
select name as Artist_Name, count(name) as #_of_artists_with_this_name from unified.mb_d_artist a
group by name
order by count(name) desc limit(5);

drop view v_average_group_size_of_artists;
create or replace view v_average_group_size_of_artists as
select avg(artist_count) as average_artist_count_size from unified.MB_artist_credit_junction;

drop view v_most_common_medium_of_music_in_2015;
create or replace view v_most_common_medium_of_music_in_2015 as
select r.year as Year, f.format_type as Format, count(f.format_type) as Count from unified.D_releases_formats f
inner join unified.d_releases_mb_release r on f.release_id = r.d_id
group by r.year, f.format_type
having r.year = 2015
order by count(f.format_type) desc limit(10);

drop view v_most_common_word_used_in_release_name;
create or replace view v_most_common_word_used_in_release_name as
select a.name as word, count(a.name) as Count from unified.MB_D_artist a
inner join unified.d_releases_mb_release r on a.name = r.name
group by a.name
order by count(a.name) desc limit(10);

drop view v_area_with_most_artists;
create or replace view v_area_with_most_artists as
select x.name as Area, count(x.name) as Count from unified.mb_area x
right outer join unified.mb_d_artist a on a.area = x.area_id
group by x.name
order by count(x.name) desc limit 10;

drop view v_most_common_type_of_artist;
create or replace view v_most_common_type_of_artist as
select count(t.name) as Count, t.name as Type_of_Artist from unified.MB_artist_type t
join unified.mb_d_artist a on a.mb_artist_type_id = t.artist_type_id
group by t.name
order by count(t.artist_type_id) desc limit 10;

drop view v_most_popular_genres_in_2013;
create or replace view v_most_popular_genres_in_2013 as
select r.year as Year, g.name as Genre, count(g.name) as Count from unified.d_genres g
join unified.d_releases_genres rg on rg.genre_id = g.genre_id
join unified.d_releases_mb_release r on r.d_id = rg.release_id
where rg.genre_id is not null
group by r.year, g.name
having r.year = 2013
order by count(g.name) desc limit(3);

drop view v_biggest_group_of_musicians;
create or replace view v_biggest_group_of_musicians as
select max(c.artist_count) as Size, c.name as Group from unified.mb_artist_credit_junction c
join unified.d_releases_mb_release r on c.artist_credit_id = r.artist_credit
group by c.name
order by max(c.artist_count) desc limit 5;

drop view v_most_common_language_in_music_industry;
create or replace view v_most_common_language_in_music_industry as
select l.name as Language, count(l.name) as Count from unified.mb_language l
join unified.d_releases_mb_release r on r.language = l.language_id
group by l.name
order by count(l.name) desc limit 10;

--Time: 5745.850 ms
select * from v_artists_with_most_album_releases;

--Time: 886.389 ms
select * from v_most_common_artist_name_in_industry;

--Time: 118.285 ms
select * from v_average_group_size_of_artists;

--Time: 2513.822 ms
select * from v_most_common_medium_of_music_in_2015;

--Time: 3427.607 ms
select * from v_most_common_word_used_in_release_name;

--Time: 218.266 ms
select * from v_area_with_most_artists;

--Time: 856.267 ms
select * from v_most_common_type_of_artist;

--Time: 944.942 ms
select * from v_most_popular_genres_in_2013;

--Time: 1512.052 ms
select * from v_biggest_group_of_musicians;

--Time: 1271.650 ms
select * from v_most_common_language_in_music_industry;

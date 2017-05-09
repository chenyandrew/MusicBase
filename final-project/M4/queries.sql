select count(r.mb_id) as Releases, a.name as Artist from unified.d_releases_mb_release r, unified.mb_d_artist a
where a.mb_artist_name_id = r.artist_credit
group by a.name order by count(r.mb_id) desc limit 10;

select name as Artist_Name, count(name) as #_of_artists_with_this_name from unified.mb_d_artist a
group by name
order by count(name) desc limit(5);

select avg(artist_count) as average_artist_count_size from unified.MB_artist_credit_junction;

select r.year as Year, f.format_type as Format, count(f.format_type) as Count from unified.D_releases_formats f
inner join unified.d_releases_mb_release r on f.release_id = r.d_id
group by r.year, f.format_type
having r.year = 2015
order by count(f.format_type) desc limit(10);

select a.name as word, count(a.name) as Count from unified.MB_D_artist a
inner join unified.d_releases_mb_release r on a.name = r.name
group by a.name
order by count(a.name) desc limit(10);

select x.name as Area, count(x.name) as Count from unified.mb_area x
right outer join unified.mb_d_artist a on a.area = x.area_id
group by x.name
order by count(x.name) desc limit 10;

select count(t.name) as Count, t.name as Type_of_Artist from unified.MB_artist_type t
join unified.mb_d_artist a on a.mb_artist_type_id = t.artist_type_id
group by t.name
order by count(t.artist_type_id) desc limit 10;

select r.year as Year, g.name as Genre, count(g.name) as Count from unified.d_genres g
join unified.d_releases_genres rg on rg.genre_id = g.genre_id
join unified.d_releases_mb_release r on r.d_id = rg.release_id
where rg.genre_id is not null
group by r.year, g.name
having r.year = 2013
order by count(g.name) desc limit(3);

select max(c.artist_count) as Size, c.name as Group from unified.mb_artist_credit_junction c
join unified.d_releases_mb_release r on c.artist_credit_id = r.artist_credit
group by c.name
order by max(c.artist_count) desc limit 5;

select l.name as Language, count(l.name) as Count from unified.mb_language l
join unified.d_releases_mb_release r on r.language = l.language_id
group by l.name
order by count(l.name) desc limit 10;

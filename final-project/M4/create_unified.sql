drop schema unified cascade;

create schema unified;

create table unified.D_labels as select label_id, name from discog.labels;

create table unified.D_releases_labels as select label_id, release_id from discog.releases_labels;

create table unified.D_genres as select genre_id, name from discog.genres;

create table unified.D_releases_genres as select genre_id, release_id from discog.releases_genres;

create table unified.D_releases_formats as select release_id, format_type from discog.releases_formats;

create table unified.D_releases_artists as select release_id, artist_id from discog.releases_artists;

create table unified.D_releases_MB_release as select status, language, artist_credit, release_group, release_id as d_id, id as mb_id, mb.name, title, num_tracks, released, country, mb.year from musicbrainz.release mb, discog.releases d
where mb.name = d.title;

create table unified.MB_artist_credit_name as select artist_credit as artist_credit_id, artist as mb_artist_id, name from musicbrainz.artist_credit_name;

create table unified.MB_artist_credit_junction as select id as artist_credit_id, artist_count, name from musicbrainz.artist_credit;

create table unified.MB_D_artist as select area, tist_id as d_artist_id, id as mb_artist_name_id, gender, type as mb_artist_type_id, mb.name from musicbrainz.artist mb, discog.artists d
where mb.name = d.name;

create table unified.MB_gender as select id as gender_id, name from musicbrainz.gender;

create table unified.MB_release_status as select id as release_status_id, name from musicbrainz.release_status;

create table unified.MB_release_packaging as select id as release_packaging_id, name from musicbrainz.release_packaging;

create table unified.MB_language as select id as language_id, name from musicbrainz.language;

create table unified.MB_release_alias as select id as release_alias_id, release as release_id, type as release_alias_type_id, sort_name, name from musicbrainz.release_alias;

create table unified.MB_release_alias_type as select id as release_alias_type_id, name from musicbrainz.release_alias_type;

create table unified.MB_release_group as select id as release_group_id, artist_credit as artist_credit_id, type as release_group_type_id, name from musicbrainz.release_group;

create table unified.MB_artist_type as select id as artist_type_id, name from musicbrainz.artist_type;

create table unified.MB_artist_alias as select id as artist_alias_id, artist as artist_id, type as artist_alias_type_id, sort_name, name from musicbrainz.artist_alias;

create table unified.MB_artist_alias_type as select id as artist_alias_type_id, name from musicbrainz.artist_alias_type;

create table unified.mb_area as select id as area_id, type as area_type_id, name from musicbrainz.area;

create table unified.mb_area_type as select id as area_type_id, name from musicbrainz.area_type;

create table unified.mb_area_alias as select id as area_alias_id, area as area_id, type as area_alias_type_id, name from musicbrainz.area_alias;

create table unified.mb_area_alias_type as select id as area_alias_type_id, name from musicbrainz.area_alias_type;

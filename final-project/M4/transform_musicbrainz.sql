--MUSICBRAINZ
set search_path to musicbrainz;

--Adding ccolumns to musicbrainz tables
alter table release add column cname varchar(max);
alter table release_group add column cname varchar(max);

--musicbrainz updates
update musicbrainz.release set cname = initcap(btrim(split_part(name, ' -', 1)));
update musicbrainz.release_group set cname = initcap(btrim(split_part(name, ' -', 1)));

--removing ariginal ccolumns
alter table musicbrainz.release drop column name;
alter table musicbrainz.release rename cname to name;
alter table musicbrainz.release_group drop name;
alter table musicbrainz.release_group rename cname to name;

--converting a varchar to a date type
alter table musicbrainz.release add column year char(4);
alter table musicbrainz.release add column month char(2);
alter table musicbrainz.release add column day char(2);
update musicbrainz.release set year = split_part(last_updated, '-', 1);
update musicbrainz.release set month = split_part(last_updated, '-', 2);
update musicbrainz.release set day = split_part(split_part(last_updated, '-', 3), ' ', 1);
alter table musicbrainz.release add column clast_updated date;
update musicbrainz.release set clast_updated = to_date(day || '-' || month || '-' || year, 'DD-MM-YYYY') where day <> '' and month <> '' and year <> '';
alter table musicbrainz.release drop column month;
alter table musicbrainz.release drop column day;
alter table musicbrainz.release drop last_updated;
alter table musicbrainz.release rename clast_updated to last_updated;

alter table musicbrainz.release_group add column year char(4);
alter table musicbrainz.release_group add column month char(2);
alter table musicbrainz.release_group add column day char(2);
update musicbrainz.release_group set year = split_part(last_updated, '-', 1);
update musicbrainz.release_group set month = split_part(last_updated, '-', 2);
update musicbrainz.release_group set day = split_part(split_part(last_updated, '-', 3), ' ', 1);
alter table musicbrainz.release_group add column clast_updated date;
update musicbrainz.release_group set clast_updated = to_date(day || '-' || month || '-' || year, 'DD-MM-YYYY') where day <> '' and month <> '' and year <> '';
alter table musicbrainz.release_group drop column month;
alter table musicbrainz.release_group drop column day;
alter table musicbrainz.release_group drop column last_updated;
alter table musicbrainz.release_group rename clast_updated to last_updated;

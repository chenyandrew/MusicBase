--DISCOG
set search_path to discog;

--Adding ccolumns to discog tables
alter table releases add column ctitle varchar(max);

--discog updates
update discog.releases set ctitle = initcap(btrim(split_part(title, ' -', 1)));
alter table discog.releases drop title;
alter table discog.releases rename ctitle to title;

--converting a varchar to a date type
alter table discog.releases add column year char(4);
update discog.releases set year = btrim(split_part(released, '/', 3));
update discog.releases set year = btrim(split_part(released, '-', 1)) where length(btrim(split_part(released, '-', 1))) = 4 and year = '';
alter table discog.releases add column month char(2);
alter table discog.releases add column day char(2);
update discog.releases set month = split_part(released, '-', 2);
update discog.releases set month = split_part(released, '/', 1) where length(split_part(released, '/', 1)) <= 2 and month = '';
update discog.releases set day = split_part(released, '-', 3);
update discog.releases set day = split_part(released, '/', 2) where length(split_part(released, '/', 2)) <=2 and day = '';
alter table discog.releases add column creleased date;
update discog.releases set creleased = to_date(day || '-' || month || '-' || year, 'DD-MM-YYYY') where day <> '' and month <> '' and year <> '';
alter table discog.releases drop day;
alter table discog.releases drop month;
alter table discog.releases drop released;
alter table discog.releases rename creleased to released;

alter table actors alter gender type char(1);
update actors set gender='M' where gender='1';
update actors set gender='F' where gender IS NULL;

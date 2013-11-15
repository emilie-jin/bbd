drop table commune;
create table commune (
codeInsee varchar2(10) constraint commune_pk primary key, nomC varchar(50), altitude number, codePostal varchar2(50), longitude_radian float, latitude_radian float, Population99 number, surface number);


-- This is the original setup.sql file, copied from https://github.com/CrunchyData/crunchy-containers/blob/4dcbbf676523e613a571c3f79bb844d03643866f/bin/postgres-gis/setup.sql,
-- with commands currently not needed for OEREB commented out.

SET application_name="container_setup";

--create extension postgis;
--create extension postgis_topology;
--create extension fuzzystrmatch;
--create extension postgis_tiger_geocoder;
create extension pg_stat_statements;
create extension pgaudit;
--create extension plr;

alter user postgres password 'PG_ROOT_PASSWORD';

create user PG_PRIMARY_USER with REPLICATION  PASSWORD 'PG_PRIMARY_PASSWORD';
create user PG_USER with password 'PG_PASSWORD';

create table primarytable (key varchar(20), value varchar(20));
grant all on primarytable to PG_PRIMARY_USER;

create database PG_DATABASE;

grant all privileges on database PG_DATABASE to PG_USER;

\c PG_DATABASE

create extension postgis;
create extension "uuid-ossp";
--create extension postgis_topology;
create extension fuzzystrmatch;
--create extension postgis_tiger_geocoder;
create extension pg_stat_statements;
create extension pgaudit;
--create extension plr;

\c PG_DATABASE PG_USER;

create schema PG_USER;

create table PG_USER.testtable (
	name varchar(30) primary key,
	value varchar(50) not null,
	updatedt timestamp not null
);



insert into PG_USER.testtable (name, value, updatedt) values ('CPU', '256', now());
insert into PG_USER.testtable (name, value, updatedt) values ('MEM', '512m', now());

grant all on PG_USER.testtable to PG_PRIMARY_USER;

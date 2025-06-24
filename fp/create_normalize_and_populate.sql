create database if not exists pandemic;
use pandemic;

create table infectious_cases_raw (
    entity varchar(255),
    code varchar(10),
    year int,
    number_yaws float,
    polio_cases float,
    cases_guinea_worm float,
    number_rabies float,
    number_malaria float,
    number_hiv float,
    number_tuberculosis float,
    number_smallpox float,
    number_cholera_cases float
);
select COUNT(*) from infectious_cases_raw;

create table locations (
	id 		int auto_increment primary key,
    entity 	varchar(255) not null,
    code 	varchar(10)
);

# Populate (Entity, Code) tuple into normalized table
insert into locations (entity, code)
select distinct Entity, Code
from infectious_cases_raw;

create table pandemic.cases (
	id int auto_increment primary key,
    location_id int,
    year int not null,
    number_yaws FLOAT,
    polio_cases FLOAT,
    cases_guinea_worm FLOAT,
    number_rabies FLOAT,
    number_malaria FLOAT,
    number_hiv FLOAT,
    number_tuberculosis FLOAT,
    number_smallpox FLOAT,
    number_cholera_cases FLOAT,
    foreign key (location_id) references locations(id)
);

insert into cases (
    location_id, 
    year, 
    number_yaws, 
    polio_cases, 
    cases_guinea_worm,
    number_rabies, 
    number_malaria, 
    number_hiv, 
    number_tuberculosis,
    number_smallpox, 
    number_cholera_cases
)
select
    l.id,
    r.year,
    r.number_yaws,
    r.polio_cases,
    r.cases_guinea_worm,
    r.number_rabies,
    r.number_malaria,
    r.number_hiv,
    r.number_tuberculosis,
    r.number_smallpox,
    r.number_cholera_cases
from 
    infectious_cases_raw r
join
    locations l on r.Entity = l.entity and r.Code <=> l.code;
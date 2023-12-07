DROP TABLE IF EXISTS continents;

create table continents
(
    iso_region varchar(2) primary key,
    continent text
);

INSERT INTO continents ('iso_region', 'continent')
VALUES
    ('NA', 'North America');

DROP TABLE IF EXISTS countries;

create table countries(iso_country varchar(2) PRIMARY key,country text,iso_region varchar(2) references continents);

INSERT INTO countries ('iso_country', 'country', 'iso_region') VALUES ('CA', 'Canada', 'NA');
INSERT INTO countries ('iso_country', 'country', 'iso_region') VALUES ('GT', 'Guatemala', 'NA');
INSERT INTO countries ('iso_country', 'country', 'iso_region')VALUES    ('AG', 'Antigua and Barbuda', 'NA');
INSERT INTO countries ('iso_country', 'country', 'iso_region')VALUES    ('DM', 'Dominica', 'NA');
INSERT INTO countries ('iso_country', 'country', 'iso_region')VALUES    ('BB', 'Barbados', 'NA');
INSERT INTO countries ('iso_country', 'country', 'iso_region')VALUES    ('KN', 'Saint Kitts and Nevis', 'NA');
INSERT INTO countries ('iso_country', 'country', 'iso_region')VALUES    ('CR', 'Costa Rica', 'NA');
INSERT INTO countries ('iso_country', 'country', 'iso_region')VALUES    ('NI', 'Nicaragua', 'NA');
INSERT INTO countries ('iso_country', 'country', 'iso_region')VALUES    ('KY', 'Cayman Islands', 'NA');
INSERT INTO countries ('iso_country', 'country', 'iso_region')VALUES    ('DO', 'Dominican Republic', 'NA');
INSERT INTO countries ('iso_country', 'country', 'iso_region')VALUES    ('BS', 'Bahamas', 'NA');
INSERT INTO countries ('iso_country', 'country', 'iso_region')VALUES    ('AI', 'Anguilla', 'NA');
INSERT INTO countries ('iso_country', 'country', 'iso_region')VALUES    ('MX', 'Mexico', 'NA');
INSERT INTO countries ('iso_country', 'country', 'iso_region')VALUES    ('PM', 'Saint Pierre and Miquelon', 'NA');
INSERT INTO countries ('iso_country', 'country', 'iso_region')VALUES    ('LC', 'Saint Lucia', 'NA');
INSERT INTO countries ('iso_country', 'country', 'iso_region')VALUES    ('SV', 'El Salvador', 'NA');
INSERT INTO countries ('iso_country', 'country', 'iso_region')VALUES    ('HN', 'Honduras', 'NA');
INSERT INTO countries ('iso_country', 'country', 'iso_region')VALUES    ('CU', 'Cuba', 'NA');
INSERT INTO countries ('iso_country', 'country', 'iso_region')VALUES    ('PR', 'Puerto Rico', 'NA');
INSERT INTO countries ('iso_country', 'country', 'iso_region')VALUES    ('US', 'United States of America', 'NA');
INSERT INTO countries ('iso_country', 'country', 'iso_region')VALUES    ('BZ', 'Belize', 'NA');
INSERT INTO countries ('iso_country', 'country', 'iso_region')VALUES    ('JM', 'Jamaica', 'NA');
INSERT INTO countries ('iso_country', 'country', 'iso_region')VALUES    ('TC', 'Turks and Caicos Islands', 'NA');
INSERT INTO countries ('iso_country', 'country', 'iso_region')VALUES    ('PA', 'Panama', 'NA');
INSERT INTO countries ('iso_country', 'country', 'iso_region')VALUES    ('BL', 'Saint Barthelemy', 'NA');
INSERT INTO countries ('iso_country', 'country', 'iso_region')VALUES    ('VC', 'Saint Vincent and the Grenadines', 'NA');
INSERT INTO countries ('iso_country', 'country', 'iso_region')VALUES    ('HT', 'Haiti', 'NA');
INSERT INTO countries ('iso_country', 'country', 'iso_region')VALUES    ('GD', 'Grenada', 'NA');
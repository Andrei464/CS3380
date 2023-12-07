use cs3380

-- Order matters!
drop table if exists waypointRoutes;
drop table if exists waypoints;
drop table if exists routesAndAirlines;
drop table if exists flightRoutes;
drop table if exists airportsAndAirlines;
drop table if exists aircraft;
drop table if exists airlines;
drop table if exists airports;
drop table if exists cities;
drop table if exists countries;
drop table if exists continents;


create table continents
(
    iso_region varchar(2) primary key,
    continent text
);

create table countries
(
    iso_country varchar(2) PRIMARY key,
    country text,
    iso_region varchar(2) references continents
);

create table cities
(
    city_id integer primary key IDENTITY(1,1),
    municipality text not null,
    iso_country varchar(2) references countries
);

create table airports
(
    icaoCode varchar(4) not null primary key,--4 letter code, globally unqiue
    iataCode varchar(3),--3 letter code
    airportID text not null,--unique neumeric id
    airportName text not null,--name of the airport
    elevation integer not null,--in feet
    latitude float not null,--coordinates
    longitude float not null,--coordinates
    airportSize text not null,--large mdeium small
    localCode varchar(3) not null,--3 letter code
    city_id integer not null references cities
);

create table aircraft
(
    aircraftID varchar(100) primary key,
    modelNum text not null,
    typeOfAircraft text not null,
    ownedBy text not null,
    numberOwned integer not null
);

create table airlines
(
    airlineID varchar(100) primary key,
    name text not null
);

create table flightRoutes
(
    routeID integer primary key IDENTITY(1,1),
    origin varchar(4) not null references airports(icaoCode),
    destination varchar(4) not null references airports(icaoCode),
    monthFlown integer,
    carrier text,
    airlineID varchar(100) references airlines,
    passengers integer,
    distance integer,
    aircraftID text
);


create table waypoints
(
    name varchar(5) primary key,
    latitude float not null,
    longitude float not null,
);

create table waypointRoutes
(
    id integer primary key references flightRoutes(routeID),
    name varchar(5) references waypoints
);

create table airportsAndAirlines
(
    airlineID varchar(100) references airlines,
    airport varchar(4) references airports
);

create table routesAndAirlines
(
    routeID integer references flightRoutes,
    airlineID varchar(100) references airlines
);
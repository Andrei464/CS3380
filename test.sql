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

create table aircraft
(
    aircraftID varchar(100) primary key,
    modelNum text not null,
    typeOfAircraft text not null,
    ownedBy text not null,
    numberOwned integer not null
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

create table waypointRoutes--STILL NEED
(
    id integer primary key references flightRoutes(routeID),
    name varchar(5) references waypoints
);

create table airportsAndAirlines--STILL NEED
(
    airlineID varchar(100) references airlines,
    airport varchar(4) references airports
);

create table routesAndAirlines--STILL NEED
(
    routeID integer references flightRoutes,
    airlineID varchar(100) references airlines
);
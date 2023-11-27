use cs3380

-- Order matters!
drop table if exists aircraft;
drop table if exists orderLineItems;
drop table if exists orders;
drop table if exists people;
drop table if exists products;
drop table if exists provinces;

create table aircraft (
    aircraftID varchar(100) primary key,
    modelNum text not null,
    typeOfAircraft text not null,
    ownedBy text not null,
    numberOwned integer not null
);

create table airlines (
    airlineID varchar(100) primary key,
    name text not null,
    type text not null
);

create table airports (
    icaoCode varchar(4) not null primary key,--4 letter code, globally unqiue
    iataCode varchar(3),--3 letter code
    airportID text not null,--unique neumeric id
    name text not null,--name of the airport
    elevation integer not null,--in feet
    latitude float not null,--coordinates
    longitude float not null,--coordinates
    municipality text not null,--city
    airportSize text not null,--large mdeium small
    isoCountry varchar(2) not null,--2 letter code
    region text not null,--Country-Region
    continent varchar(2) not null,--NA
    localCode varchar(3) not null,--3 letter code
);

create table waypoints(
    name varchar(5) primary key,
    latitude float not null,
    longitude float not null,
);

create table flightRoutes(
    routeID integer primary key IDENTITY(1,1),
    orig varchar(4) not null references airports(icaoCode),
    dest varchar(4) not null references airports(icaoCode),
    monthFlown integer,
    carrier text,
    airlineID varchar(100) references airlines,
    passengers integer,
    distance float,
    aircraftID text
);

create table waypointRoutes(
    id integer primary key references flightRoutes(id),
    name varchar(5) references waypoints
);

create table airportsAndAirlines(
    airlineID varchar(100) references airlines,
    airport varchar(4) references airports
);

create table routesAndAirlines(
    routeID integer references flightRoutes,
    airlineID varchar(100) references airlines
);
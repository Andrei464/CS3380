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
    airlineID varchar(100) primary key,
    name text not null,
    type text not null
);
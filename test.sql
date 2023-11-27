use cs3380

-- Order matters!
drop table if exists viewed;
drop table if exists orderLineItems;
drop table if exists orders;
drop table if exists people;
drop table if exists products;
drop table if exists provinces;

create table aircraft (
    aircraftID varchar(100) primary key,
    modelNum text not null,
    typeOfAircraft text not null
);

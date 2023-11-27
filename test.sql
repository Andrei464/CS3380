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
drop table if exists continents;
drop table if exists countries;
drop table if exists cities;


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
    distance float,
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

--POPULATION

INSERT INTO airlines (airlineID, name) VALUES (20318, 'Olson Air Service')
INSERT INTO airlines (airlineID, name) VALUES (20323, 'Warbelow')
INSERT INTO airlines (airlineID, name) VALUES (20324, 'Yute Air Aka Flight Alaska')
INSERT INTO airlines (airlineID, name) VALUES (20408, 'Tatonduk Outfitters Limited d/b/a Everts Air Alaska and Everts Air Cargo')
INSERT INTO airlines (airlineID, name) VALUES (19917, 'United Parcel Service')
INSERT INTO airlines (airlineID, name) VALUES (20326, 'Cape Smythe Air Service')
INSERT INTO airlines (airlineID, name) VALUES (20328, 'Inland Aviation Services')
INSERT INTO airlines (airlineID, name) VALUES (20330, 'Ryan Air f/k/a Arctic Transportation')
INSERT INTO airlines (airlineID, name) VALUES (19874, 'Air Transport International')
INSERT INTO airlines (airlineID, name) VALUES (20331, 'Bering Air Inc.')
INSERT INTO airlines (airlineID, name) VALUES (20333, 'Wright Air Service')
INSERT INTO airlines (airlineID, name) VALUES (20453, 'ABX Air Inc')
INSERT INTO airlines (airlineID, name) VALUES (20201, 'Ameristar Air Cargo')
INSERT INTO airlines (airlineID, name) VALUES (20404, 'Independence Air')
INSERT INTO airlines (airlineID, name) VALUES (20263, 'Empire Airlines Inc.')
INSERT INTO airlines (airlineID, name) VALUES (20357, 'Astar USA, LLC')
INSERT INTO airlines (airlineID, name) VALUES (20203, 'Falcon Air Express')
INSERT INTO airlines (airlineID, name) VALUES (20336, 'Hageland Aviation Service')
INSERT INTO airlines (airlineID, name) VALUES (20338, 'Larrys Flying Service')
INSERT INTO airlines (airlineID, name) VALUES (20299, 'Southeast Airlines')
INSERT INTO airlines (airlineID, name) VALUES (20383, 'Venture Travel LLC d/b/a Taquan Air Service')
INSERT INTO airlines (airlineID, name) VALUES (20340, 'Seaport Airlines, Inc.')
INSERT INTO airlines (airlineID, name) VALUES (20370, 'Kalitta Air LLC')
INSERT INTO airlines (airlineID, name) VALUES (20341, 'Alaska Central Express')
INSERT INTO airlines (airlineID, name) VALUES (20302, 'Kitty Hawk Aircargo')
INSERT INTO airlines (airlineID, name) VALUES (20169, 'Lynden Air Cargo Airlines')
INSERT INTO airlines (airlineID, name) VALUES (20151, 'Amerijet International')
INSERT INTO airlines (airlineID, name) VALUES (20304, 'SkyWest Airlines Inc.')
INSERT INTO airlines (airlineID, name) VALUES (20305, 'Pace Airlines')
INSERT INTO airlines (airlineID, name) VALUES (20399, 'Planet Airways')
INSERT INTO airlines (airlineID, name) VALUES (20100, 'Polar Air Cargo Airways')
INSERT INTO airlines (airlineID, name) VALUES (20427, 'Piedmont Airlines')
INSERT INTO airlines (airlineID, name) VALUES (20400, 'Capital Cargo International')
INSERT INTO airlines (airlineID, name) VALUES (20344, 'Ryan International Airlines')
INSERT INTO airlines (airlineID, name) VALUES (20418, 'Chautauqua Airlines Inc.')
INSERT INTO airlines (airlineID, name) VALUES (20447, 'USA Jet Airlines Inc.')
INSERT INTO airlines (airlineID, name) VALUES (19977, 'United Air Lines Inc.')
INSERT INTO airlines (airlineID, name) VALUES (20346, 'Iliamna Air Taxi')
INSERT INTO airlines (airlineID, name) VALUES (20195, 'Sky Lease Cargo')
INSERT INTO airlines (airlineID, name) VALUES (20095, 'World Airways Inc.')
INSERT INTO airlines (airlineID, name) VALUES (20424, 'Grand Canyon Airlines, Inc. d/b/a Grand Canyon Airlines d/b/a Scenic Airlines')
INSERT INTO airlines (airlineID, name) VALUES (20378, 'Mesa Airlines Inc.')
INSERT INTO airlines (airlineID, name) VALUES (20349, 'Promech')
INSERT INTO airlines (airlineID, name) VALUES (20291, 'Air Midwest Inc.')
INSERT INTO airlines (airlineID, name) VALUES (20046, 'Air Wisconsin Airlines Corp')
INSERT INTO airlines (airlineID, name) VALUES (20325, 'Arctic Circle Air Service')
INSERT INTO airlines (airlineID, name) VALUES (20445, 'CommuteAir LLC dba CommuteAir')
INSERT INTO airlines (airlineID, name) VALUES (20225, 'Peninsula Airways Inc.')
INSERT INTO airlines (airlineID, name) VALUES (20057, 'Evergreen International Inc.')
INSERT INTO airlines (airlineID, name) VALUES (20402, 'Miami Air International')
INSERT INTO airlines (airlineID, name) VALUES (20219, 'Village Aviation')
INSERT INTO airlines (airlineID, name) VALUES (20322, 'Bidzy Ta Hot Aana, Inc. d/b/a Tanana Air Service')
INSERT INTO airlines (airlineID, name) VALUES (20443, 'Island Air Service')
INSERT INTO airlines (airlineID, name) VALUES (20327, 'Northern Pacific Airways, Inc. Dba  Ravn Alaska')
INSERT INTO airlines (airlineID, name) VALUES (20252, 'Pacific Island Aviation')
INSERT INTO airlines (airlineID, name) VALUES (19704, 'Continental Air Lines Inc.')
INSERT INTO airlines (airlineID, name) VALUES (19790, 'Delta Air Lines Inc.')
INSERT INTO airlines (airlineID, name) VALUES (20261, 'Ellis Air Taxi Inc.')
INSERT INTO airlines (airlineID, name) VALUES (20107, 'Federal Express Corporation')
INSERT INTO airlines (airlineID, name) VALUES (19393, 'Southwest Airlines Co.')
INSERT INTO airlines (airlineID, name) VALUES (20455, 'Grant Aviation')
INSERT INTO airlines (airlineID, name) VALUES (20285, 'Ward Air')
INSERT INTO airlines (airlineID, name) VALUES (20315, 'Bellair Inc. (1)')
INSERT INTO airlines (airlineID, name) VALUES (20421, 'Sky King Inc.')
INSERT INTO airlines (airlineID, name) VALUES (20337, 'Kalinin Aviation LLC d/b/a Alaska Seaplanes')
INSERT INTO airlines (airlineID, name) VALUES (20320, 'Frontier Flying Service')
INSERT INTO airlines (airlineID, name) VALUES (20401, 'Silver Airways')
INSERT INTO airlines (airlineID, name) VALUES (20007, 'Atlas Air Inc.')
INSERT INTO airlines (airlineID, name) VALUES (20190, 'Southern Air Inc.')
INSERT INTO airlines (airlineID, name) VALUES (20415, 'North American Airlines')
INSERT INTO airlines (airlineID, name) VALUES (20284, 'Express.Net Airlines')
INSERT INTO airlines (airlineID, name) VALUES (20374, 'ExpressJet Airlines Inc.')
INSERT INTO airlines (airlineID, name) VALUES (19991, 'America West Airlines Inc.')
INSERT INTO airlines (airlineID, name) VALUES (20353, 'Dynamic Aviation, Inc. d/b/a Beacon')
INSERT INTO airlines (airlineID, name) VALUES (19687, 'Horizon Air')
INSERT INTO airlines (airlineID, name) VALUES (20254, 'Colgan Air')
INSERT INTO airlines (airlineID, name) VALUES (20287, 'Island Air Hawaii')
INSERT INTO airlines (airlineID, name) VALUES (20253, 'Cape Air')
INSERT INTO airlines (airlineID, name) VALUES (20269, 'Allegheny Airlines')
INSERT INTO airlines (airlineID, name) VALUES (20339, 'L.A.B. Flying Service Inc.')
INSERT INTO airlines (airlineID, name) VALUES (20224, 'Katmai Air')
INSERT INTO airlines (airlineID, name) VALUES (20108, 'Northern Air Cargo Inc.')
INSERT INTO airlines (airlineID, name) VALUES (19690, 'Hawaiian Airlines Inc.')
INSERT INTO airlines (airlineID, name) VALUES (20358, 'Great Lakes Airlines')
INSERT INTO airlines (airlineID, name) VALUES (20258, 'Big Sky Airlines Inc.')
INSERT INTO airlines (airlineID, name) VALUES (20413, 'Skagway Air Service')
INSERT INTO airlines (airlineID, name) VALUES (20257, 'Bemidji Airlines')
INSERT INTO airlines (airlineID, name) VALUES (20422, 'Sun Country Airlines d/b/a MN Airlines')
INSERT INTO airlines (airlineID, name) VALUES (19386, 'Northwest Airlines Inc.')
INSERT INTO airlines (airlineID, name) VALUES (20170, 'Mesaba Airlines')
INSERT INTO airlines (airlineID, name) VALUES (20193, 'Gemini Air Cargo Airways')
INSERT INTO airlines (airlineID, name) VALUES (20335, 'Boston-Maine Airways')
INSERT INTO airlines (airlineID, name) VALUES (20226, 'Spernak Airways Inc.')
INSERT INTO airlines (airlineID, name) VALUES (20366, 'ExpressJet Airlines LLC d/b/a aha!')
INSERT INTO airlines (airlineID, name) VALUES (20332, 'Baker Aviation Inc.')
INSERT INTO airlines (airlineID, name) VALUES (20342, '40-Mile Air')
INSERT INTO airlines (airlineID, name) VALUES (19678, 'Aloha Airlines Inc.')
INSERT INTO airlines (airlineID, name) VALUES (20319, 'Smokey Bay Air Inc.')
INSERT INTO airlines (airlineID, name) VALUES (19930, 'Alaska Airlines Inc.')
INSERT INTO airlines (airlineID, name) VALUES (20355, 'US Airways Inc.')
INSERT INTO airlines (airlineID, name) VALUES (19805, 'American Airlines Inc.')
INSERT INTO airlines (airlineID, name) VALUES (20368, 'Allegiant Air')
INSERT INTO airlines (airlineID, name) VALUES (20371, 'Reliant Airlines')
INSERT INTO airlines (airlineID, name) VALUES (20377, 'Omni Air International LLC')
INSERT INTO airlines (airlineID, name) VALUES (20176, 'National Airlines')
INSERT INTO airlines (airlineID, name) VALUES (20312, 'ATA Airlines d/b/a ATA')
INSERT INTO airlines (airlineID, name) VALUES (20106, 'Sunworld International Airlines')
INSERT INTO airlines (airlineID, name) VALUES (20281, 'Mountain Bird/Salmon Air')
INSERT INTO airlines (airlineID, name) VALUES (20177, 'Asia Pacific')
INSERT INTO airlines (airlineID, name) VALUES (20149, 'Florida West Airlines Inc.')
INSERT INTO airlines (airlineID, name) VALUES (20356, 'Skyway Airlines')
INSERT INTO airlines (airlineID, name) VALUES (20017, 'Continental Micronesia')
INSERT INTO airlines (airlineID, name) VALUES (20379, 'Zantop International')
INSERT INTO airlines (airlineID, name) VALUES (20416, 'Spirit Air Lines')
INSERT INTO airlines (airlineID, name) VALUES (20398, 'Envoy Air')
INSERT INTO airlines (airlineID, name) VALUES (20417, 'Comair Inc.')
INSERT INTO airlines (airlineID, name) VALUES (20237, 'Trans States Airlines')
INSERT INTO airlines (airlineID, name) VALUES (20428, 'Volga-Dnepr Airlines')
INSERT INTO airlines (airlineID, name) VALUES (20314, 'Midwest Airline, Inc.')
INSERT INTO airlines (airlineID, name) VALUES (20194, 'Arrow Air Inc.')
INSERT INTO airlines (airlineID, name) VALUES (20308, 'Centurion Cargo Inc.')
INSERT INTO airlines (airlineID, name) VALUES (20147, 'TransMeridian Airlines')
INSERT INTO airlines (airlineID, name) VALUES (20218, 'Express One International Inc.')
INSERT INTO airlines (airlineID, name) VALUES (20265, 'Freedom Airlines d/b/a HP Expr')
INSERT INTO airlines (airlineID, name) VALUES (20436, 'Frontier Airlines Inc.')
INSERT INTO airlines (airlineID, name) VALUES (20110, 'Antonov Company')
INSERT INTO airlines (airlineID, name) VALUES (20289, 'Friday Harbor Seaplanes')
INSERT INTO airlines (airlineID, name) VALUES (20286, 'Vintage Props & Jets Inc.')
INSERT INTO airlines (airlineID, name) VALUES (20363, 'Endeavor Air Inc.')
INSERT INTO airlines (airlineID, name) VALUES (20207, 'TEM Enterprises dba  Avelo Airlines')
INSERT INTO airlines (airlineID, name) VALUES (20397, 'PSA Airlines Inc.')
INSERT INTO airlines (airlineID, name) VALUES (20437, 'AirTran Airways Corporation')
INSERT INTO airlines (airlineID, name) VALUES (20192, 'Vanguard Airlines Inc.')
INSERT INTO airlines (airlineID, name) VALUES (20387, 'Pan American Airways Corp.')
INSERT INTO airlines (airlineID, name) VALUES (20279, 'Air-Serve')
INSERT INTO airlines (airlineID, name) VALUES (20204, 'Champion Air')
INSERT INTO airlines (airlineID, name) VALUES (20272, 'Kenmore Air Harbor')
INSERT INTO airlines (airlineID, name) VALUES (20423, 'USA 3000 Airlines')
INSERT INTO airlines (airlineID, name) VALUES (20448, 'Shuttle America Corp.')
INSERT INTO airlines (airlineID, name) VALUES (20274, 'Northwest Seaplanes')
INSERT INTO airlines (airlineID, name) VALUES (20406, 'NetJets Large Aircraft Company L.L.C.')
INSERT INTO airlines (airlineID, name) VALUES (20267, 'Grand Canyon Helicopters')
INSERT INTO airlines (airlineID, name) VALUES (20409, 'JetBlue Airways')
INSERT INTO airlines (airlineID, name) VALUES (19998, 'Sierra Pacific Airlines')
INSERT INTO airlines (airlineID, name) VALUES (19531, 'Air Canada')
INSERT INTO airlines (airlineID, name) VALUES (20247, 'Rio Grande Air')
INSERT INTO airlines (airlineID, name) VALUES (20297, 'Midway Airlines Inc.')
INSERT INTO airlines (airlineID, name) VALUES (20411, 'Arizona Express')
INSERT INTO airlines (airlineID, name) VALUES (20426, 'Vieques Air Link Inc.')
INSERT INTO airlines (airlineID, name) VALUES (20407, 'Regions Air, Inc.')
INSERT INTO airlines (airlineID, name) VALUES (20202, 'Chicago Express Airlines')
INSERT INTO airlines (airlineID, name) VALUES (20282, 'Samoa Aviation Inc.')
INSERT INTO airlines (airlineID, name) VALUES (20245, 'Great Plains Airlines Inc.')
INSERT INTO airlines (airlineID, name) VALUES (20273, 'New England Airlines Inc.')
INSERT INTO airlines (airlineID, name) VALUES (20414, 'Executive Airlines')
DROP TABLE IF EXISTS airplanes;

CREATE TABLE airplanes(airplane VARCHAR(68) NOT NULL, iataCode VARCHAR(3),icaoCode VARCHAR(4) NOT NULL PRIMARY KEY);

INSERT INTO airplanes(airplane,iataCode,icaoCode) VALUES ('Aerospatiale (Nord) 262','ND2','N262');
INSERT INTO airplanes(airplane,iataCode,icaoCode) VALUES ('Aerospatiale (Sud Aviation) Se.210 Caravelle','CRV','S210');
INSERT INTO airplanes(airplane,iataCode,icaoCode) VALUES ('Aerospatiale SN.601 Corvette','NDC','S601');
INSERT INTO airplanes(airplane,iataCode,icaoCode) VALUES ('Aerospatiale/Alenia ATR 42-300','AT4','AT43');
INSERT INTO airplanes(airplane,iataCode,icaoCode) VALUES ('Aerospatiale/Alenia ATR 42-500','AT5','AT45');
INSERT INTO airplanes(airplane,iataCode,icaoCode) VALUES ('Aerospatiale/Alenia ATR 42-600','ATR','AT46');
INSERT INTO airplanes(airplane,iataCode,icaoCode) VALUES ('Aerospatiale/Alenia ATR 72','AT7','AT72');
INSERT INTO airplanes(airplane,iataCode,icaoCode) VALUES ('Airbus A300','AB3','A30B');
INSERT INTO airplanes(airplane,iataCode,icaoCode) VALUES ('Airbus A300-600','AB6','A306');
INSERT INTO airplanes(airplane,iataCode,icaoCode) VALUES ('Airbus A300-600ST Super Transporter / Beluga','ABB','A3ST');
INSERT INTO airplanes(airplane,iataCode,icaoCode) VALUES ('Airbus A310','310','A310');
INSERT INTO airplanes(airplane,iataCode,icaoCode) VALUES ('Airbus A318','318','A318');
INSERT INTO airplanes(airplane,iataCode,icaoCode) VALUES ('Airbus A319','319','A319');
INSERT INTO airplanes(airplane,iataCode,icaoCode) VALUES ('Airbus A319neo','31N','A19N');
INSERT INTO airplanes(airplane,iataCode,icaoCode) VALUES ('Airbus A320','320','A320');
INSERT INTO airplanes(airplane,iataCode,icaoCode) VALUES ('Airbus A320neo','32N','A20N');
INSERT INTO airplanes(airplane,iataCode,icaoCode) VALUES ('Airbus A321','321','A321');
INSERT INTO airplanes(airplane,iataCode,icaoCode) VALUES ('Airbus A321neo','32Q','A21N');
INSERT INTO airplanes(airplane,iataCode,icaoCode) VALUES ('Airbus A330','330','A330');
INSERT INTO airplanes(airplane,iataCode,icaoCode) VALUES ('Airbus A330-200','332','A332');
INSERT INTO airplanes(airplane,iataCode,icaoCode) VALUES ('Airbus A330-300','333','A333');
INSERT INTO airplanes(airplane,iataCode,icaoCode) VALUES ('Airbus A330-700 Beluga XL',NULL,'A337');
INSERT INTO airplanes(airplane,iataCode,icaoCode) VALUES ('Airbus A330-800neo','338','A338');
INSERT INTO airplanes(airplane,iataCode,icaoCode) VALUES ('Airbus A330-900neo','339','A339');
INSERT INTO airplanes(airplane,iataCode,icaoCode) VALUES ('Airbus A340','340','A340');
INSERT INTO airplanes(airplane,iataCode,icaoCode) VALUES ('Airbus A340-200','342','A342');
INSERT INTO airplanes(airplane,iataCode,icaoCode) VALUES ('Airbus A340-300','343','A343');
INSERT INTO airplanes(airplane,iataCode,icaoCode) VALUES ('Airbus A340-500','345','A345');
INSERT INTO airplanes(airplane,iataCode,icaoCode) VALUES ('Airbus A340-600','346','A346');
INSERT INTO airplanes(airplane,iataCode,icaoCode) VALUES ('Airbus A350','350','A350');
INSERT INTO airplanes(airplane,iataCode,icaoCode) VALUES ('Airbus A350-1000','351','A35K');
INSERT INTO airplanes(airplane,iataCode,icaoCode) VALUES ('Airbus A350-900','359','A359');
INSERT INTO airplanes(airplane,iataCode,icaoCode) VALUES ('Airbus A380','380','A380');
INSERT INTO airplanes(airplane,iataCode,icaoCode) VALUES ('Airbus A380-800','388','A388');
INSERT INTO airplanes(airplane,iataCode,icaoCode) VALUES ('Antonov AN-12','ANF','AN12');
INSERT INTO airplanes(airplane,iataCode,icaoCode) VALUES ('Antonov AN-124 Ruslan','A4F','A124');
INSERT INTO airplanes(airplane,iataCode,icaoCode) VALUES ('Antonov AN-140','A40','A140');
INSERT INTO airplanes(airplane,iataCode,icaoCode) VALUES ('Antonov An-148','A81','A148');
INSERT INTO airplanes(airplane,iataCode,icaoCode) VALUES ('Antonov An-158','A58','A158');
INSERT INTO airplanes(airplane,iataCode,icaoCode) VALUES ('Antonov An-225 Mriya','A25','A225');
INSERT INTO airplanes(airplane,iataCode,icaoCode) VALUES ('Antonov AN-24','AN4','AN24');
INSERT INTO airplanes(airplane,iataCode,icaoCode) VALUES ('Antonov AN-26','A26','AN26');
INSERT INTO airplanes(airplane,iataCode,icaoCode) VALUES ('Antonov AN-28','A28','AN28');
INSERT INTO airplanes(airplane,iataCode,icaoCode) VALUES ('Antonov AN-30','A30','AN30');
INSERT INTO airplanes(airplane,iataCode,icaoCode) VALUES ('Antonov AN-32','A32','AN32');
INSERT INTO airplanes(airplane,iataCode,icaoCode) VALUES ('Antonov AN-72','AN7','AN72');
INSERT INTO airplanes(airplane,iataCode,icaoCode) VALUES ('Avro RJ100','AR1','RJ1H');
INSERT INTO airplanes(airplane,iataCode,icaoCode) VALUES ('Avro RJ70','AR7','RJ70');
INSERT INTO airplanes(airplane,iataCode,icaoCode) VALUES ('Avro RJ85','AR8','RJ85');
INSERT INTO airplanes(airplane,iataCode,icaoCode) VALUES ('BAe 146','146','B146');
INSERT INTO airplanes(airplane,iataCode,icaoCode) VALUES ('BAe 146-100','141','B461');
INSERT INTO airplanes(airplane,iataCode,icaoCode) VALUES ('BAe 146-200','142','B462');
INSERT INTO airplanes(airplane,iataCode,icaoCode) VALUES ('BAe 146-300','143','B463');
INSERT INTO airplanes(airplane,iataCode,icaoCode) VALUES ('Beechcraft 1900','BEH','B190');
INSERT INTO airplanes(airplane,iataCode,icaoCode) VALUES ('Beechcraft Baron',NULL,'BE58');
INSERT INTO airplanes(airplane,iataCode,icaoCode) VALUES ('Beechcraft Baron / 55 Baron',NULL,'BE55');
INSERT INTO airplanes(airplane,iataCode,icaoCode) VALUES ('Bell 212','BH2','B212');
INSERT INTO airplanes(airplane,iataCode,icaoCode) VALUES ('Boeing 707','703','B703');
INSERT INTO airplanes(airplane,iataCode,icaoCode) VALUES ('Boeing 717','717','B712');
INSERT INTO airplanes(airplane,iataCode,icaoCode) VALUES ('Boeing 720B','B72','B720');
INSERT INTO airplanes(airplane,iataCode,icaoCode) VALUES ('Boeing 727','727','B727');
INSERT INTO airplanes(airplane,iataCode,icaoCode) VALUES ('Boeing 727-100','721','B721');
INSERT INTO airplanes(airplane,iataCode,icaoCode) VALUES ('Boeing 727-200','722','B722');
INSERT INTO airplanes(airplane,iataCode,icaoCode) VALUES ('Boeing 737 MAX 7','7M7','B37M');
INSERT INTO airplanes(airplane,iataCode,icaoCode) VALUES ('Boeing 737 MAX 8','7M8','B38M');
INSERT INTO airplanes(airplane,iataCode,icaoCode) VALUES ('Boeing 737 MAX 9','7M9','B39M');
INSERT INTO airplanes(airplane,iataCode,icaoCode) VALUES ('Boeing 737-200','732','B732');
INSERT INTO airplanes(airplane,iataCode,icaoCode) VALUES ('Boeing 737-300','733','B733');
INSERT INTO airplanes(airplane,iataCode,icaoCode) VALUES ('Boeing 737-400','734','B734');
INSERT INTO airplanes(airplane,iataCode,icaoCode) VALUES ('Boeing 737-500','735','B735');
INSERT INTO airplanes(airplane,iataCode,icaoCode) VALUES ('Boeing 737-600','736','B736');
INSERT INTO airplanes(airplane,iataCode,icaoCode) VALUES ('Boeing 737-700','73G','B737');
INSERT INTO airplanes(airplane,iataCode,icaoCode) VALUES ('Boeing 737-800','738','B738');
INSERT INTO airplanes(airplane,iataCode,icaoCode) VALUES ('Boeing 737-900','739','B739');
INSERT INTO airplanes(airplane,iataCode,icaoCode) VALUES ('Boeing 747 LCF Dreamlifter','74B','BLCF');
INSERT INTO airplanes(airplane,iataCode,icaoCode) VALUES ('Boeing 747-100','741','B741');
INSERT INTO airplanes(airplane,iataCode,icaoCode) VALUES ('Boeing 747-200','742','B742');
INSERT INTO airplanes(airplane,iataCode,icaoCode) VALUES ('Boeing 747-300','743','B743');
INSERT INTO airplanes(airplane,iataCode,icaoCode) VALUES ('Boeing 747-400','744','B744');
INSERT INTO airplanes(airplane,iataCode,icaoCode) VALUES ('Boeing 747-400D','74J','B74D');
INSERT INTO airplanes(airplane,iataCode,icaoCode) VALUES ('Boeing 747-8','748','B748');
INSERT INTO airplanes(airplane,iataCode,icaoCode) VALUES ('Boeing 747SP','74L','B74S');
INSERT INTO airplanes(airplane,iataCode,icaoCode) VALUES ('Boeing 747SR','74R','B74R');
INSERT INTO airplanes(airplane,iataCode,icaoCode) VALUES ('Boeing 757-200','752','B752');
INSERT INTO airplanes(airplane,iataCode,icaoCode) VALUES ('Boeing 757-300','753','B753');
INSERT INTO airplanes(airplane,iataCode,icaoCode) VALUES ('Boeing 767-200','762','B762');
INSERT INTO airplanes(airplane,iataCode,icaoCode) VALUES ('Boeing 767-300','763','B763');
INSERT INTO airplanes(airplane,iataCode,icaoCode) VALUES ('Boeing 767-400','764','B764');
INSERT INTO airplanes(airplane,iataCode,icaoCode) VALUES ('Boeing 777-200','772','B772');
INSERT INTO airplanes(airplane,iataCode,icaoCode) VALUES ('Boeing 777-200LR','77L','B77L');
INSERT INTO airplanes(airplane,iataCode,icaoCode) VALUES ('Boeing 777-300','773','B773');
INSERT INTO airplanes(airplane,iataCode,icaoCode) VALUES ('Boeing 777-300ER','77W','B77W');
INSERT INTO airplanes(airplane,iataCode,icaoCode) VALUES ('Boeing 777-8','778','B778');
INSERT INTO airplanes(airplane,iataCode,icaoCode) VALUES ('Boeing 777-9','779','B779');
INSERT INTO airplanes(airplane,iataCode,icaoCode) VALUES ('Boeing 787-10','78J','B78X');
INSERT INTO airplanes(airplane,iataCode,icaoCode) VALUES ('Boeing 787-8','788','B788');
INSERT INTO airplanes(airplane,iataCode,icaoCode) VALUES ('Boeing 787-9','789','B789');
INSERT INTO airplanes(airplane,iataCode,icaoCode) VALUES ('Bombardier 415',NULL,'CL2T');
INSERT INTO airplanes(airplane,iataCode,icaoCode) VALUES ('Bombardier BD-100 Challenger 300',NULL,'CL30');
INSERT INTO airplanes(airplane,iataCode,icaoCode) VALUES ('Bombardier CS100','CS1','BCS1');
INSERT INTO airplanes(airplane,iataCode,icaoCode) VALUES ('Bombardier CS300','CS3','BCS3');
INSERT INTO airplanes(airplane,iataCode,icaoCode) VALUES ('Bombardier Global Express','CCX','GLEX');
INSERT INTO airplanes(airplane,iataCode,icaoCode) VALUES ('British Aerospace (BAC) One Eleven','B11','BA11');
INSERT INTO airplanes(airplane,iataCode,icaoCode) VALUES ('British Aerospace 125 series / Hawker/Raytheon 700/800/800XP/850/900','H25','H25B');
INSERT INTO airplanes(airplane,iataCode,icaoCode) VALUES ('British Aerospace 125-1000 series / Hawker/Raytheon 1000','H25','H25C');
INSERT INTO airplanes(airplane,iataCode,icaoCode) VALUES ('British Aerospace ATP','ATP','ATP');
INSERT INTO airplanes(airplane,iataCode,icaoCode) VALUES ('British Aerospace Jetstream 31','J31','JS31');
INSERT INTO airplanes(airplane,iataCode,icaoCode) VALUES ('British Aerospace Jetstream 32','J32','JS32');
INSERT INTO airplanes(airplane,iataCode,icaoCode) VALUES ('British Aerospace Jetstream 41','J41','JS41');
INSERT INTO airplanes(airplane,iataCode,icaoCode) VALUES ('Canadair Challenger','CCJ','CL60');
INSERT INTO airplanes(airplane,iataCode,icaoCode) VALUES ('Canadair CL-44','CL4','CL44');
INSERT INTO airplanes(airplane,iataCode,icaoCode) VALUES ('Canadair Regional Jet 100','CR1','CRJ1');
INSERT INTO airplanes(airplane,iataCode,icaoCode) VALUES ('Canadair Regional Jet 1000','CRK','CRJX');
INSERT INTO airplanes(airplane,iataCode,icaoCode) VALUES ('Canadair Regional Jet 200','CR2','CRJ2');
INSERT INTO airplanes(airplane,iataCode,icaoCode) VALUES ('Canadair Regional Jet 700','CR7','CRJ7');
INSERT INTO airplanes(airplane,iataCode,icaoCode) VALUES ('Canadair Regional Jet 900','CR9','CRJ9');
INSERT INTO airplanes(airplane,iataCode,icaoCode) VALUES ('Cessna 152',NULL,'C152');
INSERT INTO airplanes(airplane,iataCode,icaoCode) VALUES ('Cessna 172','CN1','C172');
INSERT INTO airplanes(airplane,iataCode,icaoCode) VALUES ('Cessna 182 Skylane','CN1','C182');
INSERT INTO airplanes(airplane,iataCode,icaoCode) VALUES ('Cessna 208 Caravan','CN1','C208');
INSERT INTO airplanes(airplane,iataCode,icaoCode) VALUES ('Cessna 210 Centurion','CN1','C210');
INSERT INTO airplanes(airplane,iataCode,icaoCode) VALUES ('Cessna Citation CJ3','CNJ','C25B');
INSERT INTO airplanes(airplane,iataCode,icaoCode) VALUES ('Cessna Citation CJ4','CNJ','C25C');
INSERT INTO airplanes(airplane,iataCode,icaoCode) VALUES ('Cessna Citation Excel','CNJ','C56X');
INSERT INTO airplanes(airplane,iataCode,icaoCode) VALUES ('Cessna Citation I','CNJ','C500');
INSERT INTO airplanes(airplane,iataCode,icaoCode) VALUES ('Cessna Citation II','CNJ','C550');
INSERT INTO airplanes(airplane,iataCode,icaoCode) VALUES ('Cessna Citation Mustang','CNJ','C510');
INSERT INTO airplanes(airplane,iataCode,icaoCode) VALUES ('Cessna Citation Sovereign','CNJ','C680');
INSERT INTO airplanes(airplane,iataCode,icaoCode) VALUES ('Cessna Citation X','CNJ','C750');
INSERT INTO airplanes(airplane,iataCode,icaoCode) VALUES ('COMAC C-919',NULL,'C919');
INSERT INTO airplanes(airplane,iataCode,icaoCode) VALUES ('Concorde','SSC','CONC');
INSERT INTO airplanes(airplane,iataCode,icaoCode) VALUES ('Dassault Falcon 2000','D20','F2TH');
INSERT INTO airplanes(airplane,iataCode,icaoCode) VALUES ('Dassault Falcon 50','DF3','FA50');
INSERT INTO airplanes(airplane,iataCode,icaoCode) VALUES ('Dassault Falcon 7X','DF7','FA7X');
INSERT INTO airplanes(airplane,iataCode,icaoCode) VALUES ('Dassault Falcon 900','DF9','F900');
INSERT INTO airplanes(airplane,iataCode,icaoCode) VALUES ('De Havilland Canada DHC-2 Beaver','DHP','DHC2');
INSERT INTO airplanes(airplane,iataCode,icaoCode) VALUES ('De Havilland Canada DHC-2 Turbo-Beaver','DHR','DH2T');
INSERT INTO airplanes(airplane,iataCode,icaoCode) VALUES ('De Havilland Canada DHC-3 Otter','DHL','DHC3');
INSERT INTO airplanes(airplane,iataCode,icaoCode) VALUES ('De Havilland Canada DHC-4 Caribou','DHC','DHC4');
INSERT INTO airplanes(airplane,iataCode,icaoCode) VALUES ('De Havilland Canada DHC-6 Twin Otter','DHT','DHC6');
INSERT INTO airplanes(airplane,iataCode,icaoCode) VALUES ('De Havilland Canada DHC-7 Dash 7','DH7','DHC7');
INSERT INTO airplanes(airplane,iataCode,icaoCode) VALUES ('De Havilland Canada DHC-8-100 Dash 8 / 8Q','DH1','DH8A');
INSERT INTO airplanes(airplane,iataCode,icaoCode) VALUES ('De Havilland Canada DHC-8-200 Dash 8 / 8Q','DH2','DH8B');
INSERT INTO airplanes(airplane,iataCode,icaoCode) VALUES ('De Havilland Canada DHC-8-300 Dash 8','DH3','DH8C');
INSERT INTO airplanes(airplane,iataCode,icaoCode) VALUES ('De Havilland Canada DHC-8-400 Dash 8Q','DH4','DH8D');
INSERT INTO airplanes(airplane,iataCode,icaoCode) VALUES ('De Havilland DH.104 Dove','DHD','DOVE');
INSERT INTO airplanes(airplane,iataCode,icaoCode) VALUES ('De Havilland DH.114 Heron','DHH','HERN');
INSERT INTO airplanes(airplane,iataCode,icaoCode) VALUES ('Douglas DC-10','D10','DC10');
INSERT INTO airplanes(airplane,iataCode,icaoCode) VALUES ('Douglas DC-3','D3F','DC3');
INSERT INTO airplanes(airplane,iataCode,icaoCode) VALUES ('Douglas DC-6','D6F','DC6');
INSERT INTO airplanes(airplane,iataCode,icaoCode) VALUES ('Douglas DC-8-50','D8T','DC85');
INSERT INTO airplanes(airplane,iataCode,icaoCode) VALUES ('Douglas DC-8-62','D8L','DC86');
INSERT INTO airplanes(airplane,iataCode,icaoCode) VALUES ('Douglas DC-8-72','D8Q','DC87');
INSERT INTO airplanes(airplane,iataCode,icaoCode) VALUES ('Douglas DC-9-10','D91','DC91');
INSERT INTO airplanes(airplane,iataCode,icaoCode) VALUES ('Douglas DC-9-20','D92','DC92');
INSERT INTO airplanes(airplane,iataCode,icaoCode) VALUES ('Douglas DC-9-30','D93','DC93');
INSERT INTO airplanes(airplane,iataCode,icaoCode) VALUES ('Douglas DC-9-40','D94','DC94');
INSERT INTO airplanes(airplane,iataCode,icaoCode) VALUES ('Douglas DC-9-50','D95','DC95');
INSERT INTO airplanes(airplane,iataCode,icaoCode) VALUES ('Embraer 170','E70','E170');
INSERT INTO airplanes(airplane,iataCode,icaoCode) VALUES ('Embraer 175 (long wing)','E7W','E75L');
INSERT INTO airplanes(airplane,iataCode,icaoCode) VALUES ('Embraer 175 (short wing)','E7W','E75S');
INSERT INTO airplanes(airplane,iataCode,icaoCode) VALUES ('Embraer 190','E90','E190');
INSERT INTO airplanes(airplane,iataCode,icaoCode) VALUES ('Embraer 195','E95','E195');
INSERT INTO airplanes(airplane,iataCode,icaoCode) VALUES ('Embraer E190-E2','290','E290');
INSERT INTO airplanes(airplane,iataCode,icaoCode) VALUES ('Embraer E195-E2','295','E295');
INSERT INTO airplanes(airplane,iataCode,icaoCode) VALUES ('Embraer EMB 110 Bandeirante','EMB','E110');
INSERT INTO airplanes(airplane,iataCode,icaoCode) VALUES ('Embraer EMB 120 Brasilia','EM2','E120');
INSERT INTO airplanes(airplane,iataCode,icaoCode) VALUES ('Embraer Legacy 450',NULL,'E545');
INSERT INTO airplanes(airplane,iataCode,icaoCode) VALUES ('Embraer Legacy 600','ER3','E35L');
INSERT INTO airplanes(airplane,iataCode,icaoCode) VALUES ('Embraer Phenom 100','EP1','E50P');
INSERT INTO airplanes(airplane,iataCode,icaoCode) VALUES ('Embraer Phenom 300','EP3','E55P');
--INSERT INTO airplanes(airplane,iataCode,icaoCode) VALUES ('Embraer RJ135','ER3','E135');
INSERT INTO airplanes(airplane,iataCode,icaoCode) VALUES ('Embraer RJ140','ERD','E135');
INSERT INTO airplanes(airplane,iataCode,icaoCode) VALUES ('Embraer RJ145','ER4','E145');
INSERT INTO airplanes(airplane,iataCode,icaoCode) VALUES ('Fairchild Dornier 328JET','FRJ','J328');
INSERT INTO airplanes(airplane,iataCode,icaoCode) VALUES ('Fairchild Dornier Do.228','D28','D228');
INSERT INTO airplanes(airplane,iataCode,icaoCode) VALUES ('Fairchild Dornier Do.328','D38','D328');
INSERT INTO airplanes(airplane,iataCode,icaoCode) VALUES ('Fokker 100','100','F100');
INSERT INTO airplanes(airplane,iataCode,icaoCode) VALUES ('Fokker 50','F50','F50');
INSERT INTO airplanes(airplane,iataCode,icaoCode) VALUES ('Fokker 70','F70','F70');
INSERT INTO airplanes(airplane,iataCode,icaoCode) VALUES ('Fokker F27 Friendship','F27','F27');
INSERT INTO airplanes(airplane,iataCode,icaoCode) VALUES ('Fokker F28 Fellowship','F21','F28');
INSERT INTO airplanes(airplane,iataCode,icaoCode) VALUES ('Gulfstream Aerospace G-159 Gulfstream I','GRS','G159');
INSERT INTO airplanes(airplane,iataCode,icaoCode) VALUES ('Gulfstream G280','GR3','G280');
INSERT INTO airplanes(airplane,iataCode,icaoCode) VALUES ('Gulfstream G650','GJ6','GLF6');
INSERT INTO airplanes(airplane,iataCode,icaoCode) VALUES ('Gulfstream IV','GJ4','GLF4');
INSERT INTO airplanes(airplane,iataCode,icaoCode) VALUES ('Gulfstream V','GJ5','GLF5');
INSERT INTO airplanes(airplane,iataCode,icaoCode) VALUES ('Gulfstream/Rockwell (Aero) Commander','ACP','AC68');
INSERT INTO airplanes(airplane,iataCode,icaoCode) VALUES ('Gulfstream/Rockwell (Aero) Turbo Commander','ACT','AC90');
INSERT INTO airplanes(airplane,iataCode,icaoCode) VALUES ('Harbin Yunshuji Y12','YN2','Y12');
INSERT INTO airplanes(airplane,iataCode,icaoCode) VALUES ('Hawker Siddeley HS 748','HS7','A748');
INSERT INTO airplanes(airplane,iataCode,icaoCode) VALUES ('Ilyushin IL114','I14','I114');
INSERT INTO airplanes(airplane,iataCode,icaoCode) VALUES ('Ilyushin IL18','IL8','IL18');
INSERT INTO airplanes(airplane,iataCode,icaoCode) VALUES ('Ilyushin IL62','IL6','IL62');
INSERT INTO airplanes(airplane,iataCode,icaoCode) VALUES ('Ilyushin IL76','IL7','IL76');
INSERT INTO airplanes(airplane,iataCode,icaoCode) VALUES ('Ilyushin IL86','ILW','IL86');
INSERT INTO airplanes(airplane,iataCode,icaoCode) VALUES ('Ilyushin IL96','I93','IL96');
INSERT INTO airplanes(airplane,iataCode,icaoCode) VALUES ('Learjet 35','LRJ','LJ35');
INSERT INTO airplanes(airplane,iataCode,icaoCode) VALUES ('Learjet 60','LRJ','LJ60');
INSERT INTO airplanes(airplane,iataCode,icaoCode) VALUES ('Lockheed L-1011 Tristar','L10','L101');
INSERT INTO airplanes(airplane,iataCode,icaoCode) VALUES ('Lockheed L-1049 Super Constellation','L49','CONI');
INSERT INTO airplanes(airplane,iataCode,icaoCode) VALUES ('Lockheed L-182 / 282 / 382 (L-100) Hercules','LOH','C130');
INSERT INTO airplanes(airplane,iataCode,icaoCode) VALUES ('Lockheed L-188 Electra','LOE','L188');
INSERT INTO airplanes(airplane,iataCode,icaoCode) VALUES ('McDonnell Douglas MD-11','M11','MD11');
INSERT INTO airplanes(airplane,iataCode,icaoCode) VALUES ('McDonnell Douglas MD-81','M81','MD81');
INSERT INTO airplanes(airplane,iataCode,icaoCode) VALUES ('McDonnell Douglas MD-82','M82','MD82');
INSERT INTO airplanes(airplane,iataCode,icaoCode) VALUES ('McDonnell Douglas MD-83','M83','MD83');
INSERT INTO airplanes(airplane,iataCode,icaoCode) VALUES ('McDonnell Douglas MD-87','M87','MD87');
INSERT INTO airplanes(airplane,iataCode,icaoCode) VALUES ('McDonnell Douglas MD-88','M88','MD88');
INSERT INTO airplanes(airplane,iataCode,icaoCode) VALUES ('McDonnell Douglas MD-90','M90','MD90');
INSERT INTO airplanes(airplane,iataCode,icaoCode) VALUES ('NAMC YS-11','YS1','YS11');
INSERT INTO airplanes(airplane,iataCode,icaoCode) VALUES ('Partenavia P.68','PN6','P68');
INSERT INTO airplanes(airplane,iataCode,icaoCode) VALUES ('Pilatus Britten-Norman BN-2A Mk III Trislander','BNT','TRIS');
INSERT INTO airplanes(airplane,iataCode,icaoCode) VALUES ('Pilatus Britten-Norman BN-2A/B Islander','BNI','BN2P');
INSERT INTO airplanes(airplane,iataCode,icaoCode) VALUES ('Pilatus PC-12','PL2','PC12');
INSERT INTO airplanes(airplane,iataCode,icaoCode) VALUES ('Pilatus PC-6 Turbo Porter','PL6','PC6T');
INSERT INTO airplanes(airplane,iataCode,icaoCode) VALUES ('Piper PA-28(above 200 hp)',NULL,'P28B');
INSERT INTO airplanes(airplane,iataCode,icaoCode) VALUES ('Piper PA-28(up to 180 hp)',NULL,'P28A');
INSERT INTO airplanes(airplane,iataCode,icaoCode) VALUES ('Piper PA-31 Navajo','PA2','PA31');
INSERT INTO airplanes(airplane,iataCode,icaoCode) VALUES ('Piper PA-44 Seminole',NULL,'PA44');
INSERT INTO airplanes(airplane,iataCode,icaoCode) VALUES ('Piper PA-46','PAG','PA46');
INSERT INTO airplanes(airplane,iataCode,icaoCode) VALUES ('Saab 2000','S20','SB20');
INSERT INTO airplanes(airplane,iataCode,icaoCode) VALUES ('Saab SF340A/B','SF3','SF34');
INSERT INTO airplanes(airplane,iataCode,icaoCode) VALUES ('Shorts SC-5 Belfast','SHB','BELF');
INSERT INTO airplanes(airplane,iataCode,icaoCode) VALUES ('Shorts SC-7 Skyvan','SHS','SC7');
INSERT INTO airplanes(airplane,iataCode,icaoCode) VALUES ('Shorts SD.330','SH3','SH33');
INSERT INTO airplanes(airplane,iataCode,icaoCode) VALUES ('Shorts SD.360','SH6','SH36');
INSERT INTO airplanes(airplane,iataCode,icaoCode) VALUES ('Sikorsky S-58T','S58','S58T');
INSERT INTO airplanes(airplane,iataCode,icaoCode) VALUES ('Sikorsky S-61','S61','S61');
INSERT INTO airplanes(airplane,iataCode,icaoCode) VALUES ('Sikorsky S-76','S76','S76');
INSERT INTO airplanes(airplane,iataCode,icaoCode) VALUES ('Sikorsky S-92','S92','S92');
INSERT INTO airplanes(airplane,iataCode,icaoCode) VALUES ('Sukhoi Superjet 100-95','SU9','SU95');
INSERT INTO airplanes(airplane,iataCode,icaoCode) VALUES ('Tupolev Tu-134','TU3','T134');
INSERT INTO airplanes(airplane,iataCode,icaoCode) VALUES ('Tupolev Tu-144',NULL,'T144');
INSERT INTO airplanes(airplane,iataCode,icaoCode) VALUES ('Tupolev Tu-154','TU5','T154');
INSERT INTO airplanes(airplane,iataCode,icaoCode) VALUES ('Tupolev Tu-204','T20','T204');
INSERT INTO airplanes(airplane,iataCode,icaoCode) VALUES ('Yakovlev Yak-40','YK4','YK40');
INSERT INTO airplanes(airplane,iataCode,icaoCode) VALUES ('Yakovlev Yak-42','YK2','YK42');

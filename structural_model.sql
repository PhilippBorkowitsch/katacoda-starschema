CREATE TABLE Persons (
    userid SERIAL PRIMARY KEY,
    lastname VARCHAR(32) NOT NULL,
    firstname VARCHAR(32) NOT NULL,
    location VARCHAR(64),
    birthday DATE,
    gender CHAR(1) NOT NULL,
    comment VARCHAR(100)
);

CREATE TABLE Production_plants (
    plantid SERIAL PRIMARY KEY,
    plantname VARCHAR(32),
    country VARCHAR(32)
);

CREATE TABLE Vehicles (
    vehicle_identifier SERIAL PRIMARY KEY,
    sales_date DATE,
    sales_price FLOAT,
    discount FLOAT,
    production_date DATE,
    manufacturer INT REFERENCES Production_plants(plantid),
    model VARCHAR(5)
);

CREATE TABLE Sales_Persons (
    vehicle_identifier INT REFERENCES Vehicles(vehicle_identifier),
    userid INT REFERENCES Persons(userid)
);

CREATE TABLE Owners (
    vehicle_identifier INT REFERENCES Vehicles(vehicle_identifier),
    userid INT REFERENCES Persons(userid)
);


COPY Production_plants(
  plantid,
  plantname,
  country
) FROM '/usr/src/katacoda-starschema/mock_data/Production_plants.csv'
DELIMITER ',';

COPY Persons(
  lastname,
  firstname,
  location,
  birthday,
  gender,
  comment
) FROM '/usr/src/katacoda-starschema/mock_data/Persons.csv'
DELIMITER ','
CSV HEADER;

COPY Vehicles(
  vehicle_identifier,
  sales_date,
  sales_price,
  discount,
  production_date,
  manufacturer,
  model
) FROM '/usr/src/katacoda-starschema/mock_data/Vehicles.csv'
DELIMITER ',';

COPY Sales_persons(
  vehicle_identifier,
  userid 
) FROM '/usr/src/katacoda-starschema/mock_data/Sales_Persons.csv'
DELIMITER ',';

COPY Owners(
  vehicle_identifier,
  userid 
) FROM '/usr/src/katacoda-starschema/mock_data/Owners.csv'
DELIMITER ',';

CREATE TABLE D_Persons (
    personid SERIAL PRIMARY KEY,
    userid INT NOT NULL,
    lastname VARCHAR(32) NOT NULL,
    firstname VARCHAR(32) NOT NULL,
    location VARCHAR(64),
    birthday DATE,
    gender CHAR(1) NOT NULL,
    comment VARCHAR(100)
);

CREATE TABLE D_Vehicles (
    vehicleid SERIAL PRIMARY KEY,
    vehicle_identifier INT NOT NULL,
    model VARCHAR(5)
);

CREATE TABLE D_Production_Plants (
    plantid SERIAL PRIMARY KEY,
    plantname VARCHAR(32),
    country VARCHAR(32)
);

CREATE TABLE D_Times (
    timeid SERIAL PRIMARY KEY,
    date DATE NOT NULL,
    day INT NOT NULL,
    month INT NOT NULL,
    year INT NOT NULL
);

CREATE TABLE F_Sales (
    timeid_sales INT REFERENCES D_Times(timeid),
    timeid_production INT REFERENCES D_Times(timeid),
    vehicleid INT REFERENCES D_Vehicles(vehicleid),
    personid_owner INT REFERENCES D_Persons(personid),
    personid_sales INT REFERENCES D_Persons(personid),
    plantid INT REFERENCES D_Production_Plants(plantid),
    sales_price FLOAT NOT NULL,
    discount FLOAT NOT NULL
);
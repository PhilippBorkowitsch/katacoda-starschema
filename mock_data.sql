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

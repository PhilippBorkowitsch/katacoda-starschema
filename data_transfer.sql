INSERT INTO D_Persons (
    userid,
    lastname,
    firstname,
    location,
    birthday,
    gender,
    comment
)
SELECT 
    userid,
    lastname,
    firstname,
    location,
    birthday,
    gender,
    comment
FROM Persons;

INSERT INTO D_Vehicles (
    vehicle_identifier,
    model
) SELECT 
    vehicle_identifier,
    model
FROM Vehicles;

INSERT INTO D_Production_Plants (
    plantname,
    country
) SELECT 
    plantname,
    country
FROM Production_plants;

INSERT INTO D_Times (
    date,
    day,
    month,
    year
) SELECT
    sales_date,
    EXTRACT(DAY FROM sales_date),
    EXTRACT(MONTH FROM sales_date),
    EXTRACT(YEAR FROM sales_date)
FROM Vehicles;

INSERT INTO D_Times (
    date,
    day,
    month,
    year
) SELECT
    production_date,
    EXTRACT(DAY FROM sales_date),
    EXTRACT(MONTH FROM sales_date),
    EXTRACT(YEAR FROM sales_date)
FROM Vehicles;

INSERT INTO F_Sales (
    timeid_sales,
    timeid_production,
    vehicleid,
    personid_owner,
    personid_sales,
    plantid,
    sales_price,
    discount
) SELECT
    sales_date.timeid,
    prod_date.timeid,
    veh.vehicleid,
    own.personid,
    sal.personid,
    pp.plantid,
    v.sales_price,
    v.discount
FROM Vehicles v
INNER JOIN D_Times sales_date ON sales_date.date = v.sales_date
INNER JOIN D_Times prod_date ON prod_date.date = v.production_date
INNER JOIN D_Vehicles veh ON veh.vehicle_identifier = v.vehicle_identifier
INNER JOIN Owners o ON o.vehicle_identifier = v.vehicle_identifier
INNER JOIN D_Persons own ON own.userid = o.userid
INNER JOIN Sales_Persons s ON s.vehicle_identifier = v.vehicle_identifier
INNER JOIN D_Persons sal ON sal.userid = s.userid
INNER JOIN D_Production_plants pp ON pp.plantid = v.manufacturer;
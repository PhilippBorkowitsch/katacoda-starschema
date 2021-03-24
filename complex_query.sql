SELECT 
    v.vehicle_identifier AS vehicle_id,
    v.sales_date AS sales_date,
    v.sales_price AS sales_price,
    v.discount AS discount,
    v.production_date AS production_date,
    v.model AS model,

    ow.userid AS owner_id,
    ow.lastname AS owner_lastname,
    ow.firstname AS owner_firstname,
    ow.location AS owner_location,
    ow.birthday AS owner_birthday,
    ow.gender AS owner_gender,
    ow.comment AS owner_comment,

    sa.userid AS sales_id,
    sa.lastname AS sales_lastname,
    sa.firstname AS sales_firstname,
    sa.location AS sales_location,
    sa.birthday AS sales_birthday,
    sa.gender AS sales_gender,
    sa.comment AS sales_comment,

    p.plantid AS production_plant_id,
    p.plantname AS production_plant_name,
    p.country AS production_plant_country

FROM Vehicles v
INNER JOIN Production_plants p ON v.manufacturer = p.plantid
INNER JOIN Owners o ON o.vehicle_identifier = v.vehicle_identifier
INNER JOIN Persons ow ON ow.userid = o.userid
INNER JOIN Sales_Persons s ON s.vehicle_identifier = v.vehicle_identifier
INNER JOIN Persons sa ON sa.userid = s.userid
;
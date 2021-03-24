SELECT * FROM F_Sales f
INNER JOIN D_Times sel ON sel.timeid = f.timeid_sales
INNER JOIN D_Times pro ON pro.timeid = f.timeid_production
INNER JOIN D_Vehicles veh ON veh.vehicleid = f.vehicleid 
INNER JOIN D_Persons own ON own.personid = f.personid_owner
INNER JOIN D_Persons sal ON sal.personid = f.personid_sales
INNER JOIN D_Production_Plants pp ON pp.plantid = f.plantid;

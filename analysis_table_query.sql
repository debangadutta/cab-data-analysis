CREATE OR REPLACE TABLE `cab-data-analysis.cab_data_analysis.analysis` AS (
SELECT 
f.VendorID as VendorID,
d.tpep_pickup_datetime as Pickup_Datetime,
d.tpep_dropoff_datetime as Dropoff_Datetime,
p.passenger_count as Passenger_Count,
t.trip_distance as Trip_Distance,
r.rate_code_name as Rate_Desc,
pick.pickup_latitude as Pickup_Latitude,
pick.pickup_longitude as Pickup_Longitude,
drp.dropoff_latitude as Dropoff_Latitude,
drp.dropoff_longitude as Dropoff_Longitude,
pay.payment_type_name as Payment_Type,
f.fare_amount as Fare_Amount,
f.extra as Extra,
f.mta_tax as MTA_Tax,
f.tip_amount as Tip,
f.tolls_amount as Tolls,
f.improvement_surcharge as Improvement_Surcharge,
f.total_amount as Total
FROM 

`cab_data_analysis.fact_table` f
JOIN `cab_data_analysis.datetime_dim` d  ON f.datetime_id=d.datetime_id
JOIN `cab_data_analysis.passenger_count_dim` p  ON p.passenger_count_id=f.passenger_count_id  
JOIN `cab_data_analysis.trip_distance_dim` t  ON t.trip_distance_id=f.trip_distance_id  
JOIN `cab_data_analysis.rate_code_dim` r ON r.rate_code_id=f.rate_code_id  
JOIN `cab_data_analysis.pickup_location_dim` pick ON pick.pickup_location_id=f.pickup_location_id
JOIN `cab_data_analysis.dropoff_location_dim` drp ON drp.dropoff_location_id=f.dropoff_location_id
JOIN `cab_data_analysis.payment_type_dim` pay ON pay.payment_type_id=f.payment_type_id)
;
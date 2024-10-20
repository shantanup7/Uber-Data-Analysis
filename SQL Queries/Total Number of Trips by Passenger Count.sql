-- Find the total number of trips by passenger count:

SELECT p.passenger_count, COUNT(*) AS Number_of_Trips
FROM uber-data-analysis-438121.uber_data_analysis.fact_table f
JOIN uber-data-analysis-438121.uber_data_analysis.passenger_count_dim p
ON f.passenger_count_id = p.passenger_count_id
GROUP BY 1
ORDER BY 1;
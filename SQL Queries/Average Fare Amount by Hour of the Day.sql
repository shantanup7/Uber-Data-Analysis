-- Find the average fare amount by hour of the day

SELECT d.pick_hour AS Pick_Hour_of_the_Day, ROUND(AVG(f.fare_amount), 2) AS Average_Fare_Amount
FROM uber-data-analysis-438121.uber_data_analysis.fact_table f
JOIN uber-data-analysis-438121.uber_data_analysis.datetime_dim d
ON f.datetime_id = d.datetime_id
GROUP BY 1
ORDER BY 1;
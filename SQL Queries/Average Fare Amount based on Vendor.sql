-- Average fare amount based on each vendor

SELECT VendorID AS Vendor, ROUND(AVG(fare_amount), 2) AS Average_Fare_Amount
FROM uber-data-analysis-438121.uber_data_analysis.fact_table 
GROUP BY 1;

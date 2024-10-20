--Total Fare Amount by each Vendor

SELECT VendorID AS Vendor, ROUND(SUM(fare_amount), 2) AS Total_Fare_Amount
FROM uber-data-analysis-438121.uber_data_analysis.fact_table 
GROUP BY 1;
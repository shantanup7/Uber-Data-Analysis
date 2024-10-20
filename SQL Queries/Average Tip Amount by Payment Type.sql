--Avg Tip Amount by Payment Type

SELECT p.payment_type_name AS Payment_Type_Name, AVG(f.tip_amount) AS Tip_Amount
FROM uber-data-analysis-438121.uber_data_analysis.fact_table f
INNER JOIN uber-data-analysis-438121.uber_data_analysis.payment_type_dim p
ON f.payment_type_id = p.payment_type_id
GROUP BY 1
ORDER BY 1;
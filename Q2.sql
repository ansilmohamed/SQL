select *from prescription;
select *from contain;
select *from pharmacy;
SELECT 
    p.prescriptionID, 
    SUM(c.Quantity) AS totalQuantity,
    CASE 
        WHEN SUM(c.Quantity) < 20 THEN 'Low Quantity'
        WHEN SUM(c.Quantity) BETWEEN 20 AND 49 THEN 'Medium Quantity'
        WHEN SUM(c.Quantity) >= 50 THEN 'High Quantity'
    END AS Tag
FROM Prescription p
JOIN Contain c ON p.prescriptionID = c.prescriptionID
JOIN Pharmacy ph ON p.pharmacyID = ph.pharmacyID
WHERE ph.pharmacyName = 'Ally Scripts'
GROUP BY p.prescriptionID;
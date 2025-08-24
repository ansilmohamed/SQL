SELECT 
    k.pharmacyID,
    ph.pharmacyName,
    k.medicineID, 
    m.productName,
    k.quantity, 
    k.discount,
    CASE 
        WHEN k.quantity > 7500 THEN 'High Quantity'
        WHEN k.quantity < 1000 THEN 'Low Quantity'
        ELSE 'Medium Quantity'
    END AS QuantityStatus,
    CASE 
        WHEN k.discount >= 30 THEN 'High Discount'
        WHEN k.discount = 0 THEN 'No Discount'
        ELSE 'Medium Discount'
    END AS DiscountStatus
FROM Keep k
JOIN Pharmacy ph ON k.pharmacyID = ph.pharmacyID
JOIN Medicine m ON k.medicineID = m.medicineID
WHERE 
    ph.pharmacyName = 'Spot Rx' 
    AND (
        (k.quantity < 1000 AND k.discount >= 30)  -- Low quantity, high discount
        OR 
        (k.quantity > 7500 AND k.discount = 0)   -- High quantity, no discount
    );
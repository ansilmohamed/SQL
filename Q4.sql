WITH AvgPrice AS (
    SELECT AVG(maxPrice) AS avgMaxPrice FROM Medicine
)
SELECT 
    m.medicineID, 
    m.productName, 
    m.maxPrice,
    CASE 
        WHEN m.maxPrice < (0.5 * (SELECT avgMaxPrice FROM AvgPrice)) THEN 'Affordable'
        WHEN m.maxPrice > (2 * (SELECT avgMaxPrice FROM AvgPrice)) THEN 'Costly'
    END AS PriceCategory
FROM Medicine m
WHERE 
    m.hospitalExclusive = 'S'  -- Only hospital-exclusive medicines
    AND (
        m.maxPrice < (0.5 * (SELECT avgMaxPrice FROM AvgPrice))  #-- Affordable condition
        OR 
        m.maxPrice > (2 * (SELECT avgMaxPrice FROM AvgPrice))    #-- Costly condition
    );
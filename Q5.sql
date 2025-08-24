SELECT 
    p.personName, 
    p.gender, 
    pt.dob,
    CASE 
        WHEN pt.dob >= '2005-01-01' AND p.gender = 'Male' THEN 'YoungMale'
        WHEN pt.dob >= '2005-01-01' AND p.gender = 'Female' THEN 'YoungFemale'
        WHEN pt.dob >= '1985-01-01' AND pt.dob < '2005-01-01' AND p.gender = 'Male' THEN 'AdultMale'
        WHEN pt.dob >= '1985-01-01' AND pt.dob < '2005-01-01' AND p.gender = 'Female' THEN 'AdultFemale'
        WHEN pt.dob >= '1970-01-01' AND pt.dob < '1985-01-01' AND p.gender = 'Male' THEN 'MidAgeMale'
        WHEN pt.dob >= '1970-01-01' AND pt.dob < '1985-01-01' AND p.gender = 'Female' THEN 'MidAgeFemale'
        WHEN pt.dob < '1970-01-01' AND p.gender = 'Male' THEN 'ElderMale'
        WHEN pt.dob < '1970-01-01' AND p.gender = 'Female' THEN 'ElderFemale'
    END AS PatientCategory
FROM Patient pt
JOIN Person p ON pt.patientID = p.personID;
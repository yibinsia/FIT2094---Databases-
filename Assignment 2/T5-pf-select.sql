/*****PLEASE ENTER YOUR DETAILS BELOW*****/
--T5-pf-select.sql

--Student ID: 33363129
--Student Name: Sia Yi Bin

/* Comments for your marker:




*/

/* (a) */
-- PLEASE PLACE REQUIRED SQL SELECT STATEMENT FOR THIS PART HERE
-- ENSURE that your query is formatted and has a semicolon
-- (;) at the end of this answer
SELECT
    clinic.clinic_id AS clinicid,
    vet.vet_id AS vetid,
    vet.vet_givenname || ' ' || vet.vet_familyname AS vetname,
    CASE
        WHEN clinic.vet_id = vet.vet_id THEN 'HEAD VET'
    END AS ishead,
    animal_type.atype_description AS animaltype,
    COUNT(*) AS numberappts,
    ROUND((COUNT(*) * 100.0) / SUM(COUNT(*)) OVER (PARTITION BY clinic.clinic_id), 1) || '%' AS percentappts
FROM
    visit
INNER JOIN
    vet ON visit.vet_id = vet.vet_id
INNER JOIN
    clinic ON visit.clinic_id = clinic.clinic_id
INNER JOIN
    animal ON visit.animal_id = animal.animal_id
INNER JOIN
    animal_type ON animal.atype_id = animal_type.atype_id
WHERE
    animal_type.atype_description IN ('Dog', 'Cat')
AND
    visit.visit_weight IS NOT NULL
GROUP BY
    clinic.clinic_id, vet.vet_id, vet.vet_givenname, vet.vet_familyname, clinic.vet_id, animal_type.atype_description
ORDER BY
    clinic.clinic_id, ishead DESC, vet.vet_id, animal_type.atype_description;


/* (b) */
-- PLEASE PLACE REQUIRED SQL SELECT STATEMENT FOR THIS PART HERE
-- ENSURE that your query is formatted and has a semicolon
-- (;) at the end of this answer
SELECT
    visit_service.service_code,
    service.service_desc,
    vet.vet_id,
    vet.vet_givenname,
    vet.vet_familyname,
    clinic.clinic_id,
    clinic.clinic_name,
    visit_service.visit_id,
    visit.visit_date_time AS visitdatetime,
    visit_service.visit_service_linecost
FROM
    visit_service
INNER JOIN
    visit ON visit_service.visit_id = visit.visit_id
INNER JOIN
    vet ON visit.vet_id = vet.vet_id
INNER JOIN
    clinic ON visit.clinic_id = clinic.clinic_id
INNER JOIN
    service ON visit_service.service_code = service.service_code
WHERE
    visit_service.visit_service_linecost > (
        SELECT
            AVG(inner_vs.visit_service_linecost)
        FROM
            visit_service inner_vs
        WHERE
            inner_vs.service_code = visit_service.service_code
    )
    AND visit.visit_weight IS NOT NULL
ORDER BY
    visit_service.service_code,
    vet.vet_id,
    visit.visit_date_time;


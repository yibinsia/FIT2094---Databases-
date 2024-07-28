/*****PLEASE ENTER YOUR DETAILS BELOW*****/
--T6-pf-json.sql

--Student ID: 33363129
--Student Name: Sia Yi Bin


/* Comments for your marker:




*/

-- PLEASE PLACE REQUIRED SQL SELECT STATEMENT TO GENERATE 
-- THE COLLECTION OF JSON DOCUMENTS HERE
-- ENSURE that your query is formatted and has a semicolon
-- (;) at the end of this answer
WITH HeadVet AS (
    SELECT 
        clinic.clinic_id,
        clinic.clinic_name AS name,
        clinic.clinic_address AS address,
        clinic.clinic_phone AS phone,
        JSON_OBJECT('id' VALUE clinic.vet_id, 'name' VALUE vet.vet_givenname || ' ' || vet.vet_familyname) AS head_vet
    FROM 
        clinic
    JOIN 
        vet ON clinic.vet_id = vet.vet_id
),
Vets AS (
    SELECT 
        clinic.clinic_id,
        COUNT(vet.vet_id) AS no_of_vets,
        JSON_ARRAYAGG(
            JSON_OBJECT(
                'id' VALUE vet.vet_id, 
                'name' VALUE vet.vet_givenname || ' ' || vet.vet_familyname, 
                'specialisation' VALUE COALESCE(specialisation.spec_description, 'N/A')
            )
        ) AS vets
    FROM 
        clinic
    JOIN 
        vet ON clinic.clinic_id = vet.clinic_id
    LEFT JOIN 
        specialisation ON vet.spec_id = specialisation.spec_id
    GROUP BY 
        clinic.clinic_id
)
SELECT 
    HeadVet.clinic_id AS id,
    HeadVet.name,
    HeadVet.address,
    HeadVet.phone,
    HeadVet.head_vet,
    Vets.no_of_vets,
    Vets.vets
FROM 
    HeadVet
JOIN 
    Vets ON HeadVet.clinic_id = Vets.clinic_id;




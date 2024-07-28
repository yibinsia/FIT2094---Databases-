/*****PLEASE ENTER YOUR DETAILS BELOW*****/
--T3-pf-dml.sql

--Student ID: 33363129
--Student Name: Sia Yi Bin

/* Comments for your marker:




*/

/*(a)*/
DROP SEQUENCE visit_seq;

CREATE SEQUENCE visit_seq START WITH 100 INCREMENT BY 10;

/*(b)*/
INSERT INTO visit (visit_id, visit_date_time, visit_length, visit_notes, visit_weight, visit_total_cost, animal_id, vet_id, clinic_id, from_visit_id) 
VALUES (
        visit_seq.NEXTVAL, 
        TO_DATE('2024-05-19 14:00', 'YYYY-MM-DD HH24:MI'), 
        30, 
        'General consultation for Oreo', 
        NULL, 
        (   SELECT 
                service_std_cost 
            FROM   
                service 
            WHERE 
                service_code = 'S001'
        ), 
        (   SELECT 
                animal_id 
            FROM 
                animal 
            WHERE 
                animal_name = 'Oreo' 
            AND 
                animal_born = TO_DATE('2018-06-01', 'YYYY-MM-DD')
        ), 
        (   SELECT 
                vet_id 
            FROM 
                vet 
            WHERE 
                vet_givenname = 'Anna' 
            AND 
                vet_familyname = 'Kowalski'
        ), 
        (   SELECT 
                clinic_id 
            FROM 
                clinic 
            WHERE 
                clinic_name = 'Bayside Veterinary Clinic'
        ), 
        NULL
    );

INSERT INTO visit_service (visit_id, service_code, visit_service_linecost) 
VALUES ((   SELECT 
                visit_id 
            FROM 
                visit 
            WHERE 
                animal_id = 
            (   SELECT 
                    animal_id 
                FROM 
                    animal 
                WHERE 
                    animal_name = 'Oreo' 
                AND 
                    animal_born = TO_DATE('2018-06-01', 'YYYY-MM-DD')) 
            AND 
                visit_date_time = TO_DATE('2024-05-19 14:00', 'YYYY-MM-DD HH24:MI')), 
        'S001', 
        (   SELECT 
                service_std_cost 
            FROM 
                service 
            WHERE 
                service_code = 'S001')
);

/*(c)*/
UPDATE visit_service 
SET 
    service_code = 'S010', 
    visit_service_linecost = 
        (  
            SELECT 
                service_std_cost 
            FROM 
                service 
            WHERE 
                service_code = 'S010'
        ) 
WHERE 
    visit_id = 
        (   SELECT 
                visit_id 
            FROM 
                visit 
            WHERE 
                animal_id = 
            (   SELECT 
                    animal_id 
                FROM 
                    animal 
                WHERE 
                    animal_name = 'Oreo' 
                AND 
                    animal_born = TO_DATE('2018-06-01', 'YYYY-MM-DD')
            ) 
            AND 
                visit_date_time = TO_DATE('2024-05-19 14:00', 'YYYY-MM-DD HH24:MI')
);

INSERT INTO visit_drug (visit_id, drug_id, visit_drug_dose, visit_drug_frequency, visit_drug_qtysupplied, visit_drug_linecost) 
VALUES ((   SELECT 
                visit_id 
            FROM 
                visit 
            WHERE 
                animal_id = 
                    (   SELECT 
                            animal_id 
                        FROM 
                            animal 
                        WHERE 
                            animal_name = 'Oreo' 
                        AND 
                            animal_born = TO_DATE('2018-06-01', 'YYYY-MM-DD')
                    ) 
            AND 
                visit_date_time = TO_DATE('2024-05-19 14:00', 'YYYY-MM-DD HH24:MI')
        ), 
        (   SELECT 
                drug_id 
            FROM 
                drug 
            WHERE 
                drug_name = 'Clotrimazole'
        ), 
        'As directed', 
        'Once', 
        1, 
        (   SELECT 
                drug_std_cost 
            FROM 
                drug 
            WHERE 
                drug_name = 'Clotrimazole')
);

INSERT INTO visit (visit_id, visit_date_time, visit_length, visit_notes, visit_weight, visit_total_cost, animal_id, vet_id, clinic_id, from_visit_id) 
VALUES (
        visit_seq.NEXTVAL, 
        TO_DATE('2024-05-26 14:00', 'YYYY-MM-DD HH24:MI'), 
        30, 
        'Follow-up for ear infection treatment', 
        NULL, 
        (   SELECT 
                service_std_cost 
            FROM 
                service 
            WHERE 
                service_code = 'S010'
        ), 
        (   SELECT 
                animal_id 
            FROM 
                animal 
            WHERE 
                animal_name = 'Oreo' 
            AND 
                animal_born = TO_DATE('2018-06-01', 'YYYY-MM-DD')
        ), 
        (   SELECT 
                vet_id 
            FROM 
                vet 
            WHERE 
                vet_givenname = 'Anna' 
            AND 
                vet_familyname = 'Kowalski'
        ), 
        (   SELECT 
                clinic_id 
            FROM 
                clinic 
            WHERE 
                clinic_name = 'Bayside Veterinary Clinic'
        ), 
        (   SELECT 
                visit_id 
            FROM 
                visit 
            WHERE 
                animal_id = 
                    (   SELECT 
                            animal_id 
                        FROM 
                            animal 
                        WHERE 
                            animal_name = 'Oreo' 
                        AND 
                            animal_born = TO_DATE('2018-06-01', 'YYYY-MM-DD')
                    ) 
            AND 
                visit_date_time = TO_DATE('2024-05-19 14:00', 'YYYY-MM-DD HH24:MI')
        )
);

INSERT INTO visit_service (visit_id, service_code, visit_service_linecost) 
VALUES ((
            SELECT 
                visit_id 
            FROM 
                visit 
            WHERE 
                animal_id = 
                    (   SELECT 
                            animal_id 
                        FROM 
                            animal 
                        WHERE 
                            animal_name = 'Oreo' 
                        AND 
                            animal_born = TO_DATE('2018-06-01', 'YYYY-MM-DD')
                    ) 
            AND 
                visit_date_time = TO_DATE('2024-05-26 14:00', 'YYYY-MM-DD HH24:MI')
        ), 
        'S010', 
        (   SELECT 
                service_std_cost 
            FROM 
                service 
            WHERE 
                service_code = 'S010')
);


/*(d)*/
DELETE FROM visit_service
WHERE visit_id = 
    (   SELECT 
            visit_id 
        FROM 
            visit 
        WHERE animal_id = 
                (   SELECT 
                        animal_id 
                    FROM 
                        animal 
                    WHERE 
                        animal_name = 'Oreo' 
                    AND 
                        animal_born = TO_DATE('2018-06-01', 'YYYY-MM-DD')
                ) 
        AND visit_date_time = TO_DATE('2024-05-26 14:00', 'YYYY-MM-DD HH24:MI')
);

DELETE FROM visit
WHERE visit_id = 
    (   SELECT 
            visit_id 
        FROM 
            visit 
        WHERE 
            animal_id = 
                (   SELECT 
                        animal_id 
                    FROM 
                        animal 
                    WHERE 
                        animal_name = 'Oreo' 
                    AND animal_born = TO_DATE('2018-06-01', 'YYYY-MM-DD')
                ) 
        AND visit_date_time = TO_DATE('2024-05-26 14:00', 'YYYY-MM-DD HH24:MI')
);

COMMIT;





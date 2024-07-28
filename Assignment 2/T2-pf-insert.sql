/*****PLEASE ENTER YOUR DETAILS BELOW*****/
--T2-pf-insert.sql

--Student ID: 33363129
--Student Name: Sia Yi Bin 

/* Comments for your marker:
My visit_total_cost is count by adding the amount of visit_service_linecost 
and the amount of visit_drug_linecost with same visit_id.
The visit_service.visit_id '1' with service_code 'S002' is overcharged.
The visit_service.visit_id '4' with service_code 'S006' is overcharged.
The visit_service.visit_id '9' with service_code 'S002' is lowercharged.
Above is for task 4 testing.
*/

--------------------------------------
--INSERT INTO visit
--------------------------------------
INSERT INTO visit (visit_id, visit_date_time, visit_length, visit_notes, visit_weight, visit_total_cost, animal_id, vet_id, clinic_id, from_visit_id) VALUES (1, TO_DATE('2024-04-02 10:00', 'YYYY-MM-DD HH24:MI'), 60, 'Annual Health Checkup', 5.0, 164.00, 1, 1001, 1, NULL);
INSERT INTO visit (visit_id, visit_date_time, visit_length, visit_notes, visit_weight, visit_total_cost, animal_id, vet_id, clinic_id, from_visit_id) VALUES (2, TO_DATE('2024-04-03 11:00', 'YYYY-MM-DD HH24:MI'), 45, 'Vaccination - Routine', 6.0, 149.99, 2, 1005, 2, NULL);
INSERT INTO visit (visit_id, visit_date_time, visit_length, visit_notes, visit_weight, visit_total_cost, animal_id, vet_id, clinic_id, from_visit_id) VALUES (3, TO_DATE('2024-04-05 09:30', 'YYYY-MM-DD HH24:MI'), 90, 'Skin Allergy Treatment', 4.5, 158.5, 3, 1002, 4, NULL);
INSERT INTO visit (visit_id, visit_date_time, visit_length, visit_notes, visit_weight, visit_total_cost, animal_id, vet_id, clinic_id, from_visit_id) VALUES (4, TO_DATE('2024-04-10 14:00', 'YYYY-MM-DD HH24:MI'), 75, 'Dental Cleaning', 6.2, 170.00, 4, 1004, 3, NULL);
INSERT INTO visit (visit_id, visit_date_time, visit_length, visit_notes, visit_weight, visit_total_cost, animal_id, vet_id, clinic_id, from_visit_id) VALUES (5, TO_DATE('2024-04-12 15:00', 'YYYY-MM-DD HH24:MI'), 60, 'General Consultation', 5.5, 90.00, 5, 1001, 1, NULL);
INSERT INTO visit (visit_id, visit_date_time, visit_length, visit_notes, visit_weight, visit_total_cost, animal_id, vet_id, clinic_id, from_visit_id) VALUES (6, TO_DATE('2024-05-01 10:00', 'YYYY-MM-DD HH24:MI'), 45, 'Follow-up on Skin Allergy Treatment', 4.6, 94.00, 3, 1002, 4, 3);
INSERT INTO visit (visit_id, visit_date_time, visit_length, visit_notes, visit_weight, visit_total_cost, animal_id, vet_id, clinic_id, from_visit_id) VALUES (7, TO_DATE('2024-05-03 12:00', 'YYYY-MM-DD HH24:MI'), 30, 'Vaccination - Routine', 5.2, 145.99, 1, 1005, 2, NULL);
INSERT INTO visit (visit_id, visit_date_time, visit_length, visit_notes, visit_weight, visit_total_cost, animal_id, vet_id, clinic_id, from_visit_id) VALUES (8, TO_DATE('2024-05-05 11:30', 'YYYY-MM-DD HH24:MI'), 60, 'Emergency Care', 5.7, 200.00, 2, 1003, 2, NULL);
INSERT INTO visit (visit_id, visit_date_time, visit_length, visit_notes, visit_weight, visit_total_cost, animal_id, vet_id, clinic_id, from_visit_id) VALUES (9, TO_DATE('2024-05-08 13:00', 'YYYY-MM-DD HH24:MI'), 60, 'General Consultation', 6.0, 116.80, 4, 1001, 1, NULL);
INSERT INTO visit (visit_id, visit_date_time, visit_length, visit_notes, visit_weight, visit_total_cost, animal_id, vet_id, clinic_id, from_visit_id) VALUES (10, TO_DATE('2024-06-01 14:30', 'YYYY-MM-DD HH24:MI'), 60, 'Behavioral Training Session', 5.4, 170.00, 5, 1007, 5, NULL);
INSERT INTO visit (visit_id, visit_date_time, visit_length, visit_notes, visit_weight, visit_total_cost, animal_id, vet_id, clinic_id, from_visit_id) VALUES (11, TO_DATE('2024-06-05 16:00', 'YYYY-MM-DD HH24:MI'), 30, 'Follow-up on Dental Cleaning', 6.3, 80.00, 4, 1004, 3, 4);
INSERT INTO visit (visit_id, visit_date_time, visit_length, visit_notes, visit_weight, visit_total_cost, animal_id, vet_id, clinic_id, from_visit_id) VALUES (12, TO_DATE('2024-06-15 10:00', 'YYYY-MM-DD HH24:MI'), 60, 'Future booking for Annual Health Checkup', NULL, NULL, 2, 1002, 4, NULL);
INSERT INTO visit (visit_id, visit_date_time, visit_length, visit_notes, visit_weight, visit_total_cost, animal_id, vet_id, clinic_id, from_visit_id) VALUES (13, TO_DATE('2024-06-20 11:00', 'YYYY-MM-DD HH24:MI'), 45, 'Future booking for Vaccination - Routine', NULL, NULL, 3, 1005, 2, NULL);

--------------------------------------
--INSERT INTO visit_service
--------------------------------------
INSERT INTO visit_service (visit_id, service_code, visit_service_linecost) VALUES (1, 'S011', 90.00);
INSERT INTO visit_service (visit_id, service_code, visit_service_linecost) VALUES (2, 'S002', 50.00);
INSERT INTO visit_service (visit_id, service_code, visit_service_linecost) VALUES (3, 'S009', 85.00);
INSERT INTO visit_service (visit_id, service_code, visit_service_linecost) VALUES (4, 'S006', 100.00);
INSERT INTO visit_service (visit_id, service_code, visit_service_linecost) VALUES (5, 'S001', 60.00);
INSERT INTO visit_service (visit_id, service_code, visit_service_linecost) VALUES (6, 'S009', 85.00);
INSERT INTO visit_service (visit_id, service_code, visit_service_linecost) VALUES (7, 'S002', 45.00);
INSERT INTO visit_service (visit_id, service_code, visit_service_linecost) VALUES (8, 'S004', 150.00);
INSERT INTO visit_service (visit_id, service_code, visit_service_linecost) VALUES (9, 'S001', 60.00);
INSERT INTO visit_service (visit_id, service_code, visit_service_linecost) VALUES (10, 'S020', 90.00);
INSERT INTO visit_service (visit_id, service_code, visit_service_linecost) VALUES (11, 'S006', 80.00);
INSERT INTO visit_service (visit_id, service_code, visit_service_linecost) VALUES (1, 'S001', 60.00);
INSERT INTO visit_service (visit_id, service_code, visit_service_linecost) VALUES (3, 'S001', 60.00);
INSERT INTO visit_service (visit_id, service_code, visit_service_linecost) VALUES (4, 'S001', 60.00);
INSERT INTO visit_service (visit_id, service_code, visit_service_linecost) VALUES (9, 'S002', 40.00); 

--------------------------------------
--INSERT INTO visit_drug
--------------------------------------
INSERT INTO visit_drug (visit_id, drug_id, visit_drug_dose, visit_drug_frequency, visit_drug_qtysupplied, visit_drug_linecost) VALUES (1, 119, 'per dietary needs', 'daily', 14, 14);
INSERT INTO visit_drug (visit_id, drug_id, visit_drug_dose, visit_drug_frequency, visit_drug_qtysupplied, visit_drug_linecost) VALUES (2, 102, 'standard dose', 'once', 1, 99.99);
INSERT INTO visit_drug (visit_id, drug_id, visit_drug_dose, visit_drug_frequency, visit_drug_qtysupplied, visit_drug_linecost) VALUES (3, 109, 'as prescribed', 'daily', 3, 13.50);
INSERT INTO visit_drug (visit_id, drug_id, visit_drug_dose, visit_drug_frequency, visit_drug_qtysupplied, visit_drug_linecost) VALUES (4, 106, 'use as directed', 'daily', 1, 10.00);
INSERT INTO visit_drug (visit_id, drug_id, visit_drug_dose, visit_drug_frequency, visit_drug_qtysupplied, visit_drug_linecost) VALUES (5, 110, 'as directed', 'daily', 1, 30.00);
INSERT INTO visit_drug (visit_id, drug_id, visit_drug_dose, visit_drug_frequency, visit_drug_qtysupplied, visit_drug_linecost) VALUES (6, 109, 'as prescribed', 'daily', 2, 9.00);
INSERT INTO visit_drug (visit_id, drug_id, visit_drug_dose, visit_drug_frequency, visit_drug_qtysupplied, visit_drug_linecost) VALUES (7, 102, 'standard dose', 'once', 1, 99.99);
INSERT INTO visit_drug (visit_id, drug_id, visit_drug_dose, visit_drug_frequency, visit_drug_qtysupplied, visit_drug_linecost) VALUES (8, 105, 'depends on weight', 'once', 1, 50.00);
INSERT INTO visit_drug (visit_id, drug_id, visit_drug_dose, visit_drug_frequency, visit_drug_qtysupplied, visit_drug_linecost) VALUES (9, 111, 'one tablet', 'daily', 14, 16.8);
INSERT INTO visit_drug (visit_id, drug_id, visit_drug_dose, visit_drug_frequency, visit_drug_qtysupplied, visit_drug_linecost) VALUES (10, 120, 'as instructed', 'once', 1, 80.00);
INSERT INTO visit_drug (visit_id, drug_id, visit_drug_dose, visit_drug_frequency, visit_drug_qtysupplied, visit_drug_linecost) VALUES (3, 108, 'once monthly', 'monthly', 1, 45.00);
INSERT INTO visit_drug (visit_id, drug_id, visit_drug_dose, visit_drug_frequency, visit_drug_qtysupplied, visit_drug_linecost) VALUES (6, 107, '0.1 mg per kg', 'monthly', 1, 16.00);



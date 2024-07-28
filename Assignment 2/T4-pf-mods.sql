/*****PLEASE ENTER YOUR DETAILS BELOW*****/
--T4-pf-mods.sql

--Student ID: 33363129
--Student Name: Sia Yi Bin


/* Comments for your marker:
For task 4b, i first create 2 columns in visit table, payment_made and payment_method.
Then, i update the payment_method column with random value of 'Card' or 'Cash' for 
each visit that has visit_total_cost.
Then, i update the payment_made column with -40 for visit_id 11 for test case.
Then, i create a new table visit_payment with payment_id, payment_date, payment_made, 
payment_method, visit_id, to record the payment details for each visit,
and update the payment_method if the payment_made is equal to visit_total_cost,
means they have fully paid.


*/

/*(a)*/
DROP TABLE service_non_std_count CASCADE CONSTRAINTS PURGE;

CREATE TABLE service_non_std_count (
    service_code       CHAR(5) NOT NULL,
    non_std_count      NUMBER DEFAULT 0
);

COMMENT ON COLUMN service_non_std_count.service_code IS
    'Service code identifier';

COMMENT ON COLUMN service_non_std_count.non_std_count IS
    'Number of times the service was not charged at the standard cost';

ALTER TABLE service_non_std_count ADD CONSTRAINT service_non_std_count_pk PRIMARY KEY (service_code);

ALTER TABLE service_non_std_count 
    ADD CONSTRAINT service_non_std_count_fk FOREIGN KEY (service_code) 
        REFERENCES service (service_code);

INSERT INTO service_non_std_count (service_code, non_std_count)
SELECT 
    vs.service_code,
    NVL(ns.non_std_count, 0) AS non_std_count
FROM
    (SELECT DISTINCT service_code FROM visit_service) vs
LEFT JOIN
    (SELECT
        visit_service.service_code,
        COUNT(*) AS non_std_count
    FROM
        visit_service
    INNER JOIN
        service ON visit_service.service_code = service.service_code
    WHERE
        visit_service.visit_service_linecost <> service.service_std_cost
    GROUP BY
        visit_service.service_code) ns
ON vs.service_code = ns.service_code
ORDER BY 
    non_std_count DESC,
    vs.service_code ASC;

SELECT * FROM service_non_std_count;

DESC service_non_std_count;

COMMIT;



/*(b)*/
ALTER TABLE visit ADD (
    payment_made NUMBER(10, 2) DEFAULT 0,
    payment_method VARCHAR2(20)
);

UPDATE visit
SET payment_method = CASE
    WHEN DBMS_RANDOM.VALUE(0, 1) < 0.5 THEN 'Card'
    ELSE 'Cash'
END
WHERE visit_total_cost IS NOT NULL;

UPDATE visit
SET 
    payment_made = payment_made - 40
WHERE visit_id = 11;

DROP TABLE visit_payment CASCADE CONSTRAINTS PURGE;

CREATE TABLE visit_payment (
    payment_id         NUMBER(10) NOT NULL,
    payment_date       DATE,
    payment_made       NUMBER(10, 2),
    payment_method     VARCHAR2(20),
    visit_id           NUMBER(5) NOT NULL
);

COMMENT ON COLUMN visit_payment.payment_id IS
    'Identifier for payment';

COMMENT ON COLUMN visit_payment.visit_id IS
    'Identifier for visit';

COMMENT ON COLUMN visit_payment.payment_date IS
    'Date of the payment';

COMMENT ON COLUMN visit_payment.payment_made IS
    'Amount of the payment made so far';

COMMENT ON COLUMN visit_payment.payment_method IS
    'Method of the payment (Card, Cash, Historical)';

ALTER TABLE visit_payment ADD CONSTRAINT visit_payment_pk PRIMARY KEY (payment_id);

ALTER TABLE visit_payment
    ADD CONSTRAINT visit_visitpayment_fk FOREIGN KEY (visit_id)
        REFERENCES visit (visit_id);

INSERT INTO visit_payment (payment_id, visit_id, payment_date, payment_made, payment_method)
SELECT 
    ROW_NUMBER() OVER (ORDER BY visit.visit_date_time), 
    visit.visit_id, 
    visit.visit_date_time, 
    visit.payment_made, 
    CASE 
        WHEN visit.payment_made = visit.visit_total_cost THEN 'Historical'
        ELSE visit.payment_method
    END
FROM visit 
WHERE visit_total_cost IS NOT NULL;

SELECT * FROM visit_payment ORDER BY payment_date;

DESC visit_payment;

DESC visit;

COMMIT;

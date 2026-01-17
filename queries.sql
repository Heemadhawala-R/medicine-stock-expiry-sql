INSERT INTO medicine_info VALUES (1, 'Paracetamol', 'Pain Relief');
INSERT INTO medicine_info VALUES (2, 'Amoxicillin', 'Antibiotic');
INSERT INTO medicine_info VALUES (3, 'Insulin', 'Diabetes');
INSERT INTO medicine_info VALUES (4, 'ORS', 'Hydration');
INSERT INTO medicine_info VALUES (5, 'Cetirizine', 'Allergy');
INSERT INTO medicine_info VALUES (6, 'Azithromycin', 'Antibiotic');
INSERT INTO medicine_info VALUES (7, 'Metformin', 'Diabetes');
INSERT INTO medicine_info VALUES (8, 'Vitamin C', 'Supplement');

INSERT INTO clinic_info VALUES (101, 'City Health Clinic', 'Bangalore');
INSERT INTO clinic_info VALUES (102, 'Hope NGO Clinic', 'Chennai');
INSERT INTO clinic_info VALUES (103, 'Mysore City Clinic', 'Mysore');
INSERT INTO clinic_info VALUES (104, 'Artha Riveria Clinic', 'Mangalore');

INSERT INTO stock_info VALUES (101, 1, 50, DATE '2026-02-10');
INSERT INTO stock_info VALUES (101, 2, 10, DATE '2026-01-25');
INSERT INTO stock_info VALUES (102, 3, 5,  DATE '2026-01-18');
INSERT INTO stock_info VALUES (102, 4, 0,  DATE '2026-03-05');
INSERT INTO stock_info VALUES (103, 1, 30, DATE '2026-02-10');
INSERT INTO stock_info VALUES (103, 2, 50, DATE '2026-01-25');
INSERT INTO stock_info VALUES (104, 3, 2,  DATE '2026-01-18');
INSERT INTO stock_info VALUES (104, 4, 1,  DATE '2026-03-05');

COMMIT;
SELECT * FROM medicine_info;
SELECT * FROM clinic_info;
SELECT * FROM stock_info;
SELECT m.medicine_name, c.clinic_name
FROM medicine_info m
JOIN stock_info s ON m.medicine_id = s.medicine_id
JOIN clinic_info c ON c.clinic_id = s.clinic_id
WHERE s.quantity = 0;

SELECT m.medicine_name, s.expiry_date, c.clinic_name
FROM medicine_info m
JOIN stock_info s ON m.medicine_id = s.medicine_id
JOIN clinic_info c ON c.clinic_id = s.clinic_id
WHERE s.expiry_date <= DATE '2026-01-25';
SELECT m.medicine_name, s.quantity, c.clinic_name
FROM medicine_info m
JOIN stock_info s ON m.medicine_id = s.medicine_id
JOIN clinic_info c ON c.clinic_id = s.clinic_id
WHERE s.quantity < 5;
SELECT m.medicine_name,
       SUM(s.quantity) AS total_quantity
FROM medicine_info m
JOIN stock_info s ON m.medicine_id = s.medicine_id
GROUP BY m.medicine_name;

SELECT c.clinic_name,
       SUM(s.quantity) AS total_medicines
FROM clinic_info c
JOIN stock_info s ON c.clinic_id = s.clinic_id
GROUP BY c.clinic_name;
-- Clinics having medicines expiring soon
SELECT DISTINCT c.clinic_name
FROM clinic_info c
JOIN stock_info s ON c.clinic_id = s.clinic_id
WHERE s.expiry_date < DATE '2026-02-01';
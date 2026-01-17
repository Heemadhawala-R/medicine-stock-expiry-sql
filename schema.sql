CREATE TABLE medicine_info (
    medicine_id NUMBER PRIMARY KEY,
    medicine_name VARCHAR2(50),
    medicine_type VARCHAR2(50)
);
CREATE TABLE clinic_info (
    clinic_id NUMBER PRIMARY KEY,
    clinic_name VARCHAR2(50),
    location VARCHAR2(50)
);
CREATE TABLE stock_info (
    clinic_id NUMBER,
    medicine_id NUMBER,
    quantity NUMBER,
    expiry_date DATE
);
SET SERVEROUTPUT ON;
-- Drop and recreate USER_TABLE
BEGIN
    EXECUTE IMMEDIATE 'DROP TABLE user_table CASCADE CONSTRAINTS';
EXCEPTION
    WHEN OTHERS THEN
        DBMS_OUTPUT.PUT_LINE('USER_TABLE does not exist. Skipping drop...');
END;
/
CREATE TABLE user_table (
    user_id_pk INTEGER PRIMARY KEY,
    username VARCHAR2(55),
    password VARCHAR2(55),
    email_uniq VARCHAR2(100) UNIQUE,
    user_category VARCHAR2(55),
    created_at DATE,
    discount_id_fk INTEGER,
    CONSTRAINT discount_id_fk FOREIGN KEY (discount_id_fk) REFERENCES discounts(discount_id_pk)
);
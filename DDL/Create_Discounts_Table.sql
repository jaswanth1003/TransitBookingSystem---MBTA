SET SERVEROUTPUT ON;

-- Drop and recreate DISCOUNTS table
BEGIN
    EXECUTE IMMEDIATE 'DROP TABLE discounts CASCADE CONSTRAINTS';
EXCEPTION
    WHEN OTHERS THEN
        DBMS_OUTPUT.PUT_LINE('DISCOUNTS table does not exist. Skipping drop...');
END;
/
CREATE TABLE discounts (
    discount_id_pk INTEGER PRIMARY KEY,
    discount_type VARCHAR2(50),
    discount_rate NUMBER(5,2)
);






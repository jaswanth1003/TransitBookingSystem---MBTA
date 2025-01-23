SET SERVEROUTPUT ON;

-- Drop and recreate TICKET
BEGIN
    EXECUTE IMMEDIATE 'DROP TABLE ticket CASCADE CONSTRAINTS';
EXCEPTION
    WHEN OTHERS THEN
        DBMS_OUTPUT.PUT_LINE('TICKET table does not exist. Skipping drop...');
END;
/
CREATE TABLE ticket (
    ticket_id_pk INTEGER PRIMARY KEY,
    user_id_fk INTEGER,
    purchase_date DATE,
    purchase_time TIMESTAMP,
    price NUMBER(10,2),
    transit_line VARCHAR2(50),
    ticket_status VARCHAR2(55),
    CONSTRAINT fk_user_id_ticket FOREIGN KEY (user_id_fk) REFERENCES user_table(user_id_pk)
);

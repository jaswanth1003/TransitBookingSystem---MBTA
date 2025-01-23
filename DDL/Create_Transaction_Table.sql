SET SERVEROUTPUT ON;
-- Create TRANSACTION_TABLE if it does not already exist
-- Drop and recreate TRANSACTION_TABLE
BEGIN
    EXECUTE IMMEDIATE 'DROP TABLE transaction_table CASCADE CONSTRAINTS';
EXCEPTION
    WHEN OTHERS THEN
        DBMS_OUTPUT.PUT_LINE('TRANSACTION_TABLE does not exist. Skipping drop...');
END;
/
CREATE TABLE transaction_table (
    transaction_id_pk INTEGER PRIMARY KEY,
    ticket_id_fk INTEGER,
    transaction_status VARCHAR2(50),
    amount NUMBER(10,2),
    transaction_date DATE,
    refund_status VARCHAR2(50),
    refund_request VARCHAR2(50),
    user_id_fk INTEGER,
    CONSTRAINT fk_ticket_id FOREIGN KEY (ticket_id_fk) REFERENCES ticket(ticket_id_pk),
    CONSTRAINT fk_user_id FOREIGN KEY (user_id_fk) REFERENCES user_table(user_id_pk)
);
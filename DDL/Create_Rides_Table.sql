SET SERVEROUTPUT ON;

-- Create RIDES table if it does not already exist
-- Drop and recreate RIDES
BEGIN
    EXECUTE IMMEDIATE 'DROP TABLE rides CASCADE CONSTRAINTS';
EXCEPTION
    WHEN OTHERS THEN
        DBMS_OUTPUT.PUT_LINE('RIDES table does not exist. Skipping drop...');
END;
/
CREATE TABLE rides (
    ride_id INTEGER PRIMARY KEY,
    user_id_fk INTEGER,
    ride_timestamp TIMESTAMP,
    ticket_id_fk INTEGER,
    total_spend NUMBER(10,2),
    CONSTRAINT fk_user_id_rides FOREIGN KEY (user_id_fk) REFERENCES user_table(user_id_pk),
    CONSTRAINT fk_ticket_id_rides FOREIGN KEY (ticket_id_fk) REFERENCES ticket(ticket_id_pk)
);









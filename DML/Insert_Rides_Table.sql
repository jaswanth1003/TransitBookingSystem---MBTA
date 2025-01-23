SET SERVEROUTPUT ON ;
-- Delete data from rides table and reinsert.
BEGIN
    EXECUTE IMMEDIATE 'DELETE FROM rds';
    DBMS_OUTPUT.PUT_LINE('All data deleted from rides table successfully.');
EXCEPTION
    WHEN OTHERS THEN
        DBMS_OUTPUT.PUT_LINE('Error occurred while deleting data from rides table.');
END;
/

BEGIN
    INSERT INTO rds (ride_id, user_id_fk, ride_timestamp, ticket_id_fk, total_spend)
    VALUES (rides_seq_pk.NEXTVAL, 1, SYSTIMESTAMP, 1, 2.40);

    INSERT INTO rds (ride_id, user_id_fk, ride_timestamp, ticket_id_fk, total_spend)
    VALUES (rides_seq_pk.NEXTVAL, 2, SYSTIMESTAMP, 2, 2.40);

    INSERT INTO rds (ride_id, user_id_fk, ride_timestamp, ticket_id_fk, total_spend)
    VALUES (rides_seq_pk.NEXTVAL, 3, SYSTIMESTAMP, 3, 2.40);

    INSERT INTO rds (ride_id, user_id_fk, ride_timestamp, ticket_id_fk, total_spend)
    VALUES (rides_seq_pk.NEXTVAL, 4, SYSTIMESTAMP, 4, 2.40);

    INSERT INTO rds (ride_id, user_id_fk, ride_timestamp, ticket_id_fk, total_spend)
    VALUES (rides_seq_pk.NEXTVAL, 5, SYSTIMESTAMP, 5, 2.40);

    DBMS_OUTPUT.PUT_LINE('Data inserted into rides table successfully.');
EXCEPTION
    WHEN OTHERS THEN
        DBMS_OUTPUT.PUT_LINE('Error occurred while inserting data into rides table.');
END;
/
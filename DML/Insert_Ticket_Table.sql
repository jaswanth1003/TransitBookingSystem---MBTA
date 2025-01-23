SET SERVEROUTPUT ON;

-- Delete data from ticket table and reinsert
BEGIN
    EXECUTE IMMEDIATE 'DELETE FROM tkt';
    DBMS_OUTPUT.PUT_LINE('All data deleted from ticket table successfully.');
EXCEPTION
    WHEN OTHERS THEN
        DBMS_OUTPUT.PUT_LINE('Error occurred while deleting data from ticket table.');
END;
/

BEGIN
    INSERT INTO tkt (ticket_id_pk, user_id_fk, purchase_date, purchase_time, price, transit_line, ticket_status)
    VALUES (ticket_seq_pk.NEXTVAL, 1, SYSDATE, SYSTIMESTAMP, 2.40, 'Green Line', 'Valid');

    INSERT INTO tkt (ticket_id_pk, user_id_fk, purchase_date, purchase_time, price, transit_line, ticket_status)
    VALUES (ticket_seq_pk.NEXTVAL, 2, SYSDATE, SYSTIMESTAMP, 2.40, 'Blue Line', 'Valid');

    INSERT INTO tkt (ticket_id_pk, user_id_fk, purchase_date, purchase_time, price, transit_line, ticket_status)
    VALUES (ticket_seq_pk.NEXTVAL, 3, SYSDATE, SYSTIMESTAMP, 2.40, 'Orange Line', 'Valid');

    INSERT INTO tkt (ticket_id_pk, user_id_fk, purchase_date, purchase_time, price, transit_line, ticket_status)
    VALUES (ticket_seq_pk.NEXTVAL, 4, SYSDATE, SYSTIMESTAMP, 2.40, 'Red Line', 'Valid');

    INSERT INTO tkt (ticket_id_pk, user_id_fk, purchase_date, purchase_time, price, transit_line, ticket_status)
    VALUES (ticket_seq_pk.NEXTVAL, 5, SYSDATE, SYSTIMESTAMP, 2.40, 'Green Line', 'Valid');

    DBMS_OUTPUT.PUT_LINE('Data inserted into ticket table successfully.');
EXCEPTION
    WHEN OTHERS THEN
        DBMS_OUTPUT.PUT_LINE('Error occurred while inserting data into ticket table.');
END;
/
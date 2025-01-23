SET SERVEROUTPUT ON ;
-- Delete data from transaction table and reinsert.
BEGIN
    EXECUTE IMMEDIATE 'DELETE FROM txn_tbl';
    DBMS_OUTPUT.PUT_LINE('All data deleted from transaction table successfully.');
EXCEPTION
    WHEN OTHERS THEN
        DBMS_OUTPUT.PUT_LINE('Error occurred while deleting data from transaction table.');
END;
/

BEGIN
    INSERT INTO txn_tbl (transaction_id_pk, ticket_id_fk, transaction_status, amount, transaction_date, refund_status, refund_request, user_id_fk)
    VALUES (transaction_seq_pk.NEXTVAL, 1, 'Completed', 2.40, SYSTIMESTAMP, 'Not Refunded', 'Not Requested', 1);

    INSERT INTO txn_tbl (transaction_id_pk, ticket_id_fk, transaction_status, amount, transaction_date, refund_status, refund_request, user_id_fk)
    VALUES (transaction_seq_pk.NEXTVAL, 2, 'Completed', 2.40, SYSTIMESTAMP, 'Not Refunded', 'Not Requested', 2);

    INSERT INTO txn_tbl (transaction_id_pk, ticket_id_fk, transaction_status, amount, transaction_date, refund_status, refund_request, user_id_fk)
    VALUES (transaction_seq_pk.NEXTVAL, 3, 'Completed', 2.40, SYSTIMESTAMP, 'Not Refunded', 'Not Requested', 3);

    INSERT INTO txn_tbl (transaction_id_pk, ticket_id_fk, transaction_status, amount, transaction_date, refund_status, refund_request, user_id_fk)
    VALUES (transaction_seq_pk.NEXTVAL, 4, 'Completed', 2.40, SYSTIMESTAMP, 'Not Refunded', 'Not Requested', 4);

    INSERT INTO txn_tbl (transaction_id_pk, ticket_id_fk, transaction_status, amount, transaction_date, refund_status, refund_request, user_id_fk)
    VALUES (transaction_seq_pk.NEXTVAL, 5, 'Completed', 2.40, SYSTIMESTAMP, 'Not Refunded', 'Not Requested', 5);

    DBMS_OUTPUT.PUT_LINE('Data inserted into transaction table successfully.');
EXCEPTION
    WHEN OTHERS THEN
        DBMS_OUTPUT.PUT_LINE('Error occurred while inserting data into transaction table.');
END;
/
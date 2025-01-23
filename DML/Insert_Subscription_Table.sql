SET SERVEROUTPUT ON;

-- Delete data from subscription table and reinsert
BEGIN
    EXECUTE IMMEDIATE 'DELETE FROM subs';
    DBMS_OUTPUT.PUT_LINE('All data deleted from subscription table successfully.');
EXCEPTION
    WHEN OTHERS THEN
        DBMS_OUTPUT.PUT_LINE('Error occurred while deleting data from subscription table.');
END;
/

BEGIN
    -- Insert Monthly subscription
    INSERT INTO subs (subscription_id_pk, user_id_fk, subscription_type, start_date, end_date, subscription_status)
    VALUES (subscription_seq_pk.NEXTVAL, 1, 'Monthly', SYSDATE, ADD_MONTHS(SYSDATE, 1), 'Active');

    -- Insert Yearly subscription
    INSERT INTO subs (subscription_id_pk, user_id_fk, subscription_type, start_date, end_date, subscription_status)
    VALUES (subscription_seq_pk.NEXTVAL, 2, 'Yearly', SYSDATE, ADD_MONTHS(SYSDATE, 12), 'Active');

    -- Insert None (No subscription)
    INSERT INTO subs (subscription_id_pk, user_id_fk, subscription_type, start_date, end_date, subscription_status)
    VALUES (subscription_seq_pk.NEXTVAL, 3, 'None', NULL, NULL, 'Inactive');

    -- Insert Monthly subscription
    INSERT INTO subs (subscription_id_pk, user_id_fk, subscription_type, start_date, end_date, subscription_status)
    VALUES (subscription_seq_pk.NEXTVAL, 4, 'Monthly', SYSDATE, ADD_MONTHS(SYSDATE, 1), 'Active');

    -- Insert None (No subscription)
    INSERT INTO subs (subscription_id_pk, user_id_fk, subscription_type, start_date, end_date, subscription_status)
    VALUES (subscription_seq_pk.NEXTVAL, 5, 'None', NULL, NULL, 'Inactive');

    DBMS_OUTPUT.PUT_LINE('Data inserted into subscription table successfully.');
EXCEPTION
    WHEN OTHERS THEN
        DBMS_OUTPUT.PUT_LINE('Error occurred while inserting data into subscription table.');
END;
/

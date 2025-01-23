SET SERVEROUTPUT ON;

-- Delete data from all tables
BEGIN
    EXECUTE IMMEDIATE 'DELETE FROM txn_tbl';
    EXECUTE IMMEDIATE 'DELETE FROM rds';
    EXECUTE IMMEDIATE 'DELETE FROM subs';
    EXECUTE IMMEDIATE 'DELETE FROM grp_bkg';
    EXECUTE IMMEDIATE 'DELETE FROM tkt';
    EXECUTE IMMEDIATE 'DELETE FROM usr_tbl';
    DBMS_OUTPUT.PUT_LINE('All data deleted from tables successfully.');
END;
/


-- Step 1: Delete data from the discounts table
BEGIN
    EXECUTE IMMEDIATE 'DELETE FROM disc';
    DBMS_OUTPUT.PUT_LINE('All data deleted from discounts table successfully.');
EXCEPTION
    WHEN OTHERS THEN
        DBMS_OUTPUT.PUT_LINE('Error occurred while deleting data from discounts table.');
END;
/

-- Step 2: Insert data into the discounts table
BEGIN
    INSERT INTO disc (discount_id_pk, discount_type, discount_rate) VALUES (0, 'Regular', 0);
    INSERT INTO disc (discount_id_pk, discount_type, discount_rate) VALUES (1, 'Student', 5.00);
    INSERT INTO disc (discount_id_pk, discount_type, discount_rate) VALUES (2, 'Senior', 10.00);
    INSERT INTO disc (discount_id_pk, discount_type, discount_rate) VALUES (3, 'Group Booking', 5.00);
    DBMS_OUTPUT.PUT_LINE('Data inserted into discounts table successfully.');
EXCEPTION
    WHEN OTHERS THEN
        DBMS_OUTPUT.PUT_LINE('Error occurred while inserting data into discounts table.');
END;
/


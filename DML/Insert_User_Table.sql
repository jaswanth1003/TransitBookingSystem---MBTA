-- Delete data from user_table and reinsert
BEGIN
    EXECUTE IMMEDIATE 'DELETE FROM usr_tbl';
    DBMS_OUTPUT.PUT_LINE('All data deleted from user_table successfully.');
EXCEPTION
    WHEN OTHERS THEN
        DBMS_OUTPUT.PUT_LINE('Error occurred while deleting data from user_table.');
END;
/

BEGIN
    INSERT INTO usr_tbl (user_id_pk, username, password, email_uniq, user_category, created_at, discount_id_fk)
    VALUES (user_seq_pk.NEXTVAL, 'john_doe', 'password123', 'john.doe@example.com', 'Regular', SYSDATE, 0);

    INSERT INTO usr_tbl (user_id_pk, username, password, email_uniq, user_category, created_at, discount_id_fk)
    VALUES (user_seq_pk.NEXTVAL, 'jane_smith', 'securepass', 'jane.smith@example.com', 'Student', SYSDATE, 1);

    INSERT INTO usr_tbl (user_id_pk, username, password, email_uniq, user_category, created_at, discount_id_fk)
    VALUES (user_seq_pk.NEXTVAL, 'grandpa_joe', 'mypassword', 'grandpa.joe@example.com', 'Senior', SYSDATE, 2);

    INSERT INTO usr_tbl (user_id_pk, username, password, email_uniq, user_category, created_at, discount_id_fk)
    VALUES (user_seq_pk.NEXTVAL, 'susan_lee', 'topsecret', 'susan.lee@example.com', 'Student', SYSDATE, 1);

    INSERT INTO usr_tbl (user_id_pk, username, password, email_uniq, user_category, created_at, discount_id_fk)
    VALUES (user_seq_pk.NEXTVAL, 'michael_king', 'kingpass', 'michael.king@example.com', 'Regular', SYSDATE, 0);

    DBMS_OUTPUT.PUT_LINE('Data inserted into user_table successfully.');
EXCEPTION
    WHEN OTHERS THEN
        DBMS_OUTPUT.PUT_LINE('Error occurred while inserting data into user_table.');
END;
/
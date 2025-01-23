SET SERVEROUTPUT ON;

-- Drop and recreate SUBSCRIPTION
BEGIN
    EXECUTE IMMEDIATE 'DROP TABLE subscription CASCADE CONSTRAINTS';
EXCEPTION
    WHEN OTHERS THEN
        DBMS_OUTPUT.PUT_LINE('SUBSCRIPTION table does not exist. Skipping drop...');
END;
/
CREATE TABLE subscription (
    subscription_id_pk INTEGER PRIMARY KEY,
    user_id_fk INTEGER,
    subscription_type VARCHAR2(50),
    start_date DATE,
    end_date DATE,
    subscription_status VARCHAR2(50),
    CONSTRAINT fk_user_id_subscription FOREIGN KEY (user_id_fk) REFERENCES user_table(user_id_pk)
);

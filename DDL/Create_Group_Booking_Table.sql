SET SERVEROUTPUT ON;

-- Drop and recreate GROUP_BOOKING
BEGIN
    EXECUTE IMMEDIATE 'DROP TABLE group_booking CASCADE CONSTRAINTS';
EXCEPTION
    WHEN OTHERS THEN
        DBMS_OUTPUT.PUT_LINE('GROUP_BOOKING does not exist. Skipping drop...');
END;
/
CREATE TABLE group_booking (
    group_booking_id_pk INTEGER PRIMARY KEY,
    user_id_fk INTEGER,
    num_passengers INTEGER,
    booking_date DATE,
    transit_line VARCHAR2(50),
    transaction_status VARCHAR2(55),
    discounts_discount_id_pk INTEGER,
    total_amount NUMBER(10,2),
    CONSTRAINT fk_user_id_group_booking FOREIGN KEY (user_id_fk) REFERENCES user_table(user_id_pk),
    CONSTRAINT fk_discount_id_group_booking FOREIGN KEY (discounts_discount_id_pk) REFERENCES discounts(discount_id_pk)
);

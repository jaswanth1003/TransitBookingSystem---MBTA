SET SERVEROUTPUT ON;

-- Delete data from group_booking table and reinsert
BEGIN
    EXECUTE IMMEDIATE 'DELETE FROM grp_bkg';
    DBMS_OUTPUT.PUT_LINE('All data deleted from group_booking table successfully.');
EXCEPTION
    WHEN OTHERS THEN
        DBMS_OUTPUT.PUT_LINE('Error occurred while deleting data from group_booking table.');
END;
/

BEGIN
    -- Base price per passenger
    DECLARE
        base_price NUMBER := 2.40;
    BEGIN
        -- Group Booking 1: Regular discount (passengers < 5, no discount applied)
        INSERT INTO grp_bkg (group_booking_id_pk, user_id_fk, num_passengers, booking_date, transit_line, transaction_status, discounts_discount_id_pk, total_amount)
        VALUES (groupBooking_seq_pk.NEXTVAL, 1, 3, SYSDATE, 'Green Line', 'Approved', 0, 3 * base_price);

        -- Group Booking 2: Group Booking discount (passengers >= 5, 5% discount applied)
        INSERT INTO grp_bkg (group_booking_id_pk, user_id_fk, num_passengers, booking_date, transit_line, transaction_status, discounts_discount_id_pk, total_amount)
        VALUES (groupBooking_seq_pk.NEXTVAL, 2, 5, SYSDATE, 'Blue Line', 'Approved', 3, 5 * base_price * 0.95);

        -- Group Booking 3: Regular discount (passengers < 5, no discount applied)
        INSERT INTO grp_bkg (group_booking_id_pk, user_id_fk, num_passengers, booking_date, transit_line, transaction_status, discounts_discount_id_pk, total_amount)
        VALUES (groupBooking_seq_pk.NEXTVAL, 3, 2, SYSDATE, 'Orange Line', 'Approved', 0, 2 * base_price);

        -- Group Booking 4: Regular discount (passengers < 5, no discount applied)
        INSERT INTO grp_bkg (group_booking_id_pk, user_id_fk, num_passengers, booking_date, transit_line, transaction_status, discounts_discount_id_pk, total_amount)
        VALUES (groupBooking_seq_pk.NEXTVAL, 4, 4, SYSDATE, 'Red Line', 'Approved', 0, 4 * base_price);

        -- Group Booking 5: Group Booking discount (passengers >= 5, 5% discount applied)
        INSERT INTO grp_bkg (group_booking_id_pk, user_id_fk, num_passengers, booking_date, transit_line, transaction_status, discounts_discount_id_pk, total_amount)
        VALUES (groupBooking_seq_pk.NEXTVAL, 5, 6, SYSDATE, 'Green Line', 'Approved', 3, 6 * base_price * 0.95);

        DBMS_OUTPUT.PUT_LINE('Data inserted into group_booking table successfully.');
    EXCEPTION
        WHEN OTHERS THEN
            DBMS_OUTPUT.PUT_LINE('Error occurred while inserting data into group_booking table');
    END;
END;
/

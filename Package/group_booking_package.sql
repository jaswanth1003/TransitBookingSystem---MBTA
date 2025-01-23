CREATE OR REPLACE PACKAGE MBTA_ADMIN.group_booking_pkg IS
    PROCEDURE validate_booking_date(booking_date DATE);
    PROCEDURE record_booking(
        user_id IN NUMBER,
        num_passengers IN NUMBER,
        booking_date IN DATE,
        transit_line IN VARCHAR2,
        total_amount IN NUMBER
    );
END group_booking_pkg;
/


CREATE OR REPLACE PACKAGE BODY MBTA_ADMIN.group_booking_pkg IS
    PROCEDURE validate_booking_date(booking_date DATE) IS
    BEGIN
        IF booking_date < SYSDATE THEN
            DBMS_OUTPUT.PUT_LINE('Info: Booking with a past date is being processed.');
        END IF;
    END validate_booking_date;

    PROCEDURE record_booking(
        user_id IN NUMBER,
        num_passengers IN NUMBER,
        booking_date IN DATE,
        transit_line IN VARCHAR2,
        total_amount IN NUMBER
    ) IS
    BEGIN
        INSERT INTO GROUP_BOOKING (
            group_booking_id_pk, user_id_fk, num_passengers, booking_date,
            transit_line, transaction_status, discounts_discount_id_pk, total_amount
        )
        VALUES (
            GROUPBOOKING_SEQ_PK.NEXTVAL, user_id, num_passengers, booking_date,
            transit_line, 'Approved', 3, total_amount
        );
    END record_booking;
END group_booking_pkg;
/
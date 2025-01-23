CREATE OR REPLACE PROCEDURE MBTA_ADMIN.group_booking_procedure(
    user_id IN NUMBER,
    num_passengers IN NUMBER,
    transit_line IN VARCHAR2,
    booking_date IN DATE
) AS
    total_amount NUMBER;
BEGIN
    -- Step 1: Validate the user
    IF NOT MBTA_ADMIN.validate_user(user_id) THEN
        DBMS_OUTPUT.PUT_LINE('Error: User ID does not exist.');
        RETURN;
    END IF;

    -- Step 2: Validate number of passengers
    IF num_passengers > 15 THEN
        DBMS_OUTPUT.PUT_LINE('Error: Maximum number of passengers is 15.');
        RETURN;
    END IF;

    -- Step 3: Calculate the total amount using the function
    total_amount := MBTA_ADMIN.calculate_discounted_amount(num_passengers);

    -- Step 4: Validate the booking date using the package
    MBTA_ADMIN.group_booking_pkg.validate_booking_date(booking_date);

    -- Step 5: Record the booking using the package
    MBTA_ADMIN.group_booking_pkg.record_booking(user_id, num_passengers, booking_date, transit_line, total_amount);

    -- Commit the transaction
    COMMIT;

    -- Print confirmation
    DBMS_OUTPUT.PUT_LINE('Group booking created successfully for User ID: ' || user_id ||
                         '. Number of Passengers: ' || num_passengers ||
                         '. Total Amount: ' || total_amount);
END;
/

BEGIN
    EXECUTE IMMEDIATE 'GRANT EXECUTE ON MBTA_ADMIN.validate_user TO CUSTOMER_USER';
    EXECUTE IMMEDIATE 'GRANT EXECUTE ON MBTA_ADMIN.calculate_discounted_amount TO CUSTOMER_USER';
    EXECUTE IMMEDIATE 'GRANT EXECUTE ON MBTA_ADMIN.group_booking_pkg TO CUSTOMER_USER';
    EXECUTE IMMEDIATE 'GRANT EXECUTE ON MBTA_ADMIN.group_booking_procedure TO CUSTOMER_USER';
    DBMS_OUTPUT.PUT_LINE('Execute privileges granted to CUSTOMER_USER.');
END;
/
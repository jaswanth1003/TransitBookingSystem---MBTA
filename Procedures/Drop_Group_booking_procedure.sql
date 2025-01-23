SET SERVEROUTPUT ON;

BEGIN
    -- Drop functions if they exist
    BEGIN
        EXECUTE IMMEDIATE 'DROP FUNCTION MBTA_ADMIN.validate_user';
        DBMS_OUTPUT.PUT_LINE('Function "validate_user" dropped successfully.');
    EXCEPTION
        WHEN OTHERS THEN
            IF SQLCODE = -4043 THEN
                DBMS_OUTPUT.PUT_LINE('Function "validate_user" does not exist. Skipping drop...');
            ELSE
                DBMS_OUTPUT.PUT_LINE('Error while dropping function "validate_user": ' || SQLERRM);
            END IF;
    END;

    BEGIN
        EXECUTE IMMEDIATE 'DROP FUNCTION MBTA_ADMIN.calculate_discounted_amount';
        DBMS_OUTPUT.PUT_LINE('Function "calculate_discounted_amount" dropped successfully.');
    EXCEPTION
        WHEN OTHERS THEN
            IF SQLCODE = -4043 THEN
                DBMS_OUTPUT.PUT_LINE('Function "calculate_discounted_amount" does not exist. Skipping drop...');
            ELSE
                DBMS_OUTPUT.PUT_LINE('Error while dropping function "calculate_discounted_amount": ' || SQLERRM);
            END IF;
    END;

    -- Drop package if it exists
    BEGIN
        EXECUTE IMMEDIATE 'DROP PACKAGE MBTA_ADMIN.group_booking_pkg';
        DBMS_OUTPUT.PUT_LINE('Package "group_booking_pkg" dropped successfully.');
    EXCEPTION
        WHEN OTHERS THEN
            IF SQLCODE = -4043 THEN
                DBMS_OUTPUT.PUT_LINE('Package "group_booking_pkg" does not exist. Skipping drop...');
            ELSE
                DBMS_OUTPUT.PUT_LINE('Error while dropping package "group_booking_pkg": ' || SQLERRM);
            END IF;
    END;

    -- Drop procedure if it exists
    BEGIN
        EXECUTE IMMEDIATE 'DROP PROCEDURE MBTA_ADMIN.group_booking_procedure';
        DBMS_OUTPUT.PUT_LINE('Procedure "group_booking_procedure" dropped successfully.');
    EXCEPTION
        WHEN OTHERS THEN
            IF SQLCODE = -4043 THEN
                DBMS_OUTPUT.PUT_LINE('Procedure "group_booking_procedure" does not exist. Skipping drop...');
            ELSE
                DBMS_OUTPUT.PUT_LINE('Error while dropping procedure "group_booking_procedure": ' || SQLERRM);
            END IF;
    END;
END;
/
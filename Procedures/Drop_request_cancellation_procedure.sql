
SET SERVEROUTPUT ON;

BEGIN
    -- Drop the functions if they exist
    BEGIN
        EXECUTE IMMEDIATE 'DROP FUNCTION MBTA_ADMIN.is_ticket_used';
        DBMS_OUTPUT.PUT_LINE('Function "is_ticket_used" dropped successfully.');
    EXCEPTION
        WHEN OTHERS THEN
            IF SQLCODE = -4043 THEN
                DBMS_OUTPUT.PUT_LINE('Function "is_ticket_used" does not exist. Skipping drop...');
            ELSE
                DBMS_OUTPUT.PUT_LINE('Error while dropping function "is_ticket_used": ' || SQLERRM);
            END IF;
    END;

    BEGIN
        EXECUTE IMMEDIATE 'DROP FUNCTION MBTA_ADMIN.get_transaction_details';
        DBMS_OUTPUT.PUT_LINE('Function "get_transaction_details" dropped successfully.');
    EXCEPTION
        WHEN OTHERS THEN
            IF SQLCODE = -4043 THEN
                DBMS_OUTPUT.PUT_LINE('Function "get_transaction_details" does not exist. Skipping drop...');
            ELSE
                DBMS_OUTPUT.PUT_LINE('Error while dropping function "get_transaction_details": ' || SQLERRM);
            END IF;
    END;

    -- Drop the package if it exists
    BEGIN
        EXECUTE IMMEDIATE 'DROP PACKAGE MBTA_ADMIN.cancellation_pkg';
        DBMS_OUTPUT.PUT_LINE('Package "cancellation_pkg" dropped successfully.');
    EXCEPTION
        WHEN OTHERS THEN
            IF SQLCODE = -4043 THEN
                DBMS_OUTPUT.PUT_LINE('Package "cancellation_pkg" does not exist. Skipping drop...');
            ELSE
                DBMS_OUTPUT.PUT_LINE('Error while dropping package "cancellation_pkg": ' || SQLERRM);
            END IF;
    END;

    -- Drop the procedure if it exists
    BEGIN
        EXECUTE IMMEDIATE 'DROP PROCEDURE MBTA_ADMIN.request_cancellation';
        DBMS_OUTPUT.PUT_LINE('Procedure "request_cancellation" dropped successfully.');
    EXCEPTION
        WHEN OTHERS THEN
            IF SQLCODE = -4043 THEN
                DBMS_OUTPUT.PUT_LINE('Procedure "request_cancellation" does not exist. Skipping drop...');
            ELSE
                DBMS_OUTPUT.PUT_LINE('Error while dropping procedure "request_cancellation": ' || SQLERRM);
            END IF;
    END;
END;
/


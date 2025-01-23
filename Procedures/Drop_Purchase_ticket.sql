SET SERVEROUTPUT ON;

BEGIN
    -- Drop the functions if they exist
    BEGIN
        EXECUTE IMMEDIATE 'DROP FUNCTION MBTA_ADMIN.user_exists';
        DBMS_OUTPUT.PUT_LINE('Function "user_exists" dropped successfully.');
    EXCEPTION
        WHEN OTHERS THEN
            IF SQLCODE = -4043 THEN
                DBMS_OUTPUT.PUT_LINE('Function "user_exists" does not exist. Skipping drop...');
            ELSE
                DBMS_OUTPUT.PUT_LINE('Error while dropping function "user_exists": ' || SQLERRM);
            END IF;
    END;

    BEGIN
        EXECUTE IMMEDIATE 'DROP FUNCTION MBTA_ADMIN.get_active_subscription';
        DBMS_OUTPUT.PUT_LINE('Function "get_active_subscription" dropped successfully.');
    EXCEPTION
        WHEN OTHERS THEN
            IF SQLCODE = -4043 THEN
                DBMS_OUTPUT.PUT_LINE('Function "get_active_subscription" does not exist. Skipping drop...');
            ELSE
                DBMS_OUTPUT.PUT_LINE('Error while dropping function "get_active_subscription": ' || SQLERRM);
            END IF;
    END;

    BEGIN
        EXECUTE IMMEDIATE 'DROP FUNCTION MBTA_ADMIN.get_discount_rate';
        DBMS_OUTPUT.PUT_LINE('Function "get_discount_rate" dropped successfully.');
    EXCEPTION
        WHEN OTHERS THEN
            IF SQLCODE = -4043 THEN
                DBMS_OUTPUT.PUT_LINE('Function "get_discount_rate" does not exist. Skipping drop...');
            ELSE
                DBMS_OUTPUT.PUT_LINE('Error while dropping function "get_discount_rate": ' || SQLERRM);
            END IF;
    END;

    BEGIN
        EXECUTE IMMEDIATE 'DROP FUNCTION MBTA_ADMIN.get_total_spend';
        DBMS_OUTPUT.PUT_LINE('Function "get_total_spend" dropped successfully.');
    EXCEPTION
        WHEN OTHERS THEN
            IF SQLCODE = -4043 THEN
                DBMS_OUTPUT.PUT_LINE('Function "get_total_spend" does not exist. Skipping drop...');
            ELSE
                DBMS_OUTPUT.PUT_LINE('Error while dropping function "get_total_spend": ' || SQLERRM);
            END IF;
    END;

    -- Drop the package if it exists
    BEGIN
        EXECUTE IMMEDIATE 'DROP PACKAGE MBTA_ADMIN.ticket_pkg';
        DBMS_OUTPUT.PUT_LINE('Package "ticket_pkg" dropped successfully.');
    EXCEPTION
        WHEN OTHERS THEN
            IF SQLCODE = -4043 THEN
                DBMS_OUTPUT.PUT_LINE('Package "ticket_pkg" does not exist. Skipping drop...');
            ELSE
                DBMS_OUTPUT.PUT_LINE('Error while dropping package "ticket_pkg": ' || SQLERRM);
            END IF;
    END;

    -- Drop the procedure if it exists
    BEGIN
        EXECUTE IMMEDIATE 'DROP PROCEDURE MBTA_ADMIN.purchase_ticket';
        DBMS_OUTPUT.PUT_LINE('Procedure "purchase_ticket" dropped successfully.');
    EXCEPTION
        WHEN OTHERS THEN
            IF SQLCODE = -4043 THEN
                DBMS_OUTPUT.PUT_LINE('Procedure "purchase_ticket" does not exist. Skipping drop...');
            ELSE
                DBMS_OUTPUT.PUT_LINE('Error while dropping procedure "purchase_ticket": ' || SQLERRM);
            END IF;
    END;
END;
/
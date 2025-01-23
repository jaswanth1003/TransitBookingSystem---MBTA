
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

    -- Drop package if it exists
    BEGIN
        EXECUTE IMMEDIATE 'DROP PACKAGE MBTA_ADMIN.subscription_pkg';
        DBMS_OUTPUT.PUT_LINE('Package "subscription_pkg" dropped successfully.');
    EXCEPTION
        WHEN OTHERS THEN
            IF SQLCODE = -4043 THEN
                DBMS_OUTPUT.PUT_LINE('Package "subscription_pkg" does not exist. Skipping drop...');
            ELSE
                DBMS_OUTPUT.PUT_LINE('Error while dropping package "subscription_pkg": ' || SQLERRM);
            END IF;
    END;

    -- Drop procedure if it exists
    BEGIN
        EXECUTE IMMEDIATE 'DROP PROCEDURE MBTA_ADMIN.purchase_subscription';
        DBMS_OUTPUT.PUT_LINE('Procedure "purchase_subscription" dropped successfully.');
    EXCEPTION
        WHEN OTHERS THEN
            IF SQLCODE = -4043 THEN
                DBMS_OUTPUT.PUT_LINE('Procedure "purchase_subscription" does not exist. Skipping drop...');
            ELSE
                DBMS_OUTPUT.PUT_LINE('Error while dropping procedure "purchase_subscription": ' || SQLERRM);
            END IF;
    END;
END;
/


-- Enable server output to display messages
SET SERVEROUTPUT ON;

-- Drop Users and Roles Sequentially
BEGIN
    -- Drop Customer User and Role
    BEGIN
        EXECUTE IMMEDIATE 'DROP USER CUSTOMER_USER CASCADE';
        DBMS_OUTPUT.PUT_LINE('User CUSTOMER_USER dropped successfully.');
    EXCEPTION
        WHEN OTHERS THEN
            IF SQLCODE = -1918 THEN
                DBMS_OUTPUT.PUT_LINE('User CUSTOMER_USER does not exist. Skipping...');
            ELSE
                DBMS_OUTPUT.PUT_LINE('Error dropping user CUSTOMER_USER: ' || SQLERRM);
            END IF;
    END;

    BEGIN
        EXECUTE IMMEDIATE 'DROP ROLE CUSTOMER_ROLE1';
        DBMS_OUTPUT.PUT_LINE('Role CUSTOMER_ROLE dropped successfully.');
    EXCEPTION
        WHEN OTHERS THEN
            IF SQLCODE = -1924 THEN
                DBMS_OUTPUT.PUT_LINE('Role CUSTOMER_ROLE does not exist. Skipping...');
            ELSE
                DBMS_OUTPUT.PUT_LINE('Error dropping role CUSTOMER_ROLE: ' || SQLERRM);
            END IF;
    END;

    -- Drop Cashier User and Role
    BEGIN
        EXECUTE IMMEDIATE 'DROP USER CASHIER_USER CASCADE';
        DBMS_OUTPUT.PUT_LINE('User CASHIER_USER dropped successfully.');
    EXCEPTION
        WHEN OTHERS THEN
            IF SQLCODE = -1918 THEN
                DBMS_OUTPUT.PUT_LINE('User CASHIER_USER does not exist. Skipping...');
            ELSE
                DBMS_OUTPUT.PUT_LINE('Error dropping user CASHIER_USER: ' || SQLERRM);
            END IF;
    END;

    BEGIN
        EXECUTE IMMEDIATE 'DROP ROLE CASHIER_ROLE1';
        DBMS_OUTPUT.PUT_LINE('Role CASHIER_ROLE dropped successfully.');
    EXCEPTION
        WHEN OTHERS THEN
            IF SQLCODE = -1924 THEN
                DBMS_OUTPUT.PUT_LINE('Role CASHIER_ROLE does not exist. Skipping...');
            ELSE
                DBMS_OUTPUT.PUT_LINE('Error dropping role CASHIER_ROLE: ' || SQLERRM);
            END IF;
    END;

    -- Drop Group Booking Manager User and Role
    BEGIN
        EXECUTE IMMEDIATE 'DROP USER GROUP_BOOKING_MANAGER_USER CASCADE';
        DBMS_OUTPUT.PUT_LINE('User GROUP_BOOKING_MANAGER_USER dropped successfully.');
    EXCEPTION
        WHEN OTHERS THEN
            IF SQLCODE = -1918 THEN
                DBMS_OUTPUT.PUT_LINE('User GROUP_BOOKING_MANAGER_USER does not exist. Skipping...');
            ELSE
                DBMS_OUTPUT.PUT_LINE('Error dropping user GROUP_BOOKING_MANAGER_USER: ' || SQLERRM);
            END IF;
    END;

    BEGIN
        EXECUTE IMMEDIATE 'DROP ROLE GROUP_BOOKING_MANAGER_ROLE1';
        DBMS_OUTPUT.PUT_LINE('Role GROUP_BOOKING_MANAGER_ROLE dropped successfully.');
    EXCEPTION
        WHEN OTHERS THEN
            IF SQLCODE = -1924 THEN
                DBMS_OUTPUT.PUT_LINE('Role GROUP_BOOKING_MANAGER_ROLE does not exist. Skipping...');
            ELSE
                DBMS_OUTPUT.PUT_LINE('Error dropping role GROUP_BOOKING_MANAGER_ROLE: ' || SQLERRM);
            END IF;
    END;

    -- Drop Subscription Manager User and Role
    BEGIN
        EXECUTE IMMEDIATE 'DROP USER SUBSCRIPTION_MANAGER_USER CASCADE';
        DBMS_OUTPUT.PUT_LINE('User SUBSCRIPTION_MANAGER_USER dropped successfully.');
    EXCEPTION
        WHEN OTHERS THEN
            IF SQLCODE = -1918 THEN
                DBMS_OUTPUT.PUT_LINE('User SUBSCRIPTION_MANAGER_USER does not exist. Skipping...');
            ELSE
                DBMS_OUTPUT.PUT_LINE('Error dropping user SUBSCRIPTION_MANAGER_USER: ' || SQLERRM);
            END IF;
    END;

    BEGIN
        EXECUTE IMMEDIATE 'DROP ROLE SUBSCRIPTION_MANAGER_ROLE1';
        DBMS_OUTPUT.PUT_LINE('Role SUBSCRIPTION_MANAGER_ROLE dropped successfully.');
    EXCEPTION
        WHEN OTHERS THEN
            IF SQLCODE = -1924 THEN
                DBMS_OUTPUT.PUT_LINE('Role SUBSCRIPTION_MANAGER_ROLE does not exist. Skipping...');
            ELSE
                DBMS_OUTPUT.PUT_LINE('Error dropping role SUBSCRIPTION_MANAGER_ROLE: ' || SQLERRM);
            END IF;
    END;

    -- Commit Changes After Dropping Users and Roles
    COMMIT;
    DBMS_OUTPUT.PUT_LINE('Users and roles dropped successfully and changes committed.');
END;
/

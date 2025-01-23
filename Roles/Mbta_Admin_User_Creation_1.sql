SET SERVEROUTPUT ON;

DECLARE
    user_exists NUMBER;
BEGIN
    -- Check if the user already exists
    SELECT COUNT(*)
    INTO user_exists
    FROM all_users
    WHERE username = 'MBTA_ADMIN';

    IF user_exists > 0 THEN
        -- Drop the user if it exists
        BEGIN
            EXECUTE IMMEDIATE 'DROP USER mbta_admin CASCADE';
            DBMS_OUTPUT.PUT_LINE('User "mbta_admin" dropped successfully.');
        EXCEPTION
            WHEN OTHERS THEN
                DBMS_OUTPUT.PUT_LINE('Error while dropping user "mbta_admin": ' || SQLERRM);
        END;
    END IF;

    -- Create the user
    BEGIN
        EXECUTE IMMEDIATE 'CREATE USER mbta_admin IDENTIFIED BY "AdminRole@1234"';
        DBMS_OUTPUT.PUT_LINE('User "mbta_admin" created successfully.');
    EXCEPTION
        WHEN OTHERS THEN
            DBMS_OUTPUT.PUT_LINE('Error while creating user "mbta_admin": ' || SQLERRM);
    END;

    -- Grant necessary privileges to mbta_admin
    BEGIN
        EXECUTE IMMEDIATE 'GRANT CONNECT TO mbta_admin';
        EXECUTE IMMEDIATE 'GRANT CREATE SESSION, CREATE TABLE, CREATE SEQUENCE, CREATE PROCEDURE, CREATE TRIGGER, CREATE VIEW, CREATE PUBLIC SYNONYM, CREATE USER TO mbta_admin WITH ADMIN OPTION';
        EXECUTE IMMEDIATE 'GRANT CREATE SESSION TO mbta_admin WITH ADMIN OPTION';
        EXECUTE IMMEDIATE 'GRANT CREATE USER TO mbta_admin WITH ADMIN OPTION';
        EXECUTE IMMEDIATE 'GRANT ALTER USER TO mbta_admin WITH ADMIN OPTION';
        EXECUTE IMMEDIATE 'GRANT DROP USER TO mbta_admin WITH ADMIN OPTION';
        EXECUTE IMMEDIATE 'GRANT CONNECT TO mbta_admin WITH ADMIN OPTION';
        EXECUTE IMMEDIATE 'GRANT CREATE ROLE TO mbta_admin WITH ADMIN OPTION';
        EXECUTE IMMEDIATE 'GRANT UNLIMITED TABLESPACE TO mbta_admin';
        EXECUTE IMMEDIATE 'GRANT CREATE PUBLIC SYNONYM TO mbta_admin';
        EXECUTE IMMEDIATE 'GRANT DROP PUBLIC SYNONYM TO mbta_admin';



        -- Informational message
        DBMS_OUTPUT.PUT_LINE('All necessary privileges granted to "mbta_admin".');
    EXCEPTION
        WHEN OTHERS THEN
            DBMS_OUTPUT.PUT_LINE('Error while granting privileges to "mbta_admin": ' || SQLERRM);
    END;

    -- Commit the changes to ensure they are persisted
    COMMIT;
    
EXCEPTION
    WHEN OTHERS THEN
        DBMS_OUTPUT.PUT_LINE('Error: ' || SQLERRM);
END;
/

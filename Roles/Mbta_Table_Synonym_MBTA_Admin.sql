SET SERVEROUTPUT ON;

-- Drop and recreate Public Synonyms using mbta admin
DECLARE
    synonym_count INTEGER;
BEGIN
    -- Drop and recreate synonym for user_table
    SELECT COUNT(*) INTO synonym_count FROM all_synonyms WHERE synonym_name = 'USR_TBL' AND owner = 'PUBLIC';
    IF synonym_count > 0 THEN
        EXECUTE IMMEDIATE 'DROP PUBLIC SYNONYM usr_tbl';
        DBMS_OUTPUT.PUT_LINE('Public synonym "USR_TBL" dropped successfully.');
    END IF;
    EXECUTE IMMEDIATE 'CREATE PUBLIC SYNONYM usr_tbl FOR MBTA_ADMIN.user_table';
    DBMS_OUTPUT.PUT_LINE('Public synonym "USR_TBL" created successfully.');

    -- Drop and recreate synonym for discounts
    SELECT COUNT(*) INTO synonym_count FROM all_synonyms WHERE synonym_name = 'DISC' AND owner = 'PUBLIC';
    IF synonym_count > 0 THEN
        EXECUTE IMMEDIATE 'DROP PUBLIC SYNONYM disc';
        DBMS_OUTPUT.PUT_LINE('Public synonym "DISC" dropped successfully.');
    END IF;
    EXECUTE IMMEDIATE 'CREATE PUBLIC SYNONYM disc FOR MBTA_ADMIN.discounts';
    DBMS_OUTPUT.PUT_LINE('Public synonym "DISC" created successfully.');

    -- Drop and recreate synonym for ticket
    SELECT COUNT(*) INTO synonym_count FROM all_synonyms WHERE synonym_name = 'TKT' AND owner = 'PUBLIC';
    IF synonym_count > 0 THEN
        EXECUTE IMMEDIATE 'DROP PUBLIC SYNONYM tkt';
        DBMS_OUTPUT.PUT_LINE('Public synonym "TKT" dropped successfully.');
    END IF;
    EXECUTE IMMEDIATE 'CREATE PUBLIC SYNONYM tkt FOR MBTA_ADMIN.ticket';
    DBMS_OUTPUT.PUT_LINE('Public synonym "TKT" created successfully.');

    -- Drop and recreate synonym for transaction_table
    SELECT COUNT(*) INTO synonym_count FROM all_synonyms WHERE synonym_name = 'TXN_TBL' AND owner = 'PUBLIC';
    IF synonym_count > 0 THEN
        EXECUTE IMMEDIATE 'DROP PUBLIC SYNONYM txn_tbl';
        DBMS_OUTPUT.PUT_LINE('Public synonym "TXN_TBL" dropped successfully.');
    END IF;
    EXECUTE IMMEDIATE 'CREATE PUBLIC SYNONYM txn_tbl FOR MBTA_ADMIN.transaction_table';
    DBMS_OUTPUT.PUT_LINE('Public synonym "TXN_TBL" created successfully.');

    -- Drop and recreate synonym for rides
    SELECT COUNT(*) INTO synonym_count FROM all_synonyms WHERE synonym_name = 'RDS' AND owner = 'PUBLIC';
    IF synonym_count > 0 THEN
        EXECUTE IMMEDIATE 'DROP PUBLIC SYNONYM rds';
        DBMS_OUTPUT.PUT_LINE('Public synonym "RDS" dropped successfully.');
    END IF;
    EXECUTE IMMEDIATE 'CREATE PUBLIC SYNONYM rds FOR MBTA_ADMIN.rides';
    DBMS_OUTPUT.PUT_LINE('Public synonym "RDS" created successfully.');

    -- Drop and recreate synonym for subscription
    SELECT COUNT(*) INTO synonym_count FROM all_synonyms WHERE synonym_name = 'SUBS' AND owner = 'PUBLIC';
    IF synonym_count > 0 THEN
        EXECUTE IMMEDIATE 'DROP PUBLIC SYNONYM subs';
        DBMS_OUTPUT.PUT_LINE('Public synonym "SUBS" dropped successfully.');
    END IF;
    EXECUTE IMMEDIATE 'CREATE PUBLIC SYNONYM subs FOR MBTA_ADMIN.subscription';
    DBMS_OUTPUT.PUT_LINE('Public synonym "SUBS" created successfully.');

    -- Drop and recreate synonym for group_booking
    SELECT COUNT(*) INTO synonym_count FROM all_synonyms WHERE synonym_name = 'GRP_BKG' AND owner = 'PUBLIC';
    IF synonym_count > 0 THEN
        EXECUTE IMMEDIATE 'DROP PUBLIC SYNONYM grp_bkg';
        DBMS_OUTPUT.PUT_LINE('Public synonym "GRP_BKG" dropped successfully.');
    END IF;
    EXECUTE IMMEDIATE 'CREATE PUBLIC SYNONYM grp_bkg FOR MBTA_ADMIN.group_booking';
    DBMS_OUTPUT.PUT_LINE('Public synonym "GRP_BKG" created successfully.');
END;
/
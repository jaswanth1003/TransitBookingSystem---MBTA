SET SERVEROUTPUT ON;

-- Sequence for USER_TABLE primary key
DECLARE
    seq_count NUMBER;
BEGIN
    SELECT COUNT(*)
    INTO seq_count
    FROM ALL_SEQUENCES
    WHERE SEQUENCE_NAME = 'USER_SEQ_PK' AND SEQUENCE_OWNER = USER;

    IF seq_count > 0 THEN
        EXECUTE IMMEDIATE 'DROP SEQUENCE user_seq_pk';
        DBMS_OUTPUT.PUT_LINE('Sequence "user_seq_pk" dropped successfully.');
    END IF;

    EXECUTE IMMEDIATE 'CREATE SEQUENCE user_seq_pk START WITH 1 INCREMENT BY 1';
    DBMS_OUTPUT.PUT_LINE('Sequence "user_seq_pk" created successfully.');
END;
/

-- Sequence for TRANSACTION_TABLE primary key
DECLARE
    seq_count NUMBER;
BEGIN
    SELECT COUNT(*)
    INTO seq_count
    FROM ALL_SEQUENCES
    WHERE SEQUENCE_NAME = 'TRANSACTION_SEQ_PK' AND SEQUENCE_OWNER = USER;

    IF seq_count > 0 THEN
        EXECUTE IMMEDIATE 'DROP SEQUENCE transaction_seq_pk';
        DBMS_OUTPUT.PUT_LINE('Sequence "transaction_seq_pk" dropped successfully.');
    END IF;

    EXECUTE IMMEDIATE 'CREATE SEQUENCE transaction_seq_pk START WITH 1 INCREMENT BY 1';
    DBMS_OUTPUT.PUT_LINE('Sequence "transaction_seq_pk" created successfully.');
END;
/

-- Sequence for RIDES table primary key
DECLARE
    seq_count NUMBER;
BEGIN
    SELECT COUNT(*)
    INTO seq_count
    FROM ALL_SEQUENCES
    WHERE SEQUENCE_NAME = 'RIDES_SEQ_PK' AND SEQUENCE_OWNER = USER;

    IF seq_count > 0 THEN
        EXECUTE IMMEDIATE 'DROP SEQUENCE rides_seq_pk';
        DBMS_OUTPUT.PUT_LINE('Sequence "rides_seq_pk" dropped successfully.');
    END IF;

    EXECUTE IMMEDIATE 'CREATE SEQUENCE rides_seq_pk START WITH 1 INCREMENT BY 1';
    DBMS_OUTPUT.PUT_LINE('Sequence "rides_seq_pk" created successfully.');
END;
/

-- Sequence for SUBSCRIPTION table primary key
DECLARE
    seq_count NUMBER;
BEGIN
    SELECT COUNT(*)
    INTO seq_count
    FROM ALL_SEQUENCES
    WHERE SEQUENCE_NAME = 'SUBSCRIPTION_SEQ_PK' AND SEQUENCE_OWNER = USER;

    IF seq_count > 0 THEN
        EXECUTE IMMEDIATE 'DROP SEQUENCE subscription_seq_pk';
        DBMS_OUTPUT.PUT_LINE('Sequence "subscription_seq_pk" dropped successfully.');
    END IF;

    EXECUTE IMMEDIATE 'CREATE SEQUENCE subscription_seq_pk START WITH 1 INCREMENT BY 1';
    DBMS_OUTPUT.PUT_LINE('Sequence "subscription_seq_pk" created successfully.');
END;
/

-- Sequence for TICKET table primary key
DECLARE
    seq_count NUMBER;
BEGIN
    SELECT COUNT(*)
    INTO seq_count
    FROM ALL_SEQUENCES
    WHERE SEQUENCE_NAME = 'TICKET_SEQ_PK' AND SEQUENCE_OWNER = USER;

    IF seq_count > 0 THEN
        EXECUTE IMMEDIATE 'DROP SEQUENCE ticket_seq_pk';
        DBMS_OUTPUT.PUT_LINE('Sequence "ticket_seq_pk" dropped successfully.');
    END IF;

    EXECUTE IMMEDIATE 'CREATE SEQUENCE ticket_seq_pk START WITH 1 INCREMENT BY 1';
    DBMS_OUTPUT.PUT_LINE('Sequence "ticket_seq_pk" created successfully.');
END;
/

-- Sequence for GROUP_BOOKING table primary key
DECLARE
    seq_count NUMBER;
BEGIN
    SELECT COUNT(*)
    INTO seq_count
    FROM ALL_SEQUENCES
    WHERE SEQUENCE_NAME = 'GROUPBOOKING_SEQ_PK' AND SEQUENCE_OWNER = USER;

    IF seq_count > 0 THEN
        EXECUTE IMMEDIATE 'DROP SEQUENCE groupBooking_seq_pk';
        DBMS_OUTPUT.PUT_LINE('Sequence "groupBooking_seq_pk" dropped successfully.');
    END IF;

    EXECUTE IMMEDIATE 'CREATE SEQUENCE groupBooking_seq_pk START WITH 1 INCREMENT BY 1';
    DBMS_OUTPUT.PUT_LINE('Sequence "groupBooking_seq_pk" created successfully.');
END;
/

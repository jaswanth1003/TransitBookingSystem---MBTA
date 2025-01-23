
CREATE OR REPLACE PACKAGE MBTA_ADMIN.subscription_pkg IS
    FUNCTION calculate_end_date(subscription_type VARCHAR2, start_date DATE) RETURN DATE;
    PROCEDURE record_subscription(user_id IN NUMBER, subscription_type IN VARCHAR2, start_date IN DATE, end_date IN DATE);
END subscription_pkg;
/


CREATE OR REPLACE PACKAGE BODY MBTA_ADMIN.subscription_pkg IS
    FUNCTION calculate_end_date(subscription_type VARCHAR2, start_date DATE) RETURN DATE IS
    BEGIN
        IF subscription_type = 'Monthly' THEN
            RETURN ADD_MONTHS(start_date, 1);
        ELSIF subscription_type = 'Yearly' THEN
            RETURN ADD_MONTHS(start_date, 12);
        ELSE
            RAISE_APPLICATION_ERROR(-20001, 'Invalid subscription type. Only "Monthly" or "Yearly" is allowed.');
        END IF;
    END calculate_end_date;

    PROCEDURE record_subscription(user_id IN NUMBER, subscription_type IN VARCHAR2, start_date IN DATE, end_date IN DATE) IS
    BEGIN
        INSERT INTO SUBSCRIPTION (
            subscription_id_pk, user_id_fk, subscription_type, start_date,
            end_date, subscription_status
        )
        VALUES (
            SUBSCRIPTION_SEQ_PK.NEXTVAL, user_id, subscription_type, start_date,
            end_date, 'Active'
        );
    END record_subscription;
END subscription_pkg;
/

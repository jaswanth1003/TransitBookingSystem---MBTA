
CREATE OR REPLACE PROCEDURE MBTA_ADMIN.purchase_subscription(
    user_id IN NUMBER,
    subscription_type IN VARCHAR2,
    start_date IN DATE
) AS
    end_date DATE;
    active_subscription_type VARCHAR2(50);
BEGIN
    -- Step 1: Validate the user
    IF NOT MBTA_ADMIN.validate_user(user_id) THEN
        DBMS_OUTPUT.PUT_LINE('Error: User ID does not exist.');
        RETURN;
    END IF;

    -- Step 2: Check for active subscription
    active_subscription_type := MBTA_ADMIN.get_active_subscription(user_id);

    IF active_subscription_type IS NOT NULL THEN
        IF active_subscription_type != subscription_type THEN
            DBMS_OUTPUT.PUT_LINE('Error: User already has an active ' || active_subscription_type || ' subscription.');
            RETURN;
        ELSE
            DBMS_OUTPUT.PUT_LINE('Error: User already has an active ' || active_subscription_type || ' subscription.');
            RETURN;
        END IF;
    END IF;

    -- Step 3: Calculate the end date using the package
    end_date := MBTA_ADMIN.subscription_pkg.calculate_end_date(subscription_type, start_date);

    -- Step 4: Record the subscription using the package
    MBTA_ADMIN.subscription_pkg.record_subscription(user_id, subscription_type, start_date, end_date);

    -- Commit the transaction
    COMMIT;

    -- Print confirmation
    DBMS_OUTPUT.PUT_LINE('Subscription purchased successfully for User ID: ' || user_id ||
                         '. Subscription Type: ' || subscription_type ||
                         '. Start Date: ' || start_date || '. End Date: ' || end_date);
END;
/



BEGIN
    EXECUTE IMMEDIATE 'GRANT EXECUTE ON MBTA_ADMIN.validate_user TO CUSTOMER_USER';
    EXECUTE IMMEDIATE 'GRANT EXECUTE ON MBTA_ADMIN.get_active_subscription TO CUSTOMER_USER';
    EXECUTE IMMEDIATE 'GRANT EXECUTE ON MBTA_ADMIN.subscription_pkg TO CUSTOMER_USER';
    EXECUTE IMMEDIATE 'GRANT EXECUTE ON MBTA_ADMIN.purchase_subscription TO CUSTOMER_USER';
    DBMS_OUTPUT.PUT_LINE('Execute privileges granted to CUSTOMER_USER.');
END;
/

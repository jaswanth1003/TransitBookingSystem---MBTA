SET SERVEROUTPUT ON;
-- Grant Permissions on Views Based on Target Users
BEGIN



    -- Grant SELECT on Group_Booking_Overview to GROUP_BOOKING_MANAGER_ROLE
    EXECUTE IMMEDIATE 'GRANT SELECT ON MBTA_ADMIN.Group_Booking_Overview TO GROUP_BOOKING_MANAGER_USER';
    DBMS_OUTPUT.PUT_LINE('Granted SELECT on Group_Booking_Overview to GROUP_BOOKING_MANAGER_USER.');

    -- Grant SELECT on Subscription_Utilization to SUBSCRIPTION_MANAGER_ROLE
  
    EXECUTE IMMEDIATE 'GRANT SELECT ON MBTA_ADMIN.Subscription_Utilization TO SUBSCRIPTION_MANAGER_USER';
    DBMS_OUTPUT.PUT_LINE('Granted SELECT on Subscription_Utilization to SUBSCRIPTION_MANAGER_USER.');

    -- Grant SELECT on Transaction_Summary to CASHIER_ROLE

    EXECUTE IMMEDIATE 'GRANT SELECT ON MBTA_ADMIN.Transaction_Summary TO CASHIER_USER';
    DBMS_OUTPUT.PUT_LINE('Granted SELECT on Transaction_Summary to CASHIER_USER.');

    -- Grant SELECT on Refunds_Cancellation_Summary to CASHIER_ROLE
    EXECUTE IMMEDIATE 'GRANT SELECT ON MBTA_ADMIN.Refunds_Cancellation_Summary TO CASHIER_USER';
    DBMS_OUTPUT.PUT_LINE('Granted SELECT on Refunds_Cancellation_Summary to CASHIER_USER.');

    -- Grant SELECT on Customer_Tickets to CUSTOMER_ROLE
    EXECUTE IMMEDIATE 'GRANT SELECT ON MBTA_ADMIN.Customer_Tickets TO CUSTOMER_USER';
    DBMS_OUTPUT.PUT_LINE('Granted SELECT on Customer_Tickets to CUSTOMER_USER.');

        -- Grant SELECT on Customer_SUMMARY to CUSTOMER_ROLE
    EXECUTE IMMEDIATE 'GRANT SELECT ON MBTA_ADMIN.Customer_Summary TO CUSTOMER_USER';
    DBMS_OUTPUT.PUT_LINE('Granted SELECT on Customer_Summary to CUSTOMER_USER.');

    -- Grant SELECT on Customer_Subscriptions to CUSTOMER_ROLE
    EXECUTE IMMEDIATE 'GRANT SELECT ON MBTA_ADMIN.Customer_Subscriptions TO CUSTOMER_USER';
    DBMS_OUTPUT.PUT_LINE('Granted SELECT on Customer_Subscriptions to CUSTOMER_USER.');
END;
/


CREATE OR REPLACE PROCEDURE MBTA_ADMIN.purchase_ticket(
    user_id IN NUMBER,          -- ID of the user purchasing the ticket
    transit_line IN VARCHAR2    -- Name of the transit line
) AS
    discount_rate NUMBER;
    total_spend NUMBER;
    final_price NUMBER;
    subscription_type VARCHAR2(50);
    base_price CONSTANT NUMBER := 2.40;
    new_ticket_id NUMBER;
BEGIN
    -- Check if the user exists
    IF NOT user_exists(user_id) THEN
        DBMS_OUTPUT.PUT_LINE('Error: User ID does not exist.');
        RETURN;
    END IF;

    -- Check for active subscription
    subscription_type := get_active_subscription(user_id);
    IF subscription_type IS NOT NULL THEN
        DBMS_OUTPUT.PUT_LINE('User has an active ' || subscription_type || ' subscription. No need to buy a ticket.');
        RETURN;
    END IF;

    -- Get discount rate
    discount_rate := get_discount_rate(user_id);

    -- Get total spend for the month
    total_spend := get_total_spend(user_id, TRUNC(SYSDATE, 'MM'));

    -- Calculate ticket price
    IF total_spend >= 100 THEN
        final_price := 0;
        DBMS_OUTPUT.PUT_LINE('Fare capped: No charge for User ID ' || user_id || ' for the rest of the month.');
    ELSE
        final_price := base_price * (1 - discount_rate / 100);
    END IF;

    -- Insert ticket record
    INSERT INTO TICKET (ticket_id_pk, user_id_fk, purchase_date, purchase_time, price, transit_line, ticket_status)
    VALUES (TICKET_SEQ_PK.NEXTVAL, user_id, TRUNC(SYSDATE), SYSTIMESTAMP, final_price, transit_line, 'Valid')
    RETURNING ticket_id_pk INTO new_ticket_id;

    -- Log the transaction using the package
    ticket_pkg.log_ticket_purchase(user_id, new_ticket_id, final_price, transit_line);

    DBMS_OUTPUT.PUT_LINE('Ticket purchased successfully for User ID: ' || user_id || ', Final Price: ' || final_price);
END;
/

GRANT EXECUTE ON MBTA_ADMIN.purchase_ticket TO CUSTOMER_USER;
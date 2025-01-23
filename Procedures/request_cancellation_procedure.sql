
CREATE OR REPLACE PROCEDURE MBTA_ADMIN.request_cancellation(
    ticket_id IN NUMBER, -- Ticket ID of the ticket
    user_id IN NUMBER    -- User ID requesting cancellation
) AS
    transaction_status VARCHAR2(50);
BEGIN
    -- Check if the ticket is used
    IF is_ticket_used(ticket_id) THEN
        DBMS_OUTPUT.PUT_LINE('Error: Ticket has already been used for a ride. Cancellation not allowed.');
        RETURN;
    END IF;

    -- Get the transaction status
    transaction_status := get_transaction_details(ticket_id, user_id);

    IF transaction_status = 'No Transaction' THEN
        DBMS_OUTPUT.PUT_LINE('Error: No transaction found for the given ticket and user.');
        RETURN;
    ELSIF transaction_status <> 'Completed' THEN
        DBMS_OUTPUT.PUT_LINE('Error: Transaction is not valid for cancellation.');
        RETURN;
    END IF;

    -- Use the package to update the transaction status
    cancellation_pkg.update_transaction_status(ticket_id, user_id, 'Refunded');

    DBMS_OUTPUT.PUT_LINE('Cancellation request processed successfully for Ticket ID: ' || ticket_id);
END;
/



BEGIN
    EXECUTE IMMEDIATE 'GRANT EXECUTE ON MBTA_ADMIN.is_ticket_used TO CUSTOMER_USER';
    EXECUTE IMMEDIATE 'GRANT EXECUTE ON MBTA_ADMIN.get_transaction_details TO CUSTOMER_USER';
    EXECUTE IMMEDIATE 'GRANT EXECUTE ON MBTA_ADMIN.cancellation_pkg TO CUSTOMER_USER';
    EXECUTE IMMEDIATE 'GRANT EXECUTE ON MBTA_ADMIN.request_cancellation TO CUSTOMER_USER';
    DBMS_OUTPUT.PUT_LINE('Execute privileges granted to CUSTOMER_USER.');
END;
/


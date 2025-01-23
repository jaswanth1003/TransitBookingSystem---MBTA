
CREATE OR REPLACE FUNCTION MBTA_ADMIN.is_ticket_used(ticket_id NUMBER) RETURN BOOLEAN IS
    ticket_count NUMBER;
BEGIN
    SELECT COUNT(*)
    INTO ticket_count
    FROM RIDES
    WHERE ticket_id_fk = ticket_id;

    RETURN ticket_count > 0;
END;
/



CREATE OR REPLACE FUNCTION MBTA_ADMIN.get_transaction_details(ticket_id NUMBER, user_id NUMBER)
    RETURN VARCHAR2 IS
    transaction_status VARCHAR2(50);
BEGIN
    SELECT transaction_status
    INTO transaction_status
    FROM TRANSACTION_TABLE
    WHERE ticket_id_fk = ticket_id AND user_id_fk = user_id;

    RETURN transaction_status;
EXCEPTION
    WHEN NO_DATA_FOUND THEN
        RETURN 'No Transaction';
END;
/


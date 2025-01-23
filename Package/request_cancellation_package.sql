
CREATE OR REPLACE PACKAGE MBTA_ADMIN.cancellation_pkg IS
    PROCEDURE update_transaction_status(ticket_id NUMBER, user_id NUMBER, refund_status VARCHAR2);
END cancellation_pkg;
/



CREATE OR REPLACE PACKAGE BODY MBTA_ADMIN.cancellation_pkg IS
    PROCEDURE update_transaction_status(ticket_id NUMBER, user_id NUMBER, refund_status VARCHAR2) IS
    BEGIN
        UPDATE TRANSACTION_TABLE
        SET refund_status = refund_status,
            refund_request = 'Processed',
            transaction_status = 'Cancelled'
        WHERE ticket_id_fk = ticket_id AND user_id_fk = user_id;

        COMMIT;
    END update_transaction_status;
END cancellation_pkg;
/


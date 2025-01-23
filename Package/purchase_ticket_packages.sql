CREATE OR REPLACE PACKAGE MBTA_ADMIN.ticket_pkg IS
    PROCEDURE log_ticket_purchase(
        user_id NUMBER,
        ticket_id NUMBER,
        amount NUMBER,
        transit_line VARCHAR2
    );
END ticket_pkg;
/

CREATE OR REPLACE PACKAGE BODY MBTA_ADMIN.ticket_pkg IS
    PROCEDURE log_ticket_purchase(
        user_id NUMBER,
        ticket_id NUMBER,
        amount NUMBER,
        transit_line VARCHAR2
    ) IS
    BEGIN
        INSERT INTO TRANSACTION_TABLE (
            transaction_id_pk, ticket_id_fk, transaction_status, amount, transaction_date, user_id_fk
        )
        VALUES (
            TRANSACTION_SEQ_PK.NEXTVAL, ticket_id, 'Completed', amount, SYSTIMESTAMP, user_id
        );
    END log_ticket_purchase;
END ticket_pkg;
/
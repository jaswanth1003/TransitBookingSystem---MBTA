-- Create Transaction_Summary View
    CREATE OR REPLACE VIEW TRANSACTION_SUMMARY AS
    SELECT 
        t.transaction_id_pk AS transaction_id,
        t.ticket_id_fk AS ticket_id,
        t.transaction_status,
        t.amount,
        t.transaction_date,
        t.refund_status,
        t.refund_request,
        t.user_id_fk AS user_id
    FROM 
        MBTA_ADMIN.transaction_table t;
-- Create Refunds_Cancellation_Summary View

    CREATE OR REPLACE VIEW REFUNDS_CANCELLATION_SUMMARY AS
    SELECT 
        t.transaction_id_pk AS transaction_id,
        t.ticket_id_fk AS ticket_id,
        t.amount AS refunded_amount,
        t.refund_status,
        t.transaction_date
    FROM 
        MBTA_ADMIN.transaction_table t
    WHERE 
        t.refund_status = 'Refunded' OR t.transaction_status = 'Cancelled';
  

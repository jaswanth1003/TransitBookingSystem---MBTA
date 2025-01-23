CREATE OR REPLACE VIEW SUBSCRIPTION_UTILIZATION AS
    SELECT 
        s.subscription_id_pk AS subscription_id,
        s.user_id_fk AS user_id,
        s.subscription_type,
        s.start_date,
        s.end_date,
        s.subscription_status
    FROM 
        MBTA_ADMIN.subscription s;
    

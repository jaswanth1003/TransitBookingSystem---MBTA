-- Create Customer_Summary View

    CREATE OR REPLACE VIEW CUSTOMER_SUMMARY AS
    SELECT 
        u.user_id_pk AS user_id,
        u.username,
        u.user_category,
        SUM(r.total_spend) AS total_spend,
        s.subscription_status
    FROM 
        MBTA_ADMIN.user_table u
        LEFT JOIN MBTA_ADMIN.rides r ON u.user_id_pk = r.user_id_fk
        LEFT JOIN MBTA_ADMIN.subscription s ON u.user_id_pk = s.user_id_fk
    GROUP BY 
        u.user_id_pk, u.username, u.user_category, s.subscription_status;
   

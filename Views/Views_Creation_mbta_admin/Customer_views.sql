-- Create Customer_Tickets View

CREATE or REPLACE VIEW CUSTOMER_TICKETS AS
SELECT 
    u.user_id_pk AS user_id,
    u.username,
    t.ticket_id_pk AS ticket_id,
    t.purchase_date,
    t.purchase_time,
    t.price,
    t.transit_line,
    t.ticket_status
FROM 
    user_table u
    JOIN ticket t ON u.user_id_pk = t.user_id_fk;



-- Create Customer_Subscriptions View

CREATE OR REPLACE VIEW CUSTOMER_SUBSCRIPTIONS AS
SELECT 
    u.user_id_pk AS user_id,
    u.username,
    s.subscription_id_pk AS subscription_id,
    s.subscription_type,
    s.start_date,
    s.end_date,
    s.subscription_status
FROM 
    user_table u
    LEFT JOIN subscription s ON u.user_id_pk = s.user_id_fk
WHERE 
    s.subscription_id_pk IS NOT NULL;


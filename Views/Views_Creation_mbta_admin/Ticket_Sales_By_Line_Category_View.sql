-- Create Ticket_Sales_By_Line_Category View
    CREATE OR REPLACE VIEW TICKET_SALES_BY_LINE_CATEGORY AS
    SELECT 
        t.transit_line,
        u.user_category,
        COUNT(t.ticket_id_pk) AS ticket_count
    FROM 
        MBTA_ADMIN.ticket t
        JOIN MBTA_ADMIN.user_table u ON t.user_id_fk = u.user_id_pk
    GROUP BY 
        t.transit_line, u.user_category;
   
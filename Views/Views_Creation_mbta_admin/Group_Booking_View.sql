

  
    CREATE OR REPLACE VIEW GROUP_BOOKING_OVERVIEW AS
    SELECT 
        gb.group_booking_id_pk AS booking_id,
        gb.num_passengers,
        gb.booking_date,
        gb.transit_line,
        gb.transaction_status AS booking_status
    FROM 
        MBTA_ADMIN.group_booking gb;
    

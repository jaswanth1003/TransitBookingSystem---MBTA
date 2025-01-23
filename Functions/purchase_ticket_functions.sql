-- Create the user_exists function
CREATE OR REPLACE FUNCTION MBTA_ADMIN.user_exists(user_id NUMBER) RETURN BOOLEAN IS
    user_count NUMBER;
BEGIN
    SELECT COUNT(*) INTO user_count FROM USER_TABLE WHERE user_id_pk = user_id;
    RETURN user_count > 0;
END;
/

-- Create the get_active_subscription function
CREATE OR REPLACE FUNCTION MBTA_ADMIN.get_active_subscription(user_id NUMBER) RETURN VARCHAR2 IS
    subscription_type VARCHAR2(50);
BEGIN
    SELECT subscription_type
    INTO subscription_type
    FROM SUBSCRIPTION
    WHERE user_id_fk = user_id AND subscription_status = 'Active' AND end_date >= SYSDATE;
    RETURN subscription_type;
EXCEPTION
    WHEN NO_DATA_FOUND THEN
        RETURN NULL;
END;
/

-- Create the get_discount_rate function
CREATE OR REPLACE FUNCTION MBTA_ADMIN.get_discount_rate(user_id NUMBER) RETURN NUMBER IS
    discount_rate NUMBER;
BEGIN
    SELECT discount_rate
    INTO discount_rate
    FROM DISCOUNTS d
    JOIN USER_TABLE u ON d.discount_id_pk = u.discount_id_fk
    WHERE u.user_id_pk = user_id;
    RETURN discount_rate;
END;
/

-- Create the get_total_spend function
CREATE OR REPLACE FUNCTION MBTA_ADMIN.get_total_spend(user_id NUMBER, start_date DATE) RETURN NUMBER IS
    total_spend NUMBER;
BEGIN
    SELECT NVL(SUM(price), 0)
    INTO total_spend
    FROM TICKET
    WHERE user_id_fk = user_id AND purchase_date >= start_date;
    RETURN total_spend;
END;
/
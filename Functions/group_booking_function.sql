CREATE OR REPLACE FUNCTION MBTA_ADMIN.validate_user(user_id NUMBER) RETURN BOOLEAN IS
    user_exists NUMBER;
BEGIN
    SELECT COUNT(*)
    INTO user_exists
    FROM USER_TABLE
    WHERE user_id_pk = user_id;

    RETURN user_exists > 0;
EXCEPTION
    WHEN NO_DATA_FOUND THEN
        RETURN FALSE;
END;
/


CREATE OR REPLACE FUNCTION MBTA_ADMIN.calculate_discounted_amount(
    num_passengers NUMBER
) RETURN NUMBER IS
    base_price CONSTANT NUMBER := 2.40;
    discount_rate NUMBER := 0;
BEGIN
    IF num_passengers >= 5 THEN
        discount_rate := 5;
    END IF;

    RETURN num_passengers * base_price * (1 - discount_rate / 100);
END;
/
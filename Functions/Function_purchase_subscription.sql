
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


CREATE OR REPLACE FUNCTION MBTA_ADMIN.get_active_subscription(user_id NUMBER) RETURN VARCHAR2 IS
    active_subscription_type VARCHAR2(50);
BEGIN
    SELECT MAX(subscription_type)
    INTO active_subscription_type
    FROM SUBSCRIPTION
    WHERE user_id_fk = user_id
      AND subscription_status = 'Active';

    RETURN active_subscription_type;
EXCEPTION
    WHEN NO_DATA_FOUND THEN
        RETURN NULL;
END;
/


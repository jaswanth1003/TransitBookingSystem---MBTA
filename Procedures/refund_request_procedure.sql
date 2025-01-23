SET SERVEROUTPUT ON;

BEGIN
    -- Drop the procedure if it exists.
    BEGIN
        EXECUTE IMMEDIATE 'DROP PROCEDURE MBTA_ADMIN.process_refund_request';
        DBMS_OUTPUT.PUT_LINE('Procedure "process_refund_request" dropped successfully.');
    EXCEPTION
        WHEN OTHERS THEN
            IF SQLCODE = -4043 THEN
                DBMS_OUTPUT.PUT_LINE('Procedure "process_refund_request" does not exist. Skipping drop...');
            ELSE
                DBMS_OUTPUT.PUT_LINE('Error while dropping procedure "process_refund_request": ' || SQLERRM);
            END IF;
    END;

    -- Create the procedure
    EXECUTE IMMEDIATE '
        CREATE OR REPLACE PROCEDURE process_refund_request(
            ticket_id IN NUMBER  -- Ticket ID from the TRANSACTION_TABLE
        ) AS
            ride_exists NUMBER;         -- To check if a ride exists for the ticket
            transaction_id NUMBER;      -- To fetch the transaction ID
            refund_request VARCHAR2(50);-- Refund request status
        BEGIN
            -- Fetch the transaction ID and refund request from the TRANSACTION_TABLE
            SELECT transaction_id_pk, refund_request
            INTO transaction_id, refund_request
            FROM TRANSACTION_TABLE
            WHERE ticket_id_fk = ticket_id;

            -- Ensure that the refund request is "Requested"
            IF refund_request <> ''Requested'' THEN
                DBMS_OUTPUT.PUT_LINE(''Error: Refund request not in "Requested" status for Ticket ID: '' || ticket_id);
                RETURN; -- Exit the procedure
            END IF;

            -- Check if a ride exists for the ticket in the RIDES table
            SELECT COUNT(*)
            INTO ride_exists
            FROM RIDES
            WHERE ticket_id_fk = ticket_id;

            -- Update refund status based on whether the ride was taken
            IF ride_exists > 0 THEN
                -- Ride exists, mark refund as "Not Eligible"
                UPDATE TRANSACTION_TABLE
                SET refund_status = ''Not Eligible''
                WHERE ticket_id_fk = ticket_id;

                DBMS_OUTPUT.PUT_LINE(''Refund marked as "Not Eligible" for Ticket ID: '' || ticket_id);
            ELSE
                -- Ride does not exist, mark refund as "Refunded"
                UPDATE TRANSACTION_TABLE
                SET refund_status = ''Refunded''
                WHERE ticket_id_fk = ticket_id;

                DBMS_OUTPUT.PUT_LINE(''Refund marked as "Refunded" for Ticket ID: '' || ticket_id);
            END IF;

            -- Commit the changes
            COMMIT;

        END;
    ';
    DBMS_OUTPUT.PUT_LINE('Procedure "process_refund_request" created successfully.');

    -- Grant execute privilege on the procedure to CASHIER_USER
    EXECUTE IMMEDIATE 'GRANT EXECUTE ON MBTA_ADMIN.process_refund_request TO CASHIER_USER';
    DBMS_OUTPUT.PUT_LINE('Execute privilege granted to "CASHIER_USER" on "process_refund_request".');

END;
/

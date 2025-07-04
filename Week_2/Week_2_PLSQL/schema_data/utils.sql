CREATE OR REPLACE PROCEDURE DisplayTable (table_name IN VARCHAR2) AS
    v_sql VARCHAR2(100);
BEGIN 
    v_sql := 'SELECT * FROM ' || table_name;

    EXECUTE IMMEDIATE v_sql;

    DBMS_OUTPUT.PUT_LINE('Executed: ' || v_sql);
END;
/

SELECT * FROM ACCOUNTS;
SELECT * FROM CUSTOMERS;
SELECT * FROM EMPLOYEES;
SELECT * FROM LOANS;
SELECT * FROM TRANSACTIONS;
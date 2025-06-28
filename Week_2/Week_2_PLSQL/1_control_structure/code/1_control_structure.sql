-- Question 1
DECLARE
    CURSOR senior_customers_cur IS
        SELECT CustomerID, DOB FROM Customers;

    v_age NUMBER;
BEGIN
    FOR cust IN senior_customers_cur LOOP
        v_age := FLOOR(MONTHS_BETWEEN(SYSDATE, cust.DOB) / 12);

        IF v_age > 60 THEN
            UPDATE Loans
            SET InterestRate = InterestRate - 1
            WHERE CustomerID = cust.CustomerID;

            DBMS_OUTPUT.PUT_LINE('Customer ID: ' || cust.CustomerID || ' with Age: ' || v_age || ' got the Benefit');
        END IF;
    END LOOP;

    COMMIT;
END;
/

ALTER table Customers ADD isVIP VARCHAR2(5);


-- Question 2
BEGIN
    FOR cust IN (
        SELECT CustomerID, Balance
        FROM Customers
    ) LOOP
        IF cust.Balance > 10000 THEN
            UPDATE Customers
            SET IsVIP = 'True'
            WHERE CustomerID = cust.CustomerID;
            DBMS_OUTPUT.PUT_LINE('Customer ID ' || cust.CustomerID || ' marked as VIP.');
        ELSE
            UPDATE Customers
            SET IsVIP = 'False'
            WHERE CustomerID = cust.CustomerID;

            DBMS_OUTPUT.PUT_LINE('Customer ID ' || cust.CustomerID || ' not VIP.');
        END IF;
    END LOOP;

    COMMIT;
END;
/

select * from customers;

-- Question 3
BEGIN
    FOR loan_rec IN (
        SELECT l.LoanID, l.CustomerID, l.EndDate, c.Name
        FROM Loans l
        JOIN Customers c ON l.CustomerID = c.CustomerID
        WHERE l.EndDate BETWEEN SYSDATE AND SYSDATE + 30
    ) LOOP
        DBMS_OUTPUT.PUT_LINE(
            'Reminder: Loan ID ' || loan_rec.LoanID || ' for customer "' || loan_rec.Name || 
            '" is due on ' || TO_CHAR(loan_rec.EndDate, 'YYYY-MM-DD')
        );
    END LOOP;
END;
/
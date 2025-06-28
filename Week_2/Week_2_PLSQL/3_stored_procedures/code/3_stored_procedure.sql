-- Question 1
CREATE OR REPLACE PROCEDURE ProcessMonthlyInterest IS
BEGIN
    UPDATE Accounts
    SET Balance = Balance * 1.01,
        LastModified = SYSDATE
    WHERE AccountType = 'Savings';

    DBMS_OUTPUT.PUT_LINE('Monthly interest applied to all savings accounts.');

    COMMIT;
END;
/

execute ProcessMonthlyInterest;

select * from ACCOUNTS;


-- Question 2
CREATE OR REPLACE PROCEDURE UpdateEmployeeBonus ( p_Department IN VARCHAR2, p_BonusPercent  IN NUMBER) AS
    v_Count  NUMBER;
BEGIN
    UPDATE Employees
    SET Salary = Salary + (Salary * p_BonusPercent / 100)
    WHERE Department = p_Department;

    v_Count := SQL%ROWCOUNT;

    DBMS_OUTPUT.PUT_LINE(
        'Bonus of ' || p_BonusPercent || '% applied to ' || v_Count || 
        'employee in "' || p_Department || '" department'
    );

    COMMIT;
END;
/

EXEC UpdateEmployeeBonus('IT', 10);
select * from EMPLOYEES;


-- Question 3
CREATE OR REPLACE PROCEDURE TransferFunds (p_SourceAccountID IN NUMBER, p_DestinationAccountID IN NUMBER, p_Amount IN NUMBER) AS
    v_SourceBalance NUMBER;
BEGIN
    SELECT Balance INTO v_SourceBalance
    FROM Accounts
    WHERE AccountID = p_SourceAccountID;

    IF v_SourceBalance >= p_Amount THEN
        UPDATE Accounts
        SET Balance = Balance - p_Amount
        WHERE AccountID = p_SourceAccountID;

        UPDATE Accounts
        SET Balance = Balance + p_Amount
        WHERE AccountID = p_DestinationAccountID;

        COMMIT;

        DBMS_OUTPUT.PUT_LINE('Transfer successful.');
    ELSE
        DBMS_OUTPUT.PUT_LINE('Insufficient balance.');
    END IF;
END;
/
EXEC TransferFunds(1, 2, 500);
select * from accounts;
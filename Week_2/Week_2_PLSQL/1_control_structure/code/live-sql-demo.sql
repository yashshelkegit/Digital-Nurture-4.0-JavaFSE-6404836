CREATE TABLE Customers (
    CustomerID NUMBER PRIMARY KEY,
    Name VARCHAR2(100),
    DOB DATE,
    Balance NUMBER,
    LastModified DATE
);

CREATE TABLE Accounts (
    AccountID NUMBER PRIMARY KEY,
    CustomerID NUMBER,
    AccountType VARCHAR2(20),
    Balance NUMBER,
    LastModified DATE,
    FOREIGN KEY (CustomerID) REFERENCES Customers(CustomerID)
);

CREATE TABLE Transactions (
    TransactionID NUMBER PRIMARY KEY,
    AccountID NUMBER,
    TransactionDate DATE,
    Amount NUMBER,
    TransactionType VARCHAR2(10),
    FOREIGN KEY (AccountID) REFERENCES Accounts(AccountID)
);

CREATE TABLE Loans (
    LoanID NUMBER PRIMARY KEY,
    CustomerID NUMBER,
    LoanAmount NUMBER,
    InterestRate NUMBER,
    StartDate DATE,
    EndDate DATE,
    FOREIGN KEY (CustomerID) REFERENCES Customers(CustomerID)
);

CREATE TABLE Employees (
    EmployeeID NUMBER PRIMARY KEY,
    Name VARCHAR2(100),
    Position VARCHAR2(50),
    Salary NUMBER,
    Department VARCHAR2(50),
    HireDate DATE
); 


INSERT INTO Customers (CustomerID, Name, DOB, Balance, LastModified)
VALUES (1, 'John Doe', TO_DATE('1985-05-15', 'YYYY-MM-DD'), 1000, SYSDATE);

INSERT INTO Customers (CustomerID, Name, DOB, Balance, LastModified)
VALUES (2, 'Jane Smith', TO_DATE('1990-07-20', 'YYYY-MM-DD'), 1500, SYSDATE);

INSERT INTO Accounts (AccountID, CustomerID, AccountType, Balance, LastModified)
VALUES (1, 1, 'Savings', 1000, SYSDATE);

INSERT INTO Accounts (AccountID, CustomerID, AccountType, Balance, LastModified)
VALUES (2, 2, 'Checking', 1500, SYSDATE);

INSERT INTO Transactions (TransactionID, AccountID, TransactionDate, Amount, TransactionType)
VALUES (1, 1, SYSDATE, 200, 'Deposit');

INSERT INTO Transactions (TransactionID, AccountID, TransactionDate, Amount, TransactionType)
VALUES (2, 2, SYSDATE, 300, 'Withdrawal');

INSERT INTO Loans (LoanID, CustomerID, LoanAmount, InterestRate, StartDate, EndDate)
VALUES (1, 1, 5000, 5, SYSDATE, ADD_MONTHS(SYSDATE, 60));

INSERT INTO Employees (EmployeeID, Name, Position, Salary, Department, HireDate)
VALUES (1, 'Alice Johnson', 'Manager', 70000, 'HR', TO_DATE('2015-06-15', 'YYYY-MM-DD'));

INSERT INTO Employees (EmployeeID, Name, Position, Salary, Department, HireDate)
VALUES (2, 'Bob Brown', 'Developer', 60000, 'IT', TO_DATE('2017-03-20', 'YYYY-MM-DD'));


INSERT INTO Customers (CustomerID, Name, DOB, Balance, LastModified)
VALUES (3, 'Michael White', TO_DATE('1982-11-03', 'YYYY-MM-DD'), 2000, SYSDATE);

INSERT INTO Customers (CustomerID, Name, DOB, Balance, LastModified)
VALUES (4, 'Emily Davis', TO_DATE('1995-01-22', 'YYYY-MM-DD'), 2500, SYSDATE);

INSERT INTO Customers (CustomerID, Name, DOB, Balance, LastModified)
VALUES (5, 'David Green', TO_DATE('1978-09-17', 'YYYY-MM-DD'), 1800, SYSDATE);


INSERT INTO Accounts (AccountID, CustomerID, AccountType, Balance, LastModified)
VALUES (3, 3, 'Savings', 2000, SYSDATE);

INSERT INTO Accounts (AccountID, CustomerID, AccountType, Balance, LastModified)
VALUES (4, 4, 'Checking', 2500, SYSDATE);

INSERT INTO Accounts (AccountID, CustomerID, AccountType, Balance, LastModified)
VALUES (5, 5, 'Savings', 1800, SYSDATE);


INSERT INTO Transactions (TransactionID, AccountID, TransactionDate, Amount, TransactionType)
VALUES (3, 3, SYSDATE, 500, 'Deposit');

INSERT INTO Transactions (TransactionID, AccountID, TransactionDate, Amount, TransactionType)
VALUES (4, 4, SYSDATE, 700, 'Withdrawal');

INSERT INTO Transactions (TransactionID, AccountID, TransactionDate, Amount, TransactionType)
VALUES (5, 5, SYSDATE, 300, 'Deposit');



INSERT INTO Loans (LoanID, CustomerID, LoanAmount, InterestRate, StartDate, EndDate)
VALUES (2, 2, 10000, 6.5, SYSDATE, ADD_MONTHS(SYSDATE, 48));

INSERT INTO Loans (LoanID, CustomerID, LoanAmount, InterestRate, StartDate, EndDate)
VALUES (3, 3, 7500, 5.8, SYSDATE, ADD_MONTHS(SYSDATE, 36));


INSERT INTO Employees (EmployeeID, Name, Position, Salary, Department, HireDate)
VALUES (3, 'Clara Wilson', 'Analyst', 55000, 'Finance', TO_DATE('2019-09-01', 'YYYY-MM-DD'));

INSERT INTO Employees (EmployeeID, Name, Position, Salary, Department, HireDate)
VALUES (4, 'Henry Lee', 'SysAdmin', 62000, 'IT', TO_DATE('2016-02-11', 'YYYY-MM-DD'));

INSERT INTO Employees (EmployeeID, Name, Position, Salary, Department, HireDate)
VALUES (5, 'Sophia Martinez', 'Recruiter', 48000, 'HR', TO_DATE('2020-10-25', 'YYYY-MM-DD'));



SELECT * FROM ACCOUNTS;
SELECT * FROM CUSTOMERS;
SELECT * FROM EMPLOYEES;
SELECT * FROM LOANS;
SELECT * FROM TRANSACTIONS;



INSERT INTO Customers (CustomerID, Name, DOB, Balance, LastModified)
VALUES (10, 'Niranjan Sharma', TO_DATE('1950-08-10', 'YYYY-MM-DD'), 8000, SYSDATE);

INSERT INTO Loans (LoanID, CustomerID, LoanAmount, InterestRate, StartDate, EndDate)
VALUES (10, 10, 10000, 7.5, SYSDATE, ADD_MONTHS(SYSDATE, 24));

-- High balance customer
INSERT INTO Customers (CustomerID, Name, DOB, Balance, LastModified)
VALUES (11, 'High Roller', TO_DATE('1990-01-01', 'YYYY-MM-DD'), 15000, SYSDATE);


INSERT INTO Customers (CustomerID, Name, DOB, Balance, LastModified)
VALUES (12, 'Raj Kumar', TO_DATE('1980-10-15', 'YYYY-MM-DD'), 3000, SYSDATE);

INSERT INTO Loans (LoanID, CustomerID, LoanAmount, InterestRate, StartDate, EndDate)
VALUES (11, 12, 5000, 6.0, SYSDATE - 335, SYSDATE + 15);

INSERT INTO Customers (CustomerID, Name, DOB, Balance, LastModified)
VALUES (13, 'Yash Shelke', TO_DATE('1980-11-25', 'YYYY-MM-DD'), 3000, SYSDATE);

INSERT INTO Loans (LoanID, CustomerID, LoanAmount, InterestRate, StartDate, EndDate)
VALUES (12, 13, 5000, 6.0, SYSDATE - 335, SYSDATE + 15);

delete from customers where CustomerID = 12;
delete from loans where LoanID = 11;


UPDATE Loans
            SET InterestRate = InterestRate + 1
            WHERE CustomerID = 10;


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



ALTER table Customers ADD isVIP CHAR(1);

ALTER TABLE Customers MODIFY isVIP VARCHAR2(5);

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



CREATE OR REPLACE PROCEDURE UpdateEmployeeBonus (
    p_Department    IN VARCHAR2,
    p_BonusPercent  IN NUMBER
) AS
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

CREATE OR REPLACE PROCEDURE TransferFunds (
    p_SourceAccountID      IN NUMBER,
    p_DestinationAccountID IN NUMBER,
    p_Amount               IN NUMBER
) AS
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

select * from accounts;

EXEC TransferFunds(1, 2, 500);
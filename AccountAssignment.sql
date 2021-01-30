use WFHDotNet

CREATE TABLE CustOfBank (
		Cid varchar(20) not null PRIMARY KEY,
		CName varchar(30),
		DOB Date,
		City varchar(20)
)

CREATE TABLE AccountType (
		AccTypeCode int PRIMARY KEY,
		TypeDesc varchar(30)
)

CREATE TABLE BankAccount (
		Cid varchar(20),
		AccNo varchar(20) PRIMARY KEY,
		AccTypeCode int,
		DateOpened Date DEFAULT getDate(),
		Bal float,
		FOREIGN KEY (Cid) REFERENCES CustOfBank (Cid),  
		FOREIGN KEY (AccTypeCode) REFERENCES AccountType (AccTypeCode)  
)

SELECT * FROM CustOfBank
SELECT * FROM AccountType
SELECT * FROM BankAccount

INSERT INTO CustOfBank VALUES ('123456', 'David Letterman', '04-Apr-1949', 'Hartford')
INSERT INTO CustOfBank VALUES ('123457', 'Barry Sanders', '12-Dec-1967','Detroit')
INSERT INTO CustOfBank VALUES ('123458', 'Jean-Luc Picard', '9-Sep-1940', 'San Francisco')
INSERT INTO CustOfBank VALUES ('123459', 'Jerry Seinfeld', '23-Nov-1965','New York City')
INSERT INTO CustOfBank VALUES ('123460', 'Fox Mulder', '05-Nov-1962', 'Langley')
INSERT INTO CustOfBank VALUES ('123461', 'Bruce Springsteen', '29-Dec-1960','Camden')
INSERT INTO CustOfBank VALUES ('123462', 'Barry Sanders', '05-Aug-1974','Martha''s Vineyard')
INSERT INTO CustOfBank VALUES ('123463', 'Benjamin Sisko', '23-Nov-1955','San Francisco')
INSERT INTO CustOfBank VALUES ('123464', 'Barry Sanders', '19-Mar-1966','Langley')
INSERT INTO CustOfBank VALUES ('123465', 'Martha Vineyard', '19-Mar-1963','Martha''s Vineyard')

--Bank
INSERT INTO BankAccount VALUES ('123456', '123456-1', 1, '04-Apr-1993', 2200.33)
INSERT INTO BankAccount VALUES ('123456', '123456-2', 2, '04-Apr-1993', 12200.99)
INSERT INTO BankAccount VALUES ('123457', '123457-1', 3, '01-JAN-1998', 50000.00)
INSERT INTO BankAccount VALUES ('123458', '123458-1', 1, '19-FEB-1991', 9203.56)
INSERT INTO BankAccount VALUES ('123459', '123459-1', 1, '09-SEP-1990', 9999.99)
INSERT INTO BankAccount VALUES ('123459', '123459-2', 1, '12-MAR-1992', 5300.33)
INSERT INTO BankAccount VALUES ('123459', '123459-3', 2, '12-MAR-1992', 17900.42)
INSERT INTO BankAccount VALUES ('123459', '123459-4', 3, '09-SEP-1998', 500000.00)
INSERT INTO BankAccount VALUES ('123460', '123460-1', 1, '12-OCT-1997', 510.12)
INSERT INTO BankAccount VALUES ('123460', '123460-2', 2, '12-OCT-1997', 3412.33)
INSERT INTO BankAccount VALUES ('123461', '123461-1', 1, '09-MAY-1978', 1000.33)
INSERT INTO BankAccount VALUES ('123461', '123461-2', 2, '09-MAY-1978', 32890.33)
INSERT INTO BankAccount VALUES ('123461', '123461-3', 3, '13-JUN-1981', 51340.67)
INSERT INTO BankAccount VALUES ('123462', '123462-1', 1, '23-JUL-1981', 340.67)
INSERT INTO BankAccount VALUES ('123462', '123462-2', 2, '23-JUL-1981', 5340.67)
INSERT INTO BankAccount VALUES ('123463', '123463-1', 1, '1-MAY-1998', 513.90)
INSERT INTO BankAccount VALUES ('123463', '123463-2', 2, '1-MAY-1998', 1538.90)
INSERT INTO BankAccount VALUES ('123464', '123464-1', 1, '19-AUG-1994', 1533.47)
INSERT INTO BankAccount VALUES ('123464', '123464-2', 2, '19-AUG-1994', 8456.47)

--Account Type
INSERT INTO AccountType	VALUES (1, 'Checking')
INSERT INTO AccountType	VALUES (2, 'Saving')
INSERT INTO AccountType	VALUES (3, 'Money Market')
INSERT INTO AccountType	VALUES (4, 'Super Checking')

--1. Print Cid and balance of customers who have at least 5000 in accounts 
SELECT Cid, Bal FROM BankAccount
WHERE Bal > 5000

--2. Print names of customers whose names begin with a ‘B’
SELECT CName FROM CustOfBank
WHERE CName LIKE 'B%'

--3. Print all the cities where the customers of bank live
SELECT City FROM CustOfBank

--4. Use IN [and NOT IN] clauses to list customers who live in [and don’t live in] 
--San Francisco or Hartford.
SELECT CName FROM CustOfBank
WHERE City IN ('San Francisco', 'Hartford') 
SELECT CName FROM CustOfBank
WHERE City NOT IN ('San Francisco', 'Hartford') 

--5. Show name and city of customers whose names contain the letter 'r' and 
--who live in Langley. 
SELECT CName,City FROM CustOfBank
WHERE CName LIKE '%r%' AND City IN ('Langley')

--6. How many account types does the bank provide? 
SELECT COUNT(TypeDesc) AS TotalAccounts
FROM AccountType

--7. Show a list of accounts and their balance for account numbers that end in '-1' 
SELECT CName,City FROM CustOfBank
WHERE CName LIKE '%r%' AND City IN ('Langley')

--8. Show a list of accounts & their bal for accounts opened on or after July 1, 1990

--9. If all customers decided to withdraw their money, how much cash would bank need?

--10. List account number(s) and balance in accounts held by ‘David Letterman’
SELECT AccNo,Bal FROM BankAccount b1 INNER JOIN CustOfBank c1
ON b1.Cid=c1.Cid
WHERE c1.CName= 'David Letterman'

--11. List the name of customer who has the largest balance.
SELECT MAX(Bal) AS 'Highest Income'
FROM CustOfBank c1 INNER JOIN BankAccount b1
ON c1.Cid= b1.Cid

--12. List customers who have a ‘Money Market’ account
SELECT c1.CName AS CustomerName
FROM CustOfBank c1 JOIN BankAccount b1 
ON c1.Cid=b1.Cid
		JOIN AccountType a1 
		ON  b1.AccTypeCode=a1.AccTypeCode
		WHERE a1.TypeDesc='Money Market'

--13. List shows the city and the number of people who live in that city. 
SELECT City, COUNT(City) AS TotalPeople FROM CustOfBank GROUP BY City

--14. List shows custname, type of account they hold and balance in that account
SELECT c1.CName, a1.TypeDesc, b1.Bal FROM CustOfBank c1 
INNER JOIN BankAccount b1 ON  c1.Cid=b1.Cid
JOIN AccountType a1 ON  a1.AccTypeCode=b1.AccTypeCode

--15. List that shows the customer name and the number of accounts they hold
SELECT c1.CName, Count(b1.AccNo) As AccountHolder
FROM CustOfBank c1 JOIN BankAccount b1
ON c1.Cid=b1.Cid
GROUP BY CName

--16. List that shows an account type and average balance in accounts of that type
SELECT a1.TypeDesc, Avg(b1.Bal) AS AverageBalance
FROM BankAccount b1 JOIN AccountType a1
ON b1.AccTypeCode=a1.AccTypeCode
GROUP BY a1.TypeDesc





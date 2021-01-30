use WFHDotNet

CREATE TABLE CustomerDetails (
		Cid int not null PRIMARY KEY,
		CustName varchar(30),
		City varchar(20),
		CustSal float
)

SELECT * FROM CustomerDetails

INSERT INTO CustomerDetails VALUES (412345, 'David Letterman', 'Hartford', 2548.36)
INSERT INTO CustomerDetails VALUES (123457, 'Barry Sanders','Detroit',12548.36)
INSERT INTO CustomerDetails VALUES (51458, 'Jean-Luc Picard', 'San Francisco',4848.36)
INSERT INTO CustomerDetails VALUES (512345, 'Jerry Seinfeld', 'New York City',2575.25)
INSERT INTO CustomerDetails VALUES (41460, 'Fox Mulder', 'Langley',32548.36)
INSERT INTO CustomerDetails VALUES (123461, 'Bruce Springsteen', 'Camden',5548.36)
INSERT INTO CustomerDetails VALUES (123462, 'Barry Sanders','Martha''s Vineyard',1048.36)
INSERT INTO CustomerDetails VALUES (12463, 'Benjamin Sisko', 'San Francisco',5358)
INSERT INTO CustomerDetails VALUES (123464, 'Barry Sanders','Langley',53648.36)
INSERT INTO CustomerDetails VALUES (1235, 'Martha Vineyard','Martha''s Vineyard',9548.36)

--String Functions->Lower, Reverse, REPLICATE
SELECT LOWER(City) AS LowercaseCity FROM CustomerDetails
SELECT REVERSE(CustSal) FROM CustomerDetails
SELECT REPLICATE(CustName, 2) FROM CustomerDetails

--AGGREGATE Functions->Count, AVG, SUM, MIN, MAX
SELECT COUNT(CustName) as TotalCount FROM CustomerDetails
SELECT AVG(CustSal) as TotalSal FROM CustomerDetails WHERE CustSal>5000.36
SELECT SUM(CustSal) as TotalSum FROM CustomerDetails WHERE CustSal>5000.36
SELECT MIN(CustSal) as MinSal FROM CustomerDetails 

--Math Functions->Ceiling- round up, Floor- round up with smaller value as 25.36 -> 25.35
SELECT CEILING(CustSal) AS RoundOfSal FROM CustomerDetails
SELECT FLOOR(CustSal) AS SalaryIs FROM CustomerDetails
SELECT ROUND(CustSal, 2) AS RoundOfSal FROM CustomerDetails

/*ALTER TABLE CustomerDetails ADD CustBirth Date
UPDATE CustomerDetails SET CustBirth=25/2/2020 WHERE Cid=1
DELETE FROM CustomerDetails WHERE DOB=NULL*/

--Advanced Functions
SELECT ISNULL('Hello', CustName) FROM CustomerDetails
SELECT ISNUMERIC(Cid) FROM CustomerDetails --checks if yes thn 1 else 0
SELECT CURRENT_USER as DBName

use WFHDotNet
--1.Create Table
CREATE TABLE ProductDetail (
		ProductId int not null primary key identity (1,1),
		Descriptions varchar(30) not null UNIQUE,
		Setqty int not null
		CHECK (Setqty=1 OR SetQty=5 OR SetQty=10)
		DEFAULT 1,
		Rate decimal(10,2)
		CHECK (Rate >=51 AND Rate <= 5000)
)

--2.Insert 20 Records
INSERT INTO ProductDetail VALUES('Cadbury', 5,56.3)
INSERT INTO ProductDetail VALUES('White Choco', 1, 100.3)
INSERT INTO ProductDetail VALUES('Kit Kat', 5, 59.38)
INSERT INTO ProductDetail VALUES('Oreo', 10, 76.3)
INSERT INTO ProductDetail VALUES('Munch', 5, 576.3)
INSERT INTO ProductDetail VALUES('Perk', 5, 156.3)
INSERT INTO ProductDetail VALUES('Ferrero Rocher', 10, 596.3)
INSERT INTO ProductDetail VALUES('Milky Bar', 1, 556.35)
INSERT INTO ProductDetail VALUES('Barone', 10, 566.3)
INSERT INTO ProductDetail VALUES('Fivestar', 5, 456.43)
INSERT INTO ProductDetail VALUES('Polo', 5, 546.43)
INSERT INTO ProductDetail VALUES('Mars', 1, 156.34)
INSERT INTO ProductDetail VALUES('Parle', 5, 956.37)
INSERT INTO ProductDetail VALUES('Galaxy', 5, 956.37)
INSERT INTO ProductDetail VALUES('Gems', 1, 956.37)
INSERT INTO ProductDetail VALUES('Crunch', 1, 956.37)
INSERT INTO ProductDetail VALUES('Bounty', 10, 956.37)
INSERT INTO ProductDetail VALUES('White Choo', 5, 956.37)
INSERT INTO ProductDetail VALUES('Twix', 10, 956.37)
INSERT INTO ProductDetail VALUES('M&Ms', 10, 956.37)
INSERT INTO ProductDetail VALUES('Eclairs', 5, 956.37)

SELECT * FROM ProductDetail

--3.Update all the rates with 10% rate hike.
UPDATE ProductDetail SET Rate = Rate *1.1
FROM ProductDetail

--4.Delete last record by providing the ProductID.
DELETE FROM ProductDetail 
WHERE ProductId=20

--5.Alter the table and add the following column
ALTER TABLE ProductDetail ADD MarginCode char(1)
CHECK (MarginCode='A' OR MarginCode='B' OR MarginCode=NULL)

--6.Update few records to set MarginCode to A and some records MarginCode to B
UPDATE ProductDetail
SET MarginCode = 'A'
WHERE ProductId < 6

UPDATE ProductDetail
SET MarginCode = 'B'
WHERE ProductId > 12

--7.Update all the SetQty to 10 for all Items which have MarginCode A 
UPDATE ProductDetail
SET Setqty = 10
WHERE MarginCode = 'A' AND Setqty=1

INSERT INTO ProductDetail VALUES('Eclaiers', 5, 46.37,'C')
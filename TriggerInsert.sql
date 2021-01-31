use WFHDotNet

CREATE TABLE PastEmpData(
	EmpIdentity int Primary key,
	EmpName varchar(20),
	EmpSal float,
	EmpLeaving Date default getdate()
)
	
--Trigger for updating data	
ALTER TRIGGER TrgUpdate on Employees
AFTER UPDATE
AS
DECLARE
@EmpIdentity int,
@EmpName varchar(20),
@EmpSal float,
@EmpLeaving datetime

BEGIN
SELECT @EmpIdentity =Eid,
	   @EmpName=EmpName,
	   @EmpSal=Salary FROM inserted
	
INSERT INTO PastEmpData(EmpIdentity,EmpName,EmpSal)
				VALUES(@EmpIdentity, @EmpName,@EmpSal)
PRINT 'Using UPDATE in Trigger for PastEmpData' 
END
	
--To update values
UPDATE Employees SET Salary=2346.36, EmpName = 'Ekta' WHERE Eid=13
SELECT * FROM PastEmpData

SELECT * FROM Employees
INSERT INTO Employees VALUES('HARI', 1526.36, 13)
INSERT INTO Employees VALUES('NARESH', 55426.36, 11)
INSERT INTO Employees VALUES('NARESH', 4126.36, 10)
INSERT INTO Employees VALUES('NARESH', 43626.36, 13)

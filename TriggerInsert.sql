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

SELECT @EmpIdentity=inserted.Eid,
	   @EmpName=inserted.EmpName,
	   @EmpSal=inserted.Salary FROM inserted
	
INSERT INTO PastEmpData(EmpIdentity,EmpName,EmpSal,EmpLeaving)
				VALUES(@EmpIdentity, @EmpName,@EmpSal,@EmpLeaving)
PRINT 'Using UPDATE in Trigger for PastEmpData' 
	
--To update values
UPDATE Employees SET Salary=2346.36 WHERE Eid=1
	
SELECT * FROM Employees
SELECT * FROM PastEmpData

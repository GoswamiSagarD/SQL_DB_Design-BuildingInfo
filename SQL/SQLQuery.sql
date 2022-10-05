-- SQL QUERIES ---------------------------------------------------------------------------------

-- 1. List the phone number and department name and street address for each department. 
SELECT DeptPhone, DeptName, DeptAddStreet, DeptAddCity, DeptAddState, DeptAddZip FROM department;

-- 2. Count the number of rooms for each building.
SELECT Bldgname, COUNT(RoomNo) FROM room GROUP BY BldgName;

-- 3. Find the building name and the room number of each lab that is also used as office.
SELECT BldgName, RoomNo FROM room WHERE RoomLabFlag = 1 AND RoomConferenceFlag =1;

-- 4. Find the average temperature for each room.
SELECT BldgName, RoomNo, AVG(MeasTemperature) FROM measurement GROUP BY BldgName, RoomNo;

-- 5. Find the area of each conference room that hasn’t had any temperature recorded yet.----------------------------------------
SELECT R.BldgName, R.RoomNo, R.RoomArea, M.MeasTemperature FROM room r 
	LEFT JOIN measurement m ON r.bldgname = m.bldgname AND R.RoomNo = M.RoomNo
    WHERE m.measTemperature IS NULL;

-- 6. Find the id of each employee who has exactly two email addresses.
SELECT EmpID, COUNT(EmpEmail) NoOfEmailIDs FROM employeeemail GROUP BY EmpID HAVING NoOfEmailIDs = 2;
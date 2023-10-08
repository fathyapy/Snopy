-- 1
-- Create a view named 'DisplayStaffData' to display StaffName, StaffGender, StaffAddress, StaffSalary, and StaffPhoneNumber for every staff whose salary is between 7000000 and 10000000. (create view, between)
CREATE VIEW DisplayStaffData
AS 
SELECT StaffName, StaffGender, StaffAddress, StaffSalary, StaffPhoneNumber
FROM MsStaff
WHERE StaffSalary BETWEEN 7000000 and 10000000
GO

-- 2
-- Display StaffName, StaffEmail, StaffSalary, and StaffPhoneNumber for every staff who has handled transaction in August. (exists, month)
SELECT StaffName, StaffEmail, StaffSalary, StaffPhoneNumber
FROM  MsStaff ms
WHERE EXISTS (
	SELECT *
	FROM TrPurchaseHeader th
	WHERE MONTH(PurchaseDate) = 8 AND th.StaffID = ms.StaffID
)

-- 3
-- Display StaffID, StaffName, StaffAddress, and Transaction Count (obtained from the number of transactions) for every staff whose name consists of more than 2 words.
-- Then combine it with StaffID, StaffName, StaffAddress, and Transaction Count (obtained from the number of transactions) for every staff who was born in the third quarter of the year. (count, like, group by, union, datepart, quarter)
SELECT ms.StaffID, StaffName, StaffAddress, 'Transaction Count' = COUNT(PurchaseID)
FROM MsStaff ms
JOIN TrPurchaseHeader th ON th.StaffID = ms.StaffID
WHERE StaffName LIKE '% % %'
GROUP BY ms.StaffID, StaffName, StaffAddress
UNION 
SELECT  ms.StaffID, StaffName, StaffAddress, 'Transaction Count' = COUNT(PurchaseID)
FROM MsStaff ms
JOIN TrPurchaseHeader th ON th.StaffID = ms.StaffID
WHERE DATEPART(QUARTER,StaffDOB) = 3
GROUP BY ms.StaffID, StaffName, StaffAddress

-- 4 
-- Display PurchaseID, PurchaseDate, BranchName, Total Quantity (obtained from the total quantity of the products bought in the transaction) for every transaction which ID number is odd and occurred more than 15 months after 1st August 2021. (sum, join, right, datediff, month, group by)
SELECT td.PurchaseID, PurchaseDate, BranchName, 'Total Quantity' = SUM(Quantity)
FROM TrPurchaseDetail td
JOIN TrPurchaseHeader th ON th.PurchaseID = td.PurchaseID
JOIN MsBranch mb ON mb.BranchID = th.BranchID
WHERE RIGHT(td.PurchaseID,1) % 2 = 1 AND DATEDIFF (MONTH,PurchaseDate,'2021-08-01') > 15
GROUP BY td.PurchaseID, PurchaseDate, BranchName

-- 5
-- Display StaffID, StaffName, PurchaseID, PurchaseDate, ProductName, ProductPrice 
-- for every transaction which occurred on Wednesday and was handled by staff whose salary is more than the average of all staff salaries. (alias subquery, avg, datename, weekday)
SELECT  ms.StaffID, StaffName, td.PurchaseID, PurchaseDate, ProductName, ProductPrice
FROM MsStaff ms
JOIN TrPurchaseHeader th ON th.StaffID = ms.StaffID
JOIN TrPurchaseDetail td ON td.PurchaseID = th.PurchaseID
JOIN MsProduct mp ON mp.ProductID = td.ProductID,
(
	SELECT [AvgSalary]= AVG(StaffSalary)
	FROM MsStaff
) AS X
WHERE DATENAME(WEEKDAY,PurchaseDate) = 'Wednesday' AND StaffSalary > x.AvgSalary
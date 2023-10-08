CREATE DATABASE Snopy

GO
USE Snopy

GO
-- CREATE TABLE
CREATE TABLE MsStaff(
	StaffID CHAR(5) PRIMARY KEY,
	StaffName VARCHAR(100),
	StaffEmail VARCHAR(100),
	StaffGender VARCHAR(20),
	StaffAddress VARCHAR(100),
	StaffDOB DATE,
	StaffPhoneNumber VARCHAR(20),
	StaffSalary NUMERIC(18, 2)
)

CREATE TABLE MsCustomer(
	CustomerID CHAR(5) PRIMARY KEY,
	CustomerName VARCHAR(100),
	CustomerEmail VARCHAR(100),
	CustomerGender VARCHAR(20),
	CustomerAddress VARCHAR(100),
	CustomerDOB DATE,
	CustomerPhoneNumber VARCHAR(20)
)

CREATE TABLE MsBranch(
	BranchID CHAR(5) PRIMARY KEY,
	BranchName VARCHAR(100),
	BranchAddress VARCHAR(100)
)

CREATE TABLE MsProduct(
	ProductID CHAR(5) PRIMARY KEY,
	ProductName VARCHAR(100),
	ProductPrice NUMERIC(18,2)
)

CREATE TABLE TrPurchaseHeader(
	PurchaseID CHAR(5) PRIMARY KEY,
	BranchID CHAR(5) FOREIGN KEY REFERENCES MsBranch(BranchID) ON UPDATE CASCADE ON DELETE SET NULL,
	StaffID CHAR(5) FOREIGN KEY REFERENCES MsStaff(StaffID) ON UPDATE CASCADE ON DELETE SET NULL,
	CustomerID CHAR(5) FOREIGN KEY REFERENCES MsCustomer(CustomerID) ON UPDATE CASCADE ON DELETE SET NULL,
	PurchaseDate DATE
)

CREATE TABLE TrPurchaseDetail(
	PurchaseID CHAR(5) FOREIGN KEY REFERENCES TrPurchaseHeader(PurchaseID) ON UPDATE CASCADE ON DELETE SET NULL,
	ProductID CHAR(5) FOREIGN KEY REFERENCES MsProduct(ProductID) ON UPDATE CASCADE ON DELETE SET NULL,
	Quantity INT
)

GO
-- INSERT DATA
INSERT INTO MsStaff VALUES
('ST001', 'Jocelin Kerena', 'jocelin_kerena@mail.com', 'Female', 'Mango Street No.15', '1980-07-23', '08671371068', 7500000),
('ST002', 'Tony Darryl', 'tony_darryl@mail.com', 'Male', 'Strawberry Street No.19', '1981-03-24', '0868034795', 8000000),
('ST003', 'Alban Dezi Dani', 'alban_dezi@mail.com', 'Male', 'Orange Street No.123', '1983-11-03', '089158632081', 6500000),
('ST004', 'Elisabeth Winfield', 'elisabeth_winfield@mail.com', 'Female', 'Blueberry Street No.35', '1988-07-15', '081948137578', 9500000),
('ST005', 'Lambert Robby', 'lambert_robby@mail.com', 'Male', 'Watermelon Street No.117', '1985-01-11', '087529957582', 10000000),
('ST006', 'Tracie Georgia', 'tracie_georgia@mail.com', 'Female', 'Lemon Street No.75', '1998-08-25', '08158352423', 7000000),
('ST007', 'James Albert Ricko', 'james_albert@mail.com', 'Male', 'Banana Street No.21', '1993-11-30', '08744486285', 6500000),
('ST008', 'Bruno Jaiden', 'bruno_jaiden@mail.com', 'Male', 'Pineapple Street No.99', '1991-01-17', '087255701607', 5000000),
('ST009', 'Jane Lauraine', 'jane_lauraine@mail.com', 'Female', 'Melon Street No.19', '1997-06-14', '082237539265', 5500000),
('ST010', 'Roslyn Madison', 'roslyn_madison@mail.com', 'Female', 'Avocado Street No.37', '1999-12-06', '083652160985', 7000000)

INSERT INTO MsCustomer VALUES
('CU001', 'Kaira Ramsey', 'kaira_ramsey@mail.com', 'Female', 'Rambutan Street No.19', '1995-02-12', '08781597350'),
('CU002', 'Addilyn Campbell', 'addilyn_campbell@mail.com', 'Female', 'Durian Street No.81', '1991-07-14', '083390731530'),
('CU003', 'Joseph Reynard Mario', 'joseph_reynard@mail.com', 'Male', 'Grape Street No.221', '1983-12-02', '08238457161'),
('CU004', 'Lennon Roni', 'lennon_roni@mail.com', 'Male', 'Kiwi Street No.337', '2008-12-11', '08147875446'),
('CU005', 'Ellen Krystine', 'ellen_krystine@mail.com', 'Female', 'Cherry Street No.59', '1983-06-17', '08879377378'),
('CU006', 'Neil Frederick Tan', 'neil_frederick@mail.com', 'Male', 'Peach Street No.54', '1999-04-15', '08283806839'),
('CU007', 'Maverick Rodney', 'maverick_rodney@mail.com', 'Male', 'Lychee Street No.23', '1991-02-23', '088703105668'),
('CU008', 'Erick Dylan', 'erick_dylan@mail.com', 'Male', 'Pear Street No.76', '1998-11-18', '081303262759'),
('CU009', 'Lara Gracie', 'lara_gracie@mail.com', 'Female', 'Avocado Street No.70', '1992-02-26', '082471866801'),
('CU010', 'Cathleen Christabel', 'cathleen_christabel@mail.com', 'Female', 'Coconut Street No.55', '1994-12-02', '081378690341')

INSERT INTO MsBranch VALUES
('BR001', 'Snopy Mango', 'Mango Street No.71'),
('BR002', 'Snopy Rambutan', 'Rambutan Street No.115'),
('BR003', 'Snopy Strawberry', 'Strawberry Street No.97'),
('BR004', 'Snopy Durian', 'Durian Street No.88'),
('BR005', 'Snopy Kiwi', 'Kiwi Street No.8'),
('BR006', 'Snopy Lychee', 'Lychee Street No.99'),
('BR007', 'Snopy Avocado', 'Avocado Street No.87'),
('BR008', 'Snopy Lemon', 'Lemon Street No.67'),
('BR009', 'Snopy Banana', 'Banana Street No.65'),
('BR010', 'Snopy Pineapple', 'Pineapple Street No.33')

INSERT INTO MsProduct VALUES
('PR001', 'Pencil', 2500),
('PR002', 'Pen', 3500),
('PR003', 'Book', 5000),
('PR004', 'Eraser', 2000),
('PR005', 'Scissors', 10000),
('PR006', 'Sticky Notes', 15000),
('PR007', 'Calculator', 25000),
('PR008', 'Ruler', 12000),
('PR009', 'Stapler', 8500),
('PR010', 'Binder', 11500)

INSERT INTO TrPurchaseHeader VALUES
('PU001', 'BR005', 'ST003' , 'CU001', '2019-05-29'),
('PU002', 'BR006', 'ST002', 'CU009', '2019-10-25'),
('PU003', 'BR007', 'ST005', 'CU006', '2019-12-03'),
('PU004', 'BR009', 'ST001', 'CU007', '2019-12-28'),
('PU005', 'BR010', 'ST007', 'CU003', '2020-02-24'),
('PU006', 'BR001', 'ST009', 'CU002', '2020-03-30'),
('PU007', 'BR003', 'ST010', 'CU004', '2020-05-07'),
('PU008', 'BR002', 'ST005', 'CU005', '2020-06-10'),
('PU009', 'BR004', 'ST008', 'CU008', '2020-08-07'),
('PU010', 'BR001', 'ST003', 'CU010', '2020-08-22'),
('PU011', 'BR003', 'ST007', 'CU001', '2020-10-07'),
('PU012', 'BR005', 'ST006', 'CU003', '2020-11-04'),
('PU013', 'BR007', 'ST004', 'CU005', '2020-12-23'),
('PU014', 'BR002', 'ST002', 'CU006', '2021-04-08'),
('PU015', 'BR009', 'ST001', 'CU008', '2021-05-07')

INSERT INTO TrPurchaseDetail VALUES
('PU001', 'PR005', 9),
('PU001', 'PR008', 3),
('PU001', 'PR002', 5),
('PU002', 'PR003', 10),
('PU002', 'PR009', 9),
('PU003', 'PR001', 5),
('PU003', 'PR002', 9),
('PU004', 'PR002', 3),
('PU005', 'PR006', 25),
('PU006', 'PR007', 2),
('PU007', 'PR009', 5),
('PU008', 'PR006', 7),
('PU009', 'PR010', 17),
('PU010', 'PR008', 2),
('PU011', 'PR004', 5),
('PU012', 'PR002', 6),
('PU013', 'PR001', 7),
('PU013', 'PR010', 1),
('PU014', 'PR003', 1),
('PU015', 'PR006', 3)
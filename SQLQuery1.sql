
IF EXISTS (SELECT * FROM sys.databases WHERE Name='Example5')
DROP DATABASE Example5
GO
CREATE DATABASE Example5
GO
USE Example5
GO
--Tạo bảng Lớp học
CREATE TABLE LopHoc(
MaLopHoc INT PRIMARY KEY IDENTITY,
TenLopHoc VARCHAR(10)
)
GO
--Tạo bảng Sinh viên có khóa ngoại là cột MaLopHoc, nối với bảng 

CREATE TABLE SinhVien(
MaSV int PRIMARY KEY,
TenSV varchar(40),
MaLopHoc int,
CONSTRAINT fk FOREIGN KEY (MaLopHoc) REFERENCES LopHoc(MaLopHoc)
)
GO

GO
--Tạo bảng SanPham với một cột NULL, một cột NOT NULL
CREATE TABLE SanPham (
MaSP int NOT NULL,
TenSP varchar(40) NULL
);

insert into SanPham values(1, 'Cafe')

select * from SanPham

GO
--Tạo bảng với thuộc tính default cho cột Price
CREATE TABLE StoreProduct(
ProductID int NOT NULL,
Name varchar(40) NOT NULL,
Price money NOT NULL DEFAULT (100)
)
INSERT INTO StoreProduct (ProductID, Name, Price)
VALUES (1, 'Product A', 150.00);

INSERT INTO StoreProduct (ProductID, Name)
VALUES (2, 'Product B');

select * from StoreProduct
GO
--Tạo bảng ContactPhone với thuộc tính IDENTITY
CREATE TABLE ContactPhone (
Person_ID int IDENTITY(500,1) NOT NULL,
MobileNumber bigint NOT NULL
)
INSERT INTO ContactPhone ( MobileNumber)
VALUES ( 5);
INSERT INTO ContactPhone ( MobileNumber)
VALUES ( 56);
INSERT INTO ContactPhone ( MobileNumber)
VALUES ( NULL);
select * from ContactPhone
GO

GO
--Tạo cột nhận dạng duy nhất tổng thể
DROP TABLE CellularPhone
CREATE TABLE CellularPhone(
Person_ID uniqueidentifier DEFAULT NEWID() NOT NULL,
PersonName varchar(60) NOT NULL
)
--Chèn một record vào
INSERT INTO CellularPhone(PersonName) VALUES('William Smith')
GO
--Kiểm tra giá trị của cột Person_ID tự động sinh
SELECT * FROM CellularPhone 
GO
--Tạo bảng ContactPhone với cột MobileNumber có thuộc tính UNIQUE
DROP TABLE ContactPhone
CREATE TABLE ContactPhone (
Person_ID int PRIMARY KEY,
MobileNumber bigint UNIQUE,
ServiceProvider varchar(30),
LandlineNumber bigint UNIQUE
)
--Chèn 2 bản ghi có giá trị giống nhau ở cột MobileNumber và LanlineNumber để quan sát lỗi
INSERT INTO ContactPhone values (101, 983345674, 'Hutch', NULL)
INSERT INTO ContactPhone values (102, 983345675, 'Alex', 1)

DELETE FROM ContactPhone;

SELECT * FROM ContactPhone 
GO
GO
--Tạo bảng PhoneExpenses có một CHECT ở cột Amount
CREATE TABLE PhoneExpenses (
Expense_ID int PRIMARY KEY,
MobileNumber bigint FOREIGN KEY REFERENCES ContactPhone
(MobileNumber),
Amount bigint CHECK (Amount >0)
)
go
INSERT INTO PhoneExpenses values (102, 983345675, 'Alex', 1)

GO
--Chỉnh sửa cột trong bảng
ALTER TABLE ContactPhone 
ALTER COLUMN ServiceProvider varchar(50)
GO
--Xóa cột trong bảng
ALTER TABLE ContactPhone 
DROP COLUMN ServiceProvider 
GO
---Them một ràng buộc vào bảng
ALTER TABLE ContactPhone ADD CONSTRAINT CHK_RC CHECK(RentalCharges >0)
GO
--Xóa một ràng buộc
ALTER TABLE Person.ContactPhone 
DROP CONSTRAINT CHK_RC

create database shortExam
use shortExam

create table Products (
	ProductID int primary key,
	ProductName Nvarchar(50),
	Category NVARCHAR(50),
	[Description] NVARCHAR(50)
)

insert into Products values(1, N'Poca', N'Snack',N'Bim bim cho trẻ')
select * from Products

create table Customers (
	CustomerID int primary key,
	FirstName Nvarchar(50),
	LastName NVARCHAR(50),
	Email NVARCHAR(50),
	Phone NVARCHAR(50),
	Address NVARCHAR(50),
)
select * from Customers

insert into Customers values(1, N'Kieu', N'QuocAnh',N'kieuquocanh4@gmail.com', N'0961056732',N'HaNoi')

create table Orders (	
	OrderID int primary key,
	CustomerID int,
	OrderDate date,
	TotalAmount int,
	Status NVARCHAR(50)
	CONSTRAINT FK_Orders_Customers FOREIGN KEY (CustomerID) REFERENCES Customers(CustomerID)
)
insert into Orders values(1, 1, '2023-08-10', 2, N'pending')



select * from Orders
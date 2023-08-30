IF EXISTS (SELECT * FROM sys.databases WHERE Name LIKE 'Example5')
    DROP DATABASE Example5;

CREATE DATABASE Example5;

USE Example5;

-- Tao bang lop hoc
DROP TABLE LopHoc;
CREATE TABLE LopHoc (
    MaLopHoc INT PRIMARY KEY,
    TenLopHoc VARCHAR(10)
);

SELECT * FROM LopHoc;

INSERT INTO LopHoc (TenLopHoc) VALUES ('T2079M');
SELECT * FROM Lophoc;

UPDATE LopHoc SET TenLopHoc = 'T2099M'
WHERE MaLopHoc = 1;
GO
SELECT * FROM LopHoc;
GO
DELETE FROM LopHoc WHERE MaLopHoc = 1002;

-- SanPham(masp, tensp, Gia, type)
-- Create a Student table with a MaLapHoc column in the Department of Surgery, connecting to the Lophoc table
-- Composite primary key

DROP TABLE SinhVien;
CREATE TABLE SinhVien (
    MaSV INT PRIMARY KEY,
    TenSV NVARCHAR(250),
    ClassCode INT,
   -- CONSTRAINT fk_Lophoc FOREIGN KEY (ClassCode) REFERENCES LopHoc(MaLopHoc)
);

INSERT INTO SinhVien (MaSV, TenSV, ClassCode) VALUES (1, 'Minh', 1);
INSERT INTO SinhVien (MaSV, TenSV, ClassCode) VALUES (3, 'Hoa', 2);
INSERT INTO SinhVien (MaSV, TenSV, ClassCode) VALUES (14, 'Minh', 2), (16, 'Linh', 1);

SELECT * FROM SinhVien;
SELECT * FROM LopHoc;


-- Tạo bảng Lophoc với ràng buộc UNIQUE cho cột TenLopHoc
DROP TABLE Lophoc;
CREATE TABLE Lophoc (
    MaLopHoc INT PRIMARY KEY IDENTITY,
    TenLopHoc NVARCHAR(50) NOT NULL UNIQUE
);

-- Tạo bảng SinhVien với ràng buộc FOREIGN KEY và cột MaSV có thuộc tính IDENTITY
DROP TABLE SinhVien;
CREATE TABLE SinhVien (
    MaSV INT PRIMARY KEY IDENTITY,
    TenSV NVARCHAR(50) NOT NULL,
    MaLopHoc INT,
    CONSTRAINT FK_LopHoc FOREIGN KEY (MaLopHoc) REFERENCES Lophoc(MaLopHoc)
);

-- Thêm dữ liệu vào bảng Lophoc
INSERT INTO Lophoc (TenLopHoc) VALUES (N'Lop A');
INSERT INTO Lophoc (TenLopHoc) VALUES (N'Lop B');
INSERT INTO Lophoc (TenLopHoc) VALUES (N'Lop C');

-- Thêm dữ liệu vào bảng SinhVien và tham chiếu đến các lớp học đã thêm ở bảng Lophoc
INSERT INTO SinhVien (TenSV, MaLopHoc) VALUES ('Sinh Vien 1', 1);
INSERT INTO SinhVien (TenSV, MaLopHoc) VALUES ('Sinh Vien 2', 2);
INSERT INTO SinhVien (TenSV, MaLopHoc) VALUES ('Sinh Vien 3', 2);

select * from Lophoc
select * from SinhVien
Go
CREATE TABLE Employees (
    EmployeeID INT PRIMARY KEY,
    FirstName NVARCHAR(50),
    LastName NVARCHAR(50),
    Age INT CHECK (Age >= 18 AND Age <= 65)
);

INSERT INTO Employees
VALUES (1, 'John', 'Doe', 25);

INSERT INTO Employees 
VALUES (2, 'Jane', 'Smith', 17); -- This will result in a constraint violation

INSERT INTO Employees (EmployeeID, FirstName, LastName, Age)
VALUES (3, 'Michael', 'Johnson', 70); -- This will also result in a constraint violation

GO
select * from Employees
GO

use master
Drop database Example5

go
--------------------------------------

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
CREATE TABLE ContactPhone (
Person_ID int PRIMARY KEY,
MobileNumber bigint UNIQUE,
ServiceProvider varchar(30),
LandlineNumber bigint UNIQUE
)
--Chèn 2 bản ghi có giá trị giống nhau ở cột MobileNumber và 
LanlieNumber để quan sát lỗi
INSERT INTO ContactPhone values (101, 983345674, 'Hutch', NULL)
INSERT INTO ContactPhone values (102, 983345674, 'Alex', NULL)
GO	
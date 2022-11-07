-- Tao bang
CREATE TABLE Categories(
    CateID CHAR(6) PRIMARY KEY,
    CateName NVARCHAR(100) not null,
    Description NVARCHAR(200)
);

CREATE TABLE Parts(
    PartID int PRIMARY KEY IDENTITY(1,1),
    PartName NVARCHAR(100) not null,
    CateID char(6) FOREIGN KEY REFERENCES Categories(CateId),
    Description NVARCHAR(1000),
    Price DECIMAL(12,4) not null DEFAULT 0,
    Quantity int DEFAULT 0,
    Warranty int DEFAULT 1,
    Photo NVARCHAR(200) DEFAULT 'photo/nophoto.png'
);

-- Nhap 3 du lieu
INSERT into Categories(CateID, CateName, Description)
 VALUES (123456,'RAM','Random Access Memory'),
 (234567,'CPU','Central Processing Unit'),
 (345678,'SSD','Soid State Drive');

INSERT into Parts(PartName, CateID, Description, Price, Quantity, Warranty,Photo)
    VALUEs(N'Ram Desktop Kingston Fury Beast RGB',123456,N'Dung lượng: 32GB,Bus: 5600MHz',99,100,2,'photo/ram1.png'),
    (N'Ram Desktop Corsair DOMINATOR PLATINUM RGB White Heatspreader',123456,N'Dung lượng: 32GB,Bus: 5600MHz,Series: Dominator RGB',199,10,5,'photo/ram2.png'),
    (N'CPU Intel Core i9-12900K',234567,N'Số nhân: 8 nhân P-Cores (3.2-5.1Ghz) và 8 nhân E-Cores (2.4-3.9Ghz)',499,5,3,'photo/cpu1.png'),
    (N'CPU AMD Ryzen 9 5950X',234567,N'Xung nhịp CPU: 3.4 - 4.9Ghz (Boost Clock)',299,150,2,'photo/cpu2.png'),
    (N'Ổ cứng SSD Samsung 870 EVO 1TB SATA III 2.5 inch',345678,N'Tốc độ đọc: 560Mb/s,Tốc độ ghi: 530Mb/s',59,100,5,'photo/ssd1.png'),
    (N'Ổ cứng SSD Kingston A400 480GB 2.5 inch SATA3',345678,N'Tốc độ đọc tối đa: 500 MB/s,Tốc độ ghi tối đa: 450 MB/s',29,50,2,'photo/ssd2.png')

SELECT * from Categories;
SELECT * from Parts;

-- List all parts in the store with price > 100$

select * from Parts where Price>100;

-- List all parts of the category ‘CPU’

select * from Parts where CateID in (select CateID from Categories where CateName like 'CPU');

-- Create a view v_Parts contains the following information (PartID, PartName, CateName,Price, Quantity) from table Parts and Categories.

CREATE VIEW v_Parts AS
select a.PartID,a.PartName,b.CateName,a.Price,a.Quantity from Parts a 
left join Categories b on a.CateID = b.CateID;

select * from v_Parts;

-- Create a view v_TopParts about 5 parts with the most expensive price


create view v_TopParts as
select top 5 PartName from Parts order by Price desc;

select * from v_TopParts;

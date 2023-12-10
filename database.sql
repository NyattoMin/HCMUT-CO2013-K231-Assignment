
CREATE DATABASE bookstore;	


USE bookstore;

CREATE TABLE NhaXuatBan(
	NhaXuatBanID varchar(50) primary key,
	NhaXuatBanName varchar(50) NOT NULL,
	NhaXuatBanAddress varchar(50),
	NhaXuatBanPhone varchar(50)
);

CREATE TABLE Book(
	 BookID varchar(50),
	BookTitle varchar(200),
    ISBN varchar(20),
    Price double(12,2),
    Author varchar(128),
    Type varchar(128),
    Image varchar(128),
    PRIMARY KEY (BookID)

);

CREATE TABLE Category(
	CategoryID varchar(50) primary key,
	CategoryName varchar(50) NOT NULL
);



CREATE TABLE NhanVien(
	NhanVienID varchar(50) primary key,
	NhanVienName varchar(50) NOT NULL,
	NhanVienContactNumber varchar(50),
	NhanVienPosition varchar(50)
);


CREATE TABLE  DatHangTbl (
	 DatHangID varchar(50) primary key,
	 DatHangDate date,
	NhaXuatBanID varchar(50) ,
	NhanVienID varchar(50),
	 DatHangTotal int,
     Foreign Key(NhaXuatBanID) References NhaXuatBan(NhaXuatBanID) ON DELETE CASCADE ON UPDATE CASCADE,
	Foreign Key(NhanVienID) References NhanVien(NhanVienID) ON DELETE CASCADE ON UPDATE CASCADE
     
);

CREATE TABLE  DatHangDetail(
	 DatHangDetailID varchar(50) primary key,
	 DatHangID varchar(50),
	BookID varchar(50) ,
	 DatHangQuantity int,
	SubTotalDatHang int,
     Foreign Key(DatHangID) References  DatHangTbl(DatHangID) ON DELETE CASCADE ON UPDATE CASCADE,
     Foreign Key(BookID) References Book(BookID) ON DELETE CASCADE ON UPDATE CASCADE
);

CREATE TABLE HoaDon(
	HoaDonID varchar(50) primary key,
	HoaDonDate date,
	NhaXuatBanID varchar(50) ,
	DatHangID varchar(50) ,
	TotalHoaDon int,
    Foreign Key(NhaXuatBanID) References NhaXuatBan(NhaXuatBanID) ON DELETE CASCADE ON UPDATE CASCADE,
     Foreign Key(DatHangID) References  DatHangTbl(DatHangID) ON DELETE CASCADE ON UPDATE CASCADE
);
CREATE TABLE Users(
    UserID int not null AUTO_INCREMENT,
    UserName varchar(128),
    Password varchar(16),
    PRIMARY KEY (UserID)
);



CREATE TABLE ThanhVien(
	ThanhVienID int not null AUTO_INCREMENT primary key,
	ThanhVienName varchar(50) ,
	ThanhVienGender varchar(50),
	ThanhVienEmail varchar(200),
	ThanhVienAddress varchar(50),
	ThanhVienPhone varchar(50),
    UserID int,
    CONSTRAINT FOREIGN KEY (UserID) REFERENCES Users(UserID) ON DELETE SET NULL ON UPDATE CASCADE
);

CREATE TABLE GioHang(
	GioHangID int not null AUTO_INCREMENT,
	ThanhVienID int ,
    BookID varchar(50),
    Price double(12,2),
    Quantity int,
    TotalPrice double(12,2),
    PRIMARY KEY (GioHangID),
	CONSTRAINT FOREIGN KEY (BookID) REFERENCES Book(BookID) ON DELETE SET NULL ON UPDATE CASCADE,
	
    CONSTRAINT FOREIGN KEY (ThanhVienID) REFERENCES ThanhVien(ThanhVienID) ON DELETE SET NULL ON UPDATE CASCADE
);




CREATE TABLE BienLai(
	BienLaiID int not null AUTO_INCREMENT primary key,
	GioHangID int ,
	ThanhVienID int,
	BookID varchar(50),
	ThanhToanDate Date,
	StatusThanhToan varchar(50) ,
	TotalThanhToan int,
	Quantity int,
    Foreign Key(GioHangID) References GioHang(GioHangID),
	Foreign Key(ThanhVienID) References ThanhVien(ThanhVienID),
	Foreign Key(BookID) References Book(BookID)
);

CREATE TABLE Feedback(
	FeedbackID varchar(50) primary key,
	FeedbackComment varchar(50),
	Rating int,
	BookID varchar(50) ,
	ThanhVienID varchar(50) 
    
);

INSERT INTO `book`(`BookID`, `BookTitle`, `ISBN`, `Price`, `Author`, `Type`, `Image`) VALUES ('B-001','Lonely Planet Australia (Travel Guide)','123-456-789-1',136,'Lonely Planet','Travel','image/travel.jpg');
INSERT INTO `book`(`BookID`, `BookTitle`, `ISBN`, `Price`, `Author`, `Type`, `Image`) VALUES ('B-002','Crew Resource Management, Second Edition','123-456-789-2',599,'Barbara Kanki','Technical','image/technical.jpg');
INSERT INTO `book`(`BookID`, `BookTitle`, `ISBN`, `Price`, `Author`, `Type`, `Image`) VALUES ('B-003','CCNA Routing and Switching 200-125 Official Cert Guide Library','123-456-789-3',329,'Cisco Press ','Technology','image/technology.jpg');
INSERT INTO `book`(`BookID`, `BookTitle`, `ISBN`, `Price`, `Author`, `Type`, `Image`) VALUES ('B-004','Easy Vegetarian Slow Cooker Cookbook','123-456-789-4',75.9,'Rockridge Press','Food','image/food.jpg');
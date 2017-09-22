CREATE PROCEDURE dbo.Library_Drill_dbCreate

AS

CREATE DATABASE Library_Drill;

CREATE TABLE PUBLISHER (
	Name VarChar(50) PRIMARY KEY NOT NULL,
	Address VarChar(50),
	Phone VarChar(20)
);

INSERT PUBLISHER
	(Name,Address,Phone)
VALUES
	('Berkley Books','555 Book Drive, Berkley, CA','555-867-5309'),
	('Grand Central Publishing','434 Union Ave, New York, NY','822-111-1000'),
	('Ballantine Books','51140 8th Ave West, Hartford, CT','240-555-8291'),
	('Back Bay Books','8122 Jackson Street, Boston, MA','555-915-8259'),
	('Anchor Books','3201 Ocean Avenue, San Diego, CA', '716-313-8799'),
	('Griffin Press','218 Gryffindor Way, London, DE', '217-676-3478'),
	('Vintage Books','515 Dusty Lane, San Antonio, TX', '468-988-5433'),
	('Riverhead Books', '9365 Salmon Street, Astoria, OR', '541-888-3254'),
	('Penguin Books', '85 Iceberg Way, Gnome, AK', '122-333-4444'),
	('Harper', '1221 Bazaar Way, San Francisco, CA', '747-314-2587'),
	('St Martins Griffin', '219 Gryffindor Way, London, DE', '217-676-3444')
;

CREATE TABLE BOOK (
	BookId INT PRIMARY KEY NOT NULL IDENTITY(100,1),
	Title VarChar(50),
	PublisherName VarChar(50)
CONSTRAINT fk_PublisherName
	FOREIGN KEY (PublisherName)
	REFERENCES PUBLISHER(NAME)
ON DELETE CASCADE
ON UPDATE CASCADE
);

INSERT BOOK
	(Title, PublisherName)
VALUES
	('The Lost Tribe', 'Penguin Books'),
	('The Wizards Daughter', 'Berkley Books'),
	('Festive in Death', 'Berkley Books'),
	('Witness in Death', 'Berkley Books'),
	('Visions in Death', 'Berkley Books'),
	('The 6th Target', 'Grand Central Publishing'),
	('The Murder of Roger Ackroyd', 'Berkley Books'),
	('Going to Bend', 'Ballantine Books'),
	('Cleopatra', 'Back Bay Books'),
	('The Handmaids Tale', 'Anchor Books'),
	('Life of Pi', 'Griffin Press'),
	('The Girl With the Dragon Tattoo', 'Vintage Books'),
	('The Devil in the White City', 'Vintage Books'),
	('The Kite Runner', 'Riverhead Books'),
	('Memoirs of a Geisha', 'Vintage Books'),
	('The Dressmaker', 'Penguin Books'),
	('The Selfish Gene', 'Grand Central Publishing'),
	('Chocolat', 'Penguin Books'),
	('The Art of Racing in the Rain', 'Harper'),
	('Testimony', 'Back Bay Books'),
	('Sarahs Key', 'St Martins Griffin'),
	('The Stand', 'Anchor Books')
;
/*
CREATE TABLE BOOK_AUTHORS (
	AuthorsId INT PRIMARY KEY NOT NULL IDENTITY(10,1),
	AuthorName VarChar(50),
	BookID INT
CONSTRAINT fk_BookID
	FOREIGN KEY (BookID)
	REFERENCES BOOK(BookID)
ON DELETE CASCADE
ON UPDATE CASCADE
);

ALTER TABLE BOOK_AUTHORS
DROP CONSTRAINT FK__BOOK_AUTH__BookI__1273C1CD;

ALTER TABLE BOOK_Authors 
DROP COLUMN BookId
;
*/

SELECT * FROM BOOK;

CREATE TABLE BOOK_AUTHORS (
	AuthorsId INT PRIMARY KEY NOT NULL IDENTITY(10,1),
	AuthorName VarChar(50),
	BookID INT
CONSTRAINT fk_BookID
	FOREIGN KEY (BookID)
	REFERENCES BOOK(BookID)
ON DELETE CASCADE
ON UPDATE CASCADE
);

INSERT BOOK_AUTHORS
	(AuthorName, BookID)
VALUES
	('Lee, Mark', 100),
	('Michaels, Barbara', 101),
	('Robb, JD', 102),
	('Robb, JD', 103),
	('Robb, JD', 104),
	('Patterson, James', 105),
	('Christie, Agatha', 106),
	('Hammond, Diane', 107),
	('Schiff, Stacy', 108),
	('Atwood, Margaret', 109),
	('Martel, Yann', 110),
	('Larsson, Stieg', 111),
	('Larson, Erik', 112),
	('Hosseini, Khaled', 113),
	('Golden, Arthur', 114),
	('Ham, Rosalie', 115),
	('Dawkins, Richard', 116),
	('Harris, Joanne', 117),
	('Stein, Garth', 118),
	('Shreve, Anita', 119),
	('De Rosnay, Tatiana', 120),
	('King, Stephen', 121)
;

SELECT * FROM BOOK;

CREATE TABLE LIBRARY_BRANCH (
	BranchID INT PRIMARY KEY NOT NULL IDENTITY(1,1),
	BranchName VarChar(50),
	Address VarChar(50)
);

INSERT LIBRARY_BRANCH 
	(BranchName,Address)
VALUES
	('Sharpstown','123 Book Way, Portland, OR'),
	('Central', '4148 Libre Road, Salem, OR'),
	('Ledding', '325 3rd Ave, Milwaukie, OR'),
	('Bayside', '9832 Siletz Bay Drive, Lincoln City, OR')
;

CREATE TABLE BOOK_COPIES (
	CopiesID INT PRIMARY KEY NOT NULL IDENTITY(1,1),
	BookID INT 
		CONSTRAINT fk_BookID_COPIES
			FOREIGN KEY (BookID)
			REFERENCES BOOK(BookID)
		ON DELETE CASCADE
		ON UPDATE CASCADE,
	BranchID INT
		CONSTRAINT fk_BranchID
			FOREIGN KEY (BranchID)
			REFERENCES LIBRARY_BRANCH(BranchID)
		ON DELETE CASCADE
		ON UPDATE CASCADE,
	No_Of_Copies INT
);

INSERT BOOK_COPIES
	(BookID,BranchID,No_Of_Copies)
VALUES
	(100,1,2),
	(101,1,8),
	(102,1,7),
	(103,1,7),
	(104,1,10),
	(105,1,10),
	(106,1,15),
	(107,1,5),
	(108,1,5),
	(109,1,5),
	(110,1,3),
	(111,1,3),
	(112,1,7),
	(113,1,7),
	(114,1,7),
	(115,1,8),
	(116,1,8),
	(117,1,8),
	(118,1,2),
	(119,1,2),
	(120,1,2),
	(121,1,11),
	(100,2,8),
	(101,2,7),
	(102,2,7),
	(103,2,10),
	(104,2,10),
	(105,2,15),
	(106,2,5),
	(107,2,5),
	(108,2,5),
	(109,2,3),
	(110,2,3),
	(111,2,7),
	(112,2,7),
	(113,2,7),
	(114,2,8),
	(115,2,8),
	(116,2,8),
	(117,2,2),
	(118,2,2),
	(119,2,2),
	(120,2,11),
	(121,2,16),
	(100,3,9),
	(101,3,2),
	(102,3,11),
	(103,3,3),
	(104,3,4),
	(105,3,4),
	(106,3,7),
	(107,3,7),
	(108,3,5),
	(109,3,2),
	(110,3,2),
	(111,3,2),
	(112,3,11),
	(113,3,11),
	(114,3,4),
	(115,3,7),
	(116,3,7),
	(117,3,2),
	(118,3,2),
	(119,3,5),
	(120,3,5),
	(121,3,8),
	(100,4,11),
	(101,4,6),
	(102,4,6),
	(103,4,2),
	(104,4,4),
	(105,4,3),
	(106,4,3),
	(107,4,5),
	(108,4,7),
	(109,4,9),
	(110,4,8),
	(111,4,6),
	(112,4,4),
	(113,4,2),
	(114,4,3),
	(115,4,5),
	(116,4,7),
	(117,4,9),
	(118,4,8),
	(119,4,7),
	(120,4,6),
	(121,4,5)
;	

CREATE TABLE BORROWER (
	CardNo INT PRIMARY KEY NOT NULL IDENTITY(1001,10),
	Name VarChar(50),
	Address VarChar(50),
	Phone VarChar(20)
);

INSERT BORROWER
(Name, Address, Phone)
VALUES
('Amy Smith', '5788 1st Street, Portland, OR', '503-424-8719'),
('Justin Timber', '712 Apple Road, Unit 33, Portland, OR', '503-878-5555'),
('Jessica Jones', '717 Marvel Avenue, Portland, OR','777-222-7777'),
('Bob Johnson', '1999 Sunday Drive, Salem, OR', '971-633-9099'),
('Susan Granger', '514 Apartment Way, Unit 721, Salem, OR', '541-878-5555'),
('Barbara Medina', '8120 45th Street, Milwaukie, OR', '503-211-9876'),
('Dean Hawk', '7140 Cheshire Ave, Milwaukie, OR', '503-640-5536'),
('Robyn McAllister', '8112 Ocean Avenue, Lincoln City, OR', '541-876-7585'),
('Adam West', '4390 Sandy Lane, Lincoln City, OR', '541-876-2133'),
('John Adams', '112 Sandy Cove Lane, Lincoln City, OR', '541-876-2133')
;

CREATE TABLE BOOK_LOANS (
	LoansID INT PRIMARY KEY NOT NULL IDENTITY(1,1),
	BookID INT
		CONSTRAINT fk_BookID_Loans
			FOREIGN KEY (BookID)
			REFERENCES BOOK(BookID)
		ON DELETE CASCADE
		ON UPDATE CASCADE,
	BranchID INT
		CONSTRAINT fk_BranchID_Loans
			FOREIGN KEY (BranchID)
			REFERENCES LIBRARY_BRANCH(BranchID)
		ON DELETE CASCADE
		ON UPDATE CASCADE,
	CardNo INT
	CONSTRAINT fk_CardNo_Loans
			FOREIGN KEY (CardNo)
			REFERENCES BORROWER(CardNo)
		ON DELETE CASCADE
		ON UPDATE CASCADE,
	DateOut DATE,
	DueDate DATE
);

INSERT BOOK_LOANS
(BookID, BranchID, CardNo, DateOut, DueDate)
VALUES
(100,1,1001,'2017-08-22','2017-09-22'),
(121,1,1001,'2017-08-22','2017-09-22'),
(102,1,1001,'2017-08-22','2017-09-22'),
(116,1,1001,'2017-09-01','2017-10-01'),
(118,1,1001,'2017-09-01','2017-10-01'),
(101,1,1001,'2017-09-01','2017-10-01'),
(103,1,1001,'2017-09-01','2017-10-01'),
(104,1,1001,'2017-09-01','2017-10-01'),
(121,1,1011,'2017-09-03','2017-10-03'),
(111,1,1011,'2017-09-03','2017-10-03'),
(103,1,1011,'2017-09-03','2017-10-03'),
(105,1,1011,'2017-09-03','2017-10-03'),
(113,1,1011,'2017-09-03','2017-10-03'),
(119,1,1011,'2017-09-03','2017-10-03'),
(117,1,1021,'2017-07-22','2017-08-22'),
(120,1,1021,'2017-07-22','2017-08-22'),
(102,2,1031,'2017-09-03','2017-10-03'),
(105,2,1031,'2017-09-03','2017-10-03'),
(114,2,1031,'2017-08-30','2017-09-30'),
(117,2,1031,'2017-08-30','2017-09-30'),
(108,2,1031,'2017-09-03','2017-10-03'),
(110,2,1031,'2017-09-03','2017-10-03'),
(116,2,1031,'2017-08-30','2017-09-30'),
(118,2,1031,'2017-08-30','2017-09-30'),
(104,2,1041,'2017-08-23','2017-09-23'),
(102,2,1041,'2017-08-23','2017-09-23'),
(106,2,1041,'2017-08-23','2017-09-23'),
(108,2,1041,'2017-08-23','2017-09-23'),
(110,2,1041,'2017-08-23','2017-09-23'),
(100,2,1041,'2017-08-23','2017-09-23'),
(101,2,1041,'2017-08-23','2017-09-23'),
(103,2,1041,'2017-08-23','2017-09-23'),
(108,2,1041,'2017-09-05','2017-10-05'),
(110,2,1041,'2017-09-05','2017-10-05'),
(111,2,1041,'2017-09-05','2017-10-05'),
(112,3,1051,'2017-08-25','2017-09-25'),
(110,3,1061,'2017-09-21','2017-10-21'),
(114,3,1061,'2017-09-21','2017-10-21'),
(108,3,1061,'2017-09-21','2017-10-21'),
(113,3,1061,'2017-09-21','2017-10-21'),
(104,4,1081,'2017-09-21','2017-10-21'),
(106,4,1081,'2017-09-21','2017-10-21'),
(107,4,1081,'2017-09-21','2017-10-21'),
(110,4,1081,'2017-09-21','2017-10-21'),
(112,4,1091,'2017-09-21','2017-10-21'),
(114,4,1091,'2017-09-21','2017-10-21'),
(109,4,1091,'2017-09-28','2017-10-28'),
(102,4,1091,'2017-09-28','2017-10-28'),
(120,4,1091,'2017-09-28','2017-10-28'),
(119,4,1091,'2017-09-28','2017-10-28'),
(107,4,1091,'2017-09-28','2017-10-28'),
(117,4,1091,'2017-09-28','2017-10-28')
;

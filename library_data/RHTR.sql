CREATE TABLE Authors (
 AuthorID INTEGER PRIMARY KEY,
 AuthorName VARCHAR(255) NOT NULL,
 CountryOfOrigin VARCHAR(255) NOT NULL,
 NumberOfBookWritten INTEGER NOT NULL
 );


 CREATE TABLE Books (
    BookID INTEGER PRIMARY KEY,
    Title VARCHAR(255) NOT NULL,
    AuthorID INTEGER REFERENCES Authors(AuthorID),
    Genre VARCHAR(255) NOT NULL,
    DateOfPublication DATE NOT NULL,
    Publisher VARCHAR(255) NOT NULL,
    ISBN VARCHAR(255) NOT NULL,
    Language VARCHAR(255) NOT NULL,
    AvailableCopies INTEGER NOT NULL,
    AgeRating VARCHAR NOT NULL
 );

CREATE TABLE Borrow_History (
   BorrowHistoryID INTEGER PRIMARY KEY,
   BookID INTEGER REFERENCES Books(BookID),
   MemberID INTEGER REFERENCES Members(MemberID),
   BorrowDate DATE NOT NULL,
   ReturnDate DATE NOT NULL
);

CREATE TYPE memb_stat AS ENUM ('Active', 'Suspended');
CREATE TYPE gender_ty AS ENUM ('Male','Female');
CREATE TABLE Members (
   MemberID INTEGER PRIMARY KEY,
   Name VARCHAR(255) NOT NULL,
   Gender gender_ty NOT NULL,
   EmailAddress  VARCHAR NOT NULL,
   PhoneNumber INTEGER NOT NULL,
   Address VARCHAR NOT NULL,
   Age INTEGER NOT NULL,
   TypeOfMembership VARCHAR NOT NULL,
   DateOfMembership DATE NOT NULL,
   Status memb_stat NOT NULL,
)

CREATE TABLE Departments (
   DeptID INTEGER PRIMARY KEY,
   NameOfTheDepartment VARCHAR(255) NOT NULL,
   NameOfManager VARCHAR NOT NULL
):

CREATE TYPE fulfmnt_stat  AS ENUM ('Fulfilled','Pending', 'Processing');
CREATE TABLE Book_Orders (
   OrderID INTEGER PRIMARY KEY,
   OrderDate DATE NOT NULL,
   BookID INTEGER REFERENCES Books(BookID),
   Cost DECIMAL NOT NULL,
   Quantity INTEGER NOT NULL,
   SupplyDate DATE NOT NULL,
   FulfillmentStatus fulfmnt_stat NOT NULL,
   NameOfSupplier VARCHAR(255) NOT NULL
);

CREATE TABLE Library_staff (
   StaffID INTEGER PRIMARY KEY,
   Name VARCHAR(255) NOT NULL,
   JobTitle VARCHAR(255) NOT NULL,
   DeptID INTEGER REFERENCES Departments(DeptID),
   Gender gender_ty NOT NULL,
   Address VARCHAR NOT NULL,
   PhoneNumber INTEGER NOT NULL,
   HireDate DATE NOT NULL,
   ManagerID INTEGER NULL
);


INSERT INTO Authors (AuthorID, AuthorName, CountryOfOrigin, NumberOfBooksWritten) VALUES (1,"Margaret Atwood","Canada",23);
INSERT INTO Authors (AuthorID, AuthorName, CountryOfOrigin, NumberOfBooksWritten) VALUES (2,"Haruki Murakami",	"Japan",18);
INSERT INTO Authors (AuthorID, AuthorName, CountryOfOrigin, NumberOfBooksWritten) VALUES (3,"Chimamanda Ngozi Adichie","Nigeria",7);
INSERT INTO Authors (AuthorID, AuthorName, CountryOfOrigin, NumberOfBooksWritten) VALUES (4,"Elena Ferrante","Italy",12);
INSERT INTO Authors (AuthorID, AuthorName, CountryOfOrigin, NumberOfBooksWritten) VALUES (5,"Salman Rushdie", "India",19);
INSERT INTO Authors (AuthorID, AuthorName, CountryOfOrigin, NumberOfBooksWritten) VALUES (6,"Toni Morrison","United States",11);
INSERT INTO Authors (AuthorID, AuthorName, CountryOfOrigin, NumberOfBooksWritten) VALUES (7,"Gabriel García Márquez","Colombia",15);
INSERT INTO Authors (AuthorID, AuthorName, CountryOfOrigin, NumberOfBooksWritten) VALUES (8,"Yuval Noah Harari","Israel",4);
INSERT INTO Authors (AuthorID, AuthorName, CountryOfOrigin, NumberOfBooksWritten) VALUES (9,"Stephen King","United States",64);
INSERT INTO Authors (AuthorID, AuthorName, CountryOfOrigin, NumberOfBooksWritten) VALUES (10,"J.K. Rowling","United Kingdom",14);
INSERT INTO Authors (AuthorID, AuthorName, CountryOfOrigin, NumberOfBooksWritten) VALUES (11,"Agatha Christie","United Kingdom",85);
INSERT INTO Authors (AuthorID, AuthorName, CountryOfOrigin, NumberOfBooksWritten) VALUES (12,"Paulo Coelho","Brazil",30);
INSERT INTO Authors (AuthorID, AuthorName, CountryOfOrigin, NumberOfBooksWritten) VALUES (13,"Khaled Hosseini","Afghanistan",4);
INSERT INTO Authors (AuthorID, AuthorName, CountryOfOrigin, NumberOfBooksWritten) VALUES (14, "Isabel Allende","Chile",	25);
INSERT INTO Authors (AuthorID, AuthorName, CountryOfOrigin, NumberOfBooksWritten) VALUES (15,"Ayn Rand","Russia",8);
INSERT INTO Authors (AuthorID, AuthorName, CountryOfOrigin, NumberOfBooksWritten) VALUES (16,"Chinua Achebe","Nigeria",5);
INSERT INTO Authors (AuthorID, AuthorName, CountryOfOrigin, NumberOfBooksWritten) VALUES (17,"Octavio Paz","Mexico",12);
INSERT INTO Authors (AuthorID, AuthorName, CountryOfOrigin, NumberOfBooksWritten) VALUES (18,"Umberto Eco","Italy",9);
INSERT INTO Authors (AuthorID, AuthorName, CountryOfOrigin, NumberOfBooksWritten) VALUES (19,"Milan Kundera","Czech Republic",8);
INSERT INTO Authors (AuthorID, AuthorName, CountryOfOrigin, NumberOfBooksWritten) VALUES (20,"Kazuo Ishiguro","Japan",10);

INSERT INTO Members (MemberID,Name,Gender,EmailAddress,PhoneNumber,Address,Age,TypeOfMembership,DateOfMembership,Status) VALUES (1,'Sarah Johnson','Female','sarah.johnson@email.com','+1-555-0123	123','Oak Street Springfield IL',28,'Premium','2022-01-15',	'Active');

INSERT INTO Members (MemberID,Name,Gender,EmailAddress,PhoneNumber,Address,Age,TypeOfMembership,DateOfMembership,Status) VALUES (2,'Michael Chen','Male','m.chen@gmail.com','+1-555-0234','456 Pine Avenue Chicago IL',34,'Standard',	'2021-03-22','Active');
INSERT INTO Members (MemberID,Name,Gender,EmailAddress,PhoneNumber,Address,Age,TypeOfMembership,DateOfMembership,Status) VALUES (3,'Emily Rodriguez','Female','emily.r@hotmail.com','+1-555-0345','789 Maple Drive Evanston IL',22,'Student','2023-09-01','Active');
INSERT INTO Members (MemberID,Name,Gender,EmailAddress,PhoneNumber,Address,Age,TypeOfMembership,DateOfMembership,Status) VALUES (4,'David Thompson','Male','d.thompson@yahoo.com','+1-555-0456','321 Elm Street Naperville IL',45,'Premium',	'2020-06-10','Active');
INSERT INTO Members (MemberID,Name,Gender,EmailAddress,PhoneNumber,Address,Age,TypeOfMembership,DateOfMembership,Status) VALUES (5,'Lisa Wang','Female','lisa.wang@outlook.com','+1-555-0567','654 Cedar Lane Aurora IL',31,'Standard','2022-08-18','Active');
INSERT INTO Members (MemberID,Name,Gender,EmailAddress,PhoneNumber,Address,Age,TypeOfMembership,DateOfMembership,Status) VALUES (6,'James Miller','Male','j.miller@email.com','+1-555-0678',	'987 Birch Road Rockford IL',29,'Standard','2021-11-05','Suspended');
INSERT INTO Members (MemberID,Name,Gender,EmailAddress,PhoneNumber,Address,Age,TypeOfMembership,DateOfMembership,Status) VALUES (7,'Amanda Davis','Female',	'amanda.d@gmail.com','+1-555-0789','147 Willow Street Peoria IL',26,'Premium','2023-02-14','Active');
INSERT INTO Members (MemberID,Name,Gender,EmailAddress,PhoneNumber,Address,Age,TypeOfMembership,DateOfMembership,Status) VALUES (8,'Robert Kim','Male''robert.kim@hotmail.com','+1-555-0890','258 Spruce Avenue Joliet IL',38,'Standard','2020-12-03','Active');
INSERT INTO Members (MemberID,Name,Gender,EmailAddress,PhoneNumber,Address,Age,TypeOfMembership,DateOfMembership,Status) VALUES (9,'Jessica Brown','Female','j.brown@yahoo.com','+1-555-0901','369 Poplar Drive Waukegan IL',24, 'Student','2023-01-20','Active');
INSERT INTO Members (MemberID,Name,Gender,EmailAddress,PhoneNumber,Address,Age,TypeOfMembership,DateOfMembership,Status) VALUES (10,'Christopher Lee','Male','chris.lee@outlook.com','+1-555-1012','741 Ash Street Schaumburg IL',42,'Premium','2021-07-12','Active');
INSERT INTO Members (MemberID,Name,Gender,EmailAddress,PhoneNumber,Address,Age,TypeOfMembership,DateOfMembership,Status) VALUES (11,'Michelle Martinez','Female','m.martinez@gmail.com','+1-555-1123','852 Pine Street Rockford IL',35	,'Standard','2022-04-25','Active');
INSERT INTO Members (MemberID,Name,Gender,EmailAddress,PhoneNumber,Address,Age,TypeOfMembership,DateOfMembership,Status) VALUES (12,'Kevin Wilson','Male','k.wilson@hotmail.com','+1-555-1234','963 Oak Avenue Peoria IL',27,'Standard','2023-03-18','Active');
INSERT INTO Members (MemberID,Name,Gender,EmailAddress,PhoneNumber,Address,Age,TypeOfMembership,DateOfMembership,Status) VALUES (13,'Rachel Green','Female','r.green@yahoo.com','+1-555-1345','159 Maple Lane Joliet IL',30,'Premium',	'2021-09-08','Active');
INSERT INTO Members (MemberID,Name,Gender,EmailAddress,PhoneNumber,Address,Age,TypeOfMembership,DateOfMembership,Status) VALUES (14,'Daniel White','Male','d.white@outlook.com','+1-555-1456',357,'Cedar Drive Waukegan IL',33,'Standard','2022-01-30','Active');
INSERT INTO Members (MemberID,Name,Gender,EmailAddress,PhoneNumber,Address,Age,TypeOfMembership,DateOfMembership,Status) VALUES (15,'Amy Taylor','Female','a.taylor@email.com','+1-555-1567','468 Elm Avenue Schaumburg IL',25,'Student','2023-05-12','Active');


INSERT INTO Borrow_History (BorrowHistoryID,BookID,MemberID,BorrowDate,ReturnDate) VALUES(1,1,1,'2024-01-15','2024-02-05');
INSERT INTO Borrow_History (BorrowHistoryID,BookID,MemberID,BorrowDate,ReturnDate) VALUES(2,2,3,'2024-02-10','2024-03-02');
INSERT INTO Borrow_History (BorrowHistoryID,BookID,MemberID,BorrowDate,ReturnDate) VALUES(3,22,2,'2024-01-22','2024-02-12');
INSERT INTO Borrow_History (BorrowHistoryID,BookID,MemberID,BorrowDate,ReturnDate) VALUES(4,30,9,'2024-03-05',	'2024-03-25');
INSERT INTO Borrow_History (BorrowHistoryID,BookID,MemberID,BorrowDate,ReturnDate) VALUES(5,7,4,'2024-02-18','2024-03-10');
INSERT INTO Borrow_History (BorrowHistoryID,BookID,MemberID,BorrowDate,ReturnDate) VALUES(6,35,5,'2024-03-12',	'2024-04-01');
INSERT INTO Borrow_History (BorrowHistoryID,BookID,MemberID,BorrowDate,ReturnDate) VALUES(7,19,1,'2024-02-20','2024-03-15');
INSERT INTO Borrow_History (BorrowHistoryID,BookID,MemberID,BorrowDate,ReturnDate) VALUES(8,25,8,'2024-03-01','2024-03-21');
INSERT INTO Borrow_History (BorrowHistoryID,BookID,MemberID,BorrowDate,ReturnDate) VALUES(9,40,7,'2024-01-28','2024-02-17');
INSERT INTO Borrow_History (BorrowHistoryID,BookID,MemberID,BorrowDate,ReturnDate) VALUES(10,16,10,'2024-02-25','2024-03-18');
INSERT INTO Borrow_History (BorrowHistoryID,BookID,MemberID,BorrowDate,ReturnDate) VALUES(11,10,2,'2024-03-10','2024-04-05');

INSERT INTO Borrow_History (BorrowHistoryID,BookID,MemberID,BorrowDate,ReturnDate) VALUES(12,45,3,'2024-01-08','2024-01-28');
INSERT INTO Borrow_History (BorrowHistoryID,BookID,MemberID,BorrowDate,ReturnDate) VALUES(13,13,4,'2024-03-15');
INSERT INTO Borrow_History (BorrowHistoryID,BookID,MemberID,BorrowDate,ReturnDate) VALUES(14,51,6,'2024-02-01');
INSERT INTO Borrow_History (BorrowHistoryID,BookID,MemberID,BorrowDate,ReturnDate) VALUES(15,49,7,'2024-03-20');


INSERT INTO Books(BookID,Title,AuthorID,Genre,DateOfPublication,Publisher,ISBN,Language,AvailableCopies,AgeRating) VALUES(1,'The Handmaid's Tale',	1	Dystopian Fiction	1985-08-01	McClelland & Stewart	9780771008795	English	3	16+																)
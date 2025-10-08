CREATE TABLE Authors (
 Author_ID INTEGER PRIMARY KEY,
 Author_Name VARCHAR(255) NOT NULL,
 Country_of_Origin VARCHAR(255) NOT NULL,
 Number_of_book_written INTEGER NOT NULL
 );


 CREATE TABLE Books (
    Book_ID INTEGER PRIMARY KEY,
    Title VARCHAR(255) NOT NULL,
    Author_ID INTEGER REFERENCES Authors(Author_ID),
    Genre VARCHAR(255) NOT NULL,
    Date_of_Pub DATE NOT NULL,
    Publisher VARCHAR(255) NOT NULL,
    ISBN VARCHAR(255) NOT NULL,
    Language VARCHAR(255) NOT NULL,
    Available_copies INTEGER NOT NULL,
    Age_rating VARCHAR NOT NULL
 );
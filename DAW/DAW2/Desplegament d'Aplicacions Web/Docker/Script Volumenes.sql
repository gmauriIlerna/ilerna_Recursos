CREATE TABLE Persons (
    PersonID int,
    LastName varchar(255),
    FirstName varchar(255),
    Address varchar(255),
    City varchar(255)
);

INSERT INTO Persons (PersonID, LastName, FirstName, Address, City)
VALUES (1, 'Hansen', 'Ola', 'Timoteivn 10', 'Sandnes'),
       (2, 'Svendson', 'Tove', 'Borgvn 23', 'Sandnes'),
       (3, 'Pettersen', 'Kari', 'Storgt 20', 'Stavanger');
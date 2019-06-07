DROP DATABASE IF EXISTS onlinestore;
CREATE DATABASE onlinestore CHARSET 'utf8';

USE onlinestore;

CREATE TABLE User (
  Id INT AUTO_INCREMENT PRIMARY KEY,
  Username VARCHAR(100) NOT NULL,
  FirstName VARCHAR(30) NOT NULL,
  LastName VARCHAR(30) NOT NULL,
  Email VARCHAR(100) NOT NULL,
  Password VARCHAR(20) NOT NULL,
  Address VARCHAR(100) NOT NULL,
  PhoneNumber VARCHAR(15) NOT NULL
);

CREATE TABLE Product (
	Id INT AUTO_INCREMENT PRIMARY KEY,
  ProductName VARCHAR(100) NOT NULL,
  ProductType VARCHAR(20) NOT NULL,
  Description VARCHAR(100) NOT NULL,
  Stock INT NOT NULL,
  Price INT NOT NULL,
  ImageSource VARCHAR(50) NOT NULL
);

CREATE TABLE Order (
  Id INT AUTO_INCREMENT PRIMARY KEY,
  UserId INT NOT NULL,
  ProductId INT NOT NULL,
  Quantity INT NOT NULL,
  ApprovalStatus VARCHAR(10) NOT NULL,

  FOREIGN KEY (UserId) REFERENCES User(Id),
  FOREIGN KEY (ProductId) REFERENCES Product(Id)
);

CREATE TABLE Cart (
	Id INT AUTO_INCREMENT PRIMARY KEY,
  UserId INT NOT NULL,
  ProductId INT NOT NULL,
  Quantity INT NOT NULL,

  FOREIGN KEY (UserId) REFERENCES User(Id),
  FOREIGN KEY (ProductId) REFERENCES Product(Id)
);

CREATE TABLE Comment (
  Id INT AUTO_INCREMENT PRIMARY KEY,
  UserId INT,
  ProductId INT,
  Message VARCHAR(100),

  FOREIGN KEY (UserId) REFERENCES User(Id),
  FOREIGN KEY (ProductId) REFERENCES Product(Id)
);

CREATE TABLE Rating (
  Id INT AUTO_INCREMENT PRIMARY KEY,
  UserId INT,
  ProductId INT,
  Value INT,

  FOREIGN KEY (UserId) REFERENCES User(Id),
  FOREIGN KEY (ProductId) REFERENCES Product(Id)
);

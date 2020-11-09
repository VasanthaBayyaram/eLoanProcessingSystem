DROP DATABASE IF EXISTS eLoanSystem;

CREATE DATABASE eLoanSystem;

USE eLoanSystem;

CREATE TABLE User(
User_ID varchar(20) UNIQUE NOT NULL PRIMARY KEY,
Password varchar(20) NOT NULL);

INSERT INTO User values("admin", "admin"),
("SampatiRoy", "Password1"),
("KrystleD", "Password2");

CREATE TABLE Loan(
Application_ID int AUTO_INCREMENT PRIMARY KEY,
Loan_Name varchar(30) NOT NULL,
Purpose varchar(30) NOT NULL,
Loan_Requested_Amount int(15) NOT NULL,
Application_Date DATE NOT NULL,
Bussiness_Structure varchar(12) NOT NULL,
Billing_Indicator varchar(25) NOT NULL,
Tax_Payer varchar(15) NOT NULL,
Address varchar(120) NOT NULL,
Email_ID varchar(30) UNIQUE,
Mobile_Number numeric(10) UNIQUE,
Status varchar(10) NOT NULL,
User_ID varchar(20) NOT NULL,
constraint UserID FOREIGN KEY (User_ID) REFERENCES User(User_ID));

ALTER TABLE Loan AUTO_INCREMENT = 10050;

INSERT INTO Loan (Loan_Name,Purpose,Loan_Requested_Amount,Application_Date,Bussiness_Structure,Billing_Indicator,Tax_Payer,Address,Email_ID,Mobile_Number,Status,User_ID) Values("Mortgage Loan", "Home", "1000000", "2019-05-21", "Indivdual", "Salaried", "Yes", "Delhi, India", "roy@gmail.com", "8456123753", "pending", "SampatiRoy"),
("Personal Loan", "Vacation", "500000", "2020-08-11", "Indivdual", "Salaried", "No", "Hyderabad, India", "Krystle@yahoo.com", "8456123754", "pending", "KrystleD");

SELECT *FROM Loan;

CREATE TABLE ApprovedLoans(
Application_ID int NOT NULL,
Loan_Sanctioned_Amount int(12),
Term_Payment_Amount double(12,1) NOT NULL,
Payment_Start_Date DATE NOT NULL,
Loan_Closure_Date DATE NOT NULL,
EMI double(12,1) NOT NULL,
constraint ApplicationID FOREIGN KEY (Application_ID) REFERENCES Loan(Application_ID));


INSERT INTO ApprovedLoans Values("10050", "1000000", "1080000", "2019-06-21", "2022-06-21", "36000"),
("10051", "500000", "540000",  "2020-09-11", "2023-09-11", "18000");


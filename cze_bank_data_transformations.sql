CREATE DATABASE CZE_BANKING;

USE CZE_BANKING;

CREATE  TABLE DISTRICT(
District_Code INT PRIMARY KEY	,
District_Name VARCHAR(100)	,
Region VARCHAR(100)	,
No_of_inhabitants	INT,
No_of_municipalities_with_inhabitants_less_499 INT,
No_of_municipalities_with_inhabitants_500_btw_1999	INT,
No_of_municipalities_with_inhabitants_2000_btw_9999	INT,
No_of_municipalities_with_inhabitants_less_10000 INT,	
No_of_cities	INT,
Ratio_of_urban_inhabitants	FLOAT,
Average_salary	INT,
No_of_entrepreneurs_per_1000_inhabitants INT,
No_committed_crime_2017	INT,
No_committed_crime_2018 INT
) ;



CREATE TABLE ACCOUNT(
account_id INT PRIMARY KEY,
district_id	INT,
frequency	VARCHAR(40),
Date DATE ,
Account_Type VARCHAR(100) ,
Card_Assigned VARCHAR(20),
FOREIGN KEY (district_id) references DISTRICT(District_Code) 
);


CREATE TABLE LOAN(
loan_id	INT ,
account_id	INT,
Date	DATE,
amount	INT,
duration	INT,
payments	INT,
status VARCHAR(35),
FOREIGN KEY (account_id) references ACCOUNT(account_id)
);

DROP TABLE TRANSACTIONS;

CREATE  TABLE TRANSACTIONS(
trans_id INT,	
account_id	INT,
Date	DATE,
Type	VARCHAR(30),
operation	VARCHAR(40),
amount	INT,
balance	FLOAT,
Purpose	VARCHAR(40),
bank	VARCHAR(45) DEFAULT NULL,
account_partner_id INT DEFAULT NULL,
FOREIGN KEY (account_id) references ACCOUNT(account_id));

CREATE  TABLE CLIENT(
client_id	INT PRIMARY KEY,
Sex	CHAR(10),
Birth_date	DATE,
district_id INT,
FOREIGN KEY (district_id) references DISTRICT(District_Code) 
);



-----------------------------------------------------------------------------------------------------------------------------------------------
SELECT * FROM DISTRICT;
SELECT * FROM ACCOUNT;
SELECT count(*) FROM TRANSACTIONS;
truncate table transactions;
SELECT * FROM DISPOSITION;
SELECT * FROM CARD;
SELECT * FROM ORDER_LIST;
SELECT * FROM LOAN;
SELECT * FROM CLIENT;
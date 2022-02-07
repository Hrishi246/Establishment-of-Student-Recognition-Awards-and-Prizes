--DDL/DML Statements--
BEGIN TRANSACTION;
CREATE TABLE IF NOT EXISTS "NON_APPROVING_OFFICIAL" (
	"Employee_Id"	INTEGER NOT NULL UNIQUE,
	"Type"	TEXT,
	PRIMARY KEY("Employee_Id"),
	FOREIGN KEY("Employee_Id") REFERENCES "UNIVERSITY_EMPLOYEE"("Employee_Id") ON DELETE CASCADE ON UPDATE CASCADE
);
CREATE TABLE IF NOT EXISTS "PAYMENT_REQUEST_DOCUMENT" (
	"Transaction_Id"	INTEGER NOT NULL UNIQUE,
	"Submitter_Id"	INTEGER,
	PRIMARY KEY("Transaction_Id"),
	FOREIGN KEY("Submitter_Id") REFERENCES "UNIVERSITY_EMPLOYEE"("Employee_Id") ON DELETE CASCADE ON UPDATE CASCADE
);
CREATE TABLE IF NOT EXISTS "UNIVERSITY_FINANCIAL_SERVICES" (
	"Request_Id"	INTEGER NOT NULL UNIQUE,
	"Request_Type"	INTEGER,
	PRIMARY KEY("Request_Id")
);
CREATE TABLE IF NOT EXISTS "PROCUREMENT_CARD" (
	"Card_No"	INTEGER NOT NULL UNIQUE,
	"Cardholder_Name"	TEXT,
	"Spend_Limit"	INTEGER,
	"Validity_Duration"	INTEGER,
	"Employee_Id"	INTEGER,
	"Request_Id"	INTEGER,
	PRIMARY KEY("Card_No"),
	FOREIGN KEY("Request_Id") REFERENCES "UNIVERSITY_FINANCIAL_SERVICES"("Request_Id") ON DELETE CASCADE ON UPDATE CASCADE,
	FOREIGN KEY("Employee_Id") REFERENCES "UNIVERSITY_EMPLOYEE"("Employee_Id") ON DELETE CASCADE ON UPDATE CASCADE
);
CREATE TABLE IF NOT EXISTS "APPROVING_OFFICIAL" (
	"Employee_Id"	INTEGER NOT NULL UNIQUE,
	"Approver_Type"	TEXT,
	PRIMARY KEY("Employee_Id"),
	FOREIGN KEY("Employee_Id") REFERENCES "UNIVERSITY_EMPLOYEE"("Employee_Id") ON DELETE CASCADE ON UPDATE CASCADE
);
CREATE TABLE IF NOT EXISTS "UNIVERSITY_EMPLOYEE" (
	"Employee_Id"	INTEGER NOT NULL UNIQUE,
	"Employee_Type"	TEXT,
	"Cardholding_Status"	TEXT,
	"Department_Name"	TEXT,
	PRIMARY KEY("Employee_Id")
);
CREATE TABLE IF NOT EXISTS "AWARD" (
	"Award_Id"	INTEGER NOT NULL UNIQUE,
	"Purpose"	TEXT,
	"Category"	TEXT,
	"Source_Of_Funds"	TEXT,
	"Criteria"	TEXT,
	"Value"	NUMERIC,
	"Description"	TEXT,
	"Type"	TEXT,
	"Card_No"	INTEGER,
	"Approver_Id"	INTEGER NOT NULL,
	"Purchase_Type"	TEXT,
	"PRD_Transaction_Id"	INTEGER,
	PRIMARY KEY("Award_Id"),
	FOREIGN KEY("Card_No") REFERENCES "PROCUREMENT_CARD"("Card_No") ON DELETE CASCADE ON UPDATE CASCADE,
	FOREIGN KEY("Approver_Id") REFERENCES "APPROVING_OFFICIAL"("Employee_Id") ON DELETE CASCADE ON UPDATE CASCADE
);
INSERT INTO "NON_APPROVING_OFFICIAL" ("Employee_Id","Type") VALUES (3,'Business Officer');
INSERT INTO "NON_APPROVING_OFFICIAL" ("Employee_Id","Type") VALUES (5,'Supervisor');
INSERT INTO "PAYMENT_REQUEST_DOCUMENT" ("Transaction_Id","Submitter_Id") VALUES (1000001,3);
INSERT INTO "PAYMENT_REQUEST_DOCUMENT" ("Transaction_Id","Submitter_Id") VALUES (1000002,5);
INSERT INTO "UNIVERSITY_FINANCIAL_SERVICES" ("Request_Id","Request_Type") VALUES (10000,'Procurement Card');
INSERT INTO "UNIVERSITY_FINANCIAL_SERVICES" ("Request_Id","Request_Type") VALUES (10001,'Procurement Card');
INSERT INTO "UNIVERSITY_FINANCIAL_SERVICES" ("Request_Id","Request_Type") VALUES (10002,'Procurement Card');
INSERT INTO "UNIVERSITY_FINANCIAL_SERVICES" ("Request_Id","Request_Type") VALUES (10003,'Procurement Card');
INSERT INTO "UNIVERSITY_FINANCIAL_SERVICES" ("Request_Id","Request_Type") VALUES (10004,'Procurement Card');
INSERT INTO "PROCUREMENT_CARD" ("Card_No","Cardholder_Name","Spend_Limit","Validity_Duration","Employee_Id","Request_Id") VALUES (1000,'John',200,'15th Oct 2023',1,10000);
INSERT INTO "PROCUREMENT_CARD" ("Card_No","Cardholder_Name","Spend_Limit","Validity_Duration","Employee_Id","Request_Id") VALUES (1001,'Jack',300,'20th Oct 2024',2,10001);
INSERT INTO "PROCUREMENT_CARD" ("Card_No","Cardholder_Name","Spend_Limit","Validity_Duration","Employee_Id","Request_Id") VALUES (1002,'Ursula',400,'20th Sep 2024',3,10002);
INSERT INTO "PROCUREMENT_CARD" ("Card_No","Cardholder_Name","Spend_Limit","Validity_Duration","Employee_Id","Request_Id") VALUES (1003,'Annie',350,'11th Jun 2026',4,10003);
INSERT INTO "PROCUREMENT_CARD" ("Card_No","Cardholder_Name","Spend_Limit","Validity_Duration","Employee_Id","Request_Id") VALUES (1004,'Owen',300,'08th Apr 2024',5,10004);
INSERT INTO "APPROVING_OFFICIAL" ("Employee_Id","Approver_Type") VALUES (1,'Dean');
INSERT INTO "APPROVING_OFFICIAL" ("Employee_Id","Approver_Type") VALUES (2,'President');
INSERT INTO "APPROVING_OFFICIAL" ("Employee_Id","Approver_Type") VALUES (4,'Provost');
INSERT INTO "UNIVERSITY_EMPLOYEE" ("Employee_Id","Employee_Type","Cardholding_Status","Department_Name") VALUES (1,'Approving','False','Information Sciences');
INSERT INTO "UNIVERSITY_EMPLOYEE" ("Employee_Id","Employee_Type","Cardholding_Status","Department_Name") VALUES (2,'Approving','False','Mechanical Sciences');
INSERT INTO "UNIVERSITY_EMPLOYEE" ("Employee_Id","Employee_Type","Cardholding_Status","Department_Name") VALUES (3,'Non-Approving','True','Computer Sciences');
INSERT INTO "UNIVERSITY_EMPLOYEE" ("Employee_Id","Employee_Type","Cardholding_Status","Department_Name") VALUES (4,'Approving','True','Information Sciences');
INSERT INTO "UNIVERSITY_EMPLOYEE" ("Employee_Id","Employee_Type","Cardholding_Status","Department_Name") VALUES (5,'Non-Approving','False','Information Sciences');
INSERT INTO "AWARD" ("Award_Id","Purpose","Category","Source_Of_Funds","Criteria","Value","Description","Type","Card_No","Approver_Id","Purchase_Type","PRD_Transaction_Id") VALUES (100,'Social Development','Unrestricted General funds','Restricted','Academics',60,'This award has been granted','gift',1000,1,'Card',NULL);
INSERT INTO "AWARD" ("Award_Id","Purpose","Category","Source_Of_Funds","Criteria","Value","Description","Type","Card_No","Approver_Id","Purchase_Type","PRD_Transaction_Id") VALUES (101,'Cultural Development','Self Supported','Unrestricted','Non-Academics',30,'This award has been granted','cash',1001,2,'Card',NULL);
INSERT INTO "AWARD" ("Award_Id","Purpose","Category","Source_Of_Funds","Criteria","Value","Description","Type","Card_No","Approver_Id","Purchase_Type","PRD_Transaction_Id") VALUES (102,'Intellectual Development','Restricted gifts','Restricted','Academics',40,'This award has been granted','plaque',1002,1,'Card',NULL);
INSERT INTO "AWARD" ("Award_Id","Purpose","Category","Source_Of_Funds","Criteria","Value","Description","Type","Card_No","Approver_Id","Purchase_Type","PRD_Transaction_Id") VALUES (103,'Social Development','Unrestricted General funds','Restricted','Non-Academics',80,'This award has been granted','gift',1000,4,'Card',NULL);
INSERT INTO "AWARD" ("Award_Id","Purpose","Category","Source_Of_Funds","Criteria","Value","Description","Type","Card_No","Approver_Id","Purchase_Type","PRD_Transaction_Id") VALUES (104,'Cultural Development','Self supported','Unrestricted','Non-Academics',35,'This award has been granted','cash',1003,2,'Card',NULL);
INSERT INTO "AWARD" ("Award_Id","Purpose","Category","Source_Of_Funds","Criteria","Value","Description","Type","Card_No","Approver_Id","Purchase_Type","PRD_Transaction_Id") VALUES (105,'Social Development','Unrestricted General funds','Restricted','Academics',60,'This award has been granted','gift',NULL,1,'PRD',100001);
INSERT INTO "AWARD" ("Award_Id","Purpose","Category","Source_Of_Funds","Criteria","Value","Description","Type","Card_No","Approver_Id","Purchase_Type","PRD_Transaction_Id") VALUES (106,'Cultural Development','Self Supported','Unrestricted','Non-Academics',30,'This award has been granted','cash',NULL,2,'PRD',100002);
COMMIT;


--Select Queries --
--Query 1--
SELECT Card_No, Cardholder_Name, t2.Approver_Type 
FROM PROCUREMENT_CARD pc  
JOIN (SELECT u.Employee_Id, a.Approver_Type 
FROM UNIVERSITY_EMPLOYEE u  
INNER JOIN APPROVING_OFFICIAL a 
ON u.Employee_Id = a.Employee_Id 
WHERE u.Cardholding_Status = "True") t2 
ON pc.Employee_Id = t2.Employee_Id


--Query 2--

Select pc.Cardholder_Name, a.Card_No, pc.Employee_Id, (SUM(a.Value)*100/pc.Spend_Limit) as Percentage_Expenditure  
FROM AWARD a 
INNER JOIN PROCUREMENT_CARD pc 
ON a.Card_No = pc.Card_No AND a.Purchase_type = "Card" 
GROUP BY a.Card_No 
ORDER BY Percentage_Expenditure DESC 
LIMIT 1

--Query 3--

SELECT a.Award_Id, a.Value, a.Approver_Id, ao.Approver_Type
FROM AWARD a
JOIN APPROVING_OFFICIAL ao
ON a.Approver_Id = ao.Employee_Id
WHERE a.Value > (
    SELECT AVG(a.Value)
    FROM AWARD a
	WHERE a.Purchase_Type = "Card"
	)







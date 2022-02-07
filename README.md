# Establishment-of-Student-Recognition-Awards-and-Prizes
To: Ajay Sharma, Assistant Deputy Director of Financial Services at the University of Kentucky
From: Amol Shyamsunder Govekar, Hrishikesh Potdar, Jun Liu
Date: 13th December 2021
Subject: Final report for establishing Student Recognition Awards and Prizes.


Overview of Application Domain
We worked on the “Establishment of Student Recognition Awards and Prizes” project for the University of Kentucky. We analyzed the documents provided to us and found all the actors, entities, and relationships among them. We analyzed all the requirements of the university in terms of the policies for giving out the awards to the students and the procedures regarding approval, payment methods, and other restrictions regarding giving out the award. We worked on the project in four phases and henceforth we will call them Milestones.
The way the flow of our system works is given below.
University Financial Services approves the Procurement card. The Procurement card is owned by the University Employees. Now the university employees are of two types. These are Approving Officials and Non-Approving Officials. An award can be purchased by a University Employee using either a Procurement Card or Purchase Request Document. The award needs to be approved by the approving officials and the approving officials are of three types. These are President, Provost, Dean.
Modeling of the Project in various Milestones.
Milestone 1: Creating Extended Entity Relationship Diagram.
After understanding the system requirements, we came up with five major entities. These were, PROCUREMENT_CARD, UNIVERSITY_FINANCIAL_SERVICES, AWARD, PAYMENT_REQUEST_DOCUMENT,
and UNIVERSITY_EMPLOYEE. Now we further specialized the UNIVERSITY_EMPLOYEE into APPROVING_OFFICAL and NON_APPROVING_OFFICAL. So, we now had a total of seven entities after specialization. We defined a total of six relationships to connect various entities and connected them using participation constraints. Also, all the entities had various attributes including key attributes.
Link to our EER diagram

Milestone 2: Creating Relational schema and SQL queries in SQLite
After creating the EER diagram in the first milestone we moved to modeling the project in a database. So, we first created a relational schema. We had a total of seven tables. These tables were UNIVERSITY_EMPLOYEE, APPROVING_OFFICAL, NON_APPROVING_OFFICAL, PROCUREMENT_CARD,
 
UNIVERSITY_FINANCIAL_SERVICES, AWARD, PAYMENT_REQUEST_DOCUMENT. All the tables were
connected to each other using foreign key constraints. The attributes that were created in the first milestone were used as columns in these tables. All the tables had primary key constraints with unique values. After creating the relational schema, we implemented it as a database using SQLite. We inserted data into the tables and created complex nested queries to retrieve the data.
Link to our Relational Schema

Milestone 3: Modeling in Datalog.
In this milestone, we took instance-level data from milestone 2 and created knowledge-base assertions in Datalog. We created a “.dl” file and put seven knowledgebase assertions in it based on the previous milestone. Then we put some data in it and created five inference rules for retrieving the data. Some of these inference rules were based on our queries from previous milestones.
Milestone 4: Modeling in Protégé.
This is the final milestone. In this milestone, we created ontology using the protégé tool. The modeling in this one was based on our work from the first two milestones. So we created five classes over here. These were – AWARD, PAYMENT_REQUEST_DOCUMENT, PROCUREMENT_CARD, UNIVERSITY_EMPLOYEE, and
UNIVERSITY_FINANCIAL_SERVICES. In addition to these classes, we created subclasses as well. These were CATEGORY1, CATEGORY2, CATEGORY3 for AWARD. APPROVING_OFFICAL and NON_APPROVING_OFFICIAL       for       UNIVERSITY_EMPLOYEE.       PRESIDENT       and       PROVOST   for
APPROVING_OFFICAL. After that, we defined object properties and data properties. The data properties had types as “integer” and “string”. Finally, we defined individuals and class equivalences. After that, we run the reasoner and to get the inferences.


Strengths and Weaknesses of different techniques used:
A.	SQLite
We have revised the EER diagram for the system based on the comments given for the milestone-1 submission. Based on the revised EER diagram, we have created a relational schema and inserted data using SQLite and DB-Browser.
Strengths:
1.	SQLite turned out to be useful as we could insert instance-level data into the database and retrieve information from a database using simple queries. We were able to retrieve information like:
a)	SQLite turned out to be useful as we could insert instance-level data into the database and retrieve information from a database using simple queries. We were able to retrieve information like:Card Number, Cardholder Name, and approver type of employees where cardholding status is true.
b)	Cardholder’s name for the card that has the highest expenditure ratio i.e., Award Value/Spend Limit.
 
c)	Award ids of those awards (purchased by card) whose value is greater than average award value in database.
2.	Syntax to write these queries is simple and intuitive as compared to other tools like DES- Datalog.
Weaknesses:
1.	The Execution order of SQL queries, especially DDL (Data Definition Language) statements (insert queries), is of utmost importance. Before inserting data as a foreign key in the table it is necessary to enter that data as a primary key in its respective table first to maintain referential integrity.
2.	One of the most significant shortcomings of the SQLite system is the lack of multi-user capabilities available in full-fledged RDBMS systems such as MySQL and PostgreSQL.


B.	Datalog:
We have created knowledgebase assertions in Datalog and wrote inference rules to reason about
“General things” in our system.
Strengths:
1.	Data-log is easy to install, and it can be potentially used on any OS-platform.
2.	We could use RDF graphs from Datalog facts to represent our system graphically because Datalog employs subject-predicate-object logic.
Weaknesses:
1.	It is difficult to implement nested queries and aggregate functions using Datalog. Lack of community support for this software was a major drawback, as we faced multiple syntactical errors and spacing issues while executing queries.
2.	For DES we executed “. dl” scripts using command-line interface as opposed to a UI interface in SQLite. It was difficult to identify the source of errors while debugging and inferring from execution output descriptions.
C.	Protégé:
We have created OWL ontology by Protégé. We created instance-level assertions, defined data properties, and identified four inferences based on the ontology.
Strengths:
1.	The graphical User interface of Protégé simplifies creating and editing ontologies. Quick access to reasoner and detailed explanations describing how class equivalence and constraints can derive inferences are useful.
2.	Backends for alternative file types can be added to Protégé OWL. Clips, XML, RDF, and OWL are some of the current formats.
Weaknesses:
1.	Identifying use cases which we can use based upon our current database schema was challenging. Mapping various database concepts like entities, attributes, and relationships in the
 
context of knowledgebase in protégé often time s felt ambiguous. We also needed to rethink our class equivalence statements several times to obtain inferences.
2.	There is not much community support for Protégé, which made debugging errors and understanding error explanations challenging.


Conclusions:
Given the strengths and weaknesses of each tool, we concluded that SQLite will be the best tool for information modeling concerning our domain.
1.	It was easy to incorporate our conceptual modeling ideas into SQLite, designing databases, inserting data, and formulating queries to retrieve useful information.
2.	It was comparatively easier to execute complex queries in SQLite as compared to DES. We found that it is easier to debug errors in SQLite as compared to DES.
3.	SQLite has more widespread community support as compared to modeling tools like Protégé, thus it was easier to resolve issues in SQLite.

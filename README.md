# FastBridge Learning Java Developer Homework Assignment

Base URL: https://github.com/pclarkfbl/fbl-homework

## Context:
[FastBridge Learning](https://www.fastbridge.org) provides a formative assessment product to allow teachers and other classroom staff to quickly and accurately measure student performance and growth. Students in

One of the most important elements of many educational software systems is classroom roster management - who are the teachers, who are the students, and which classes are they all in? For most school districts, this is managed using a SIS (Student Information System). The SIS may provide an API to export roster data, or may simply export a CSV file that needs to be manually uploaded. Our application ingests this sort of data on a regular basis.

### CSV structure
The CSV files have a structure documented in the attached PDF File: [Instructions.pdf](/Instructions%20for%20Creating%20a%20SIF-Compliant%20Roster%20for%20FAST.pdf/)
Note that the last CSV, which only contains changes, has a somewhat different structure which is described below.

## Assignment:
The homework assignment is to write a java program to import a classroom roster file, provided via a URL, into a relational database. The database should contain at least three tables:

* student (information about students)
* teacher (information about teachers)
* enrollment (information about which students are in which teachers' classes)

A template database creation script is provided in this directory, named [create_schema.sql](/create_schema.sql). This script is intended as a starting point - you may alter this script as needed for your database of choice or to accomodate design changes of your own. Not all of the columns in the CSV file are represented in the tables created by the script, you may ignore these columns in your application.

There are 4 CSV files to work with, with the following characteristics:

1.csv is a straightforward CSV file
The URL for this file is:
https://github.com/pclarkfbl/fbl-homework/raw/master/1.csv

2.csv is a CSV file that is has larger student IDs, and exhibits a problem with long numbers that is often seen when the CSV file has made a trip through Microsoft Excel. It contains at least one record that should be rejected by your program.
The URL for this file is:
https://github.com/pclarkfbl/fbl-homework/raw/master/2.csv

3.csv is a CSV file that has characters not present in the normal ASCII character set.
The URL for this file is:
https://github.com/pclarkfbl/fbl-homework/raw/master/3.csv

1-delta.csv is a delta roster. Such rosters are often used after the initial setup when students move in, move out, or change teachers. It has a leading column titled "Action", containing either a "A" for 'Add' or a "D" for 'Delete'. Other than the addition of that column, the file has the same structure as the others. The proper handling of this roster file assumes that 1.csv has already been processed. When processing 1-delta.csv, the listed students should be either added or removed as specified in the initial column.
The URL for this file is:
https://github.com/pclarkfbl/fbl-homework/raw/master/1-delta.csv

Note that the URLs may result in a 302 redirect, which your program should follow.

## Requirements:
Your program should take the URL of a CSV file as a command-line argument, along with a flag to indicate whether this is a clean import or a delta import. It should perform the following steps:
1. connect to the CSV file's URL
1. read the CSV file
1. insert records into the database
1. report how many records were modified
1. report a list of each teacher in the database, and a count of how many students are in a class held by that teacher
1. and then exit.
1. In addition - if any records are malformed, the program should provide an exception log of any records that it rejected, and need not produce any other output.

### Language and JDK:
Your program should run in a Java8 JVM. You may use any Java8 language features that you find useful. Your program should not have any external dependencies, other than the following:

### Database:
You'll need a relational database of some sort. Please indicate which database you're using. Reasonable choices include:

* [JavaDB](http://www.oracle.com/technetwork/java/javadb/overview/index.html) JavaDB is a distribution of Apache Derby that's included in the Oracle JDK, and will be the most straightforward database to use. If you're unfamiliar with it, there's a good [Getting Started with Derby document](http://db.apache.org/derby/manuals/index.html#docs_10.11).
* [HSQLDB](http://hsqldb.org) HyperSQL is an embeddable pure-java SQL database.
* [H2](http://www.h2database.com/) H2 is an embeddable pure-java SQL database.
* [PostgreSQL](https://www.postgresql.org) PostgreSQL is an open-source, free SQL database.
* [MySQL](https://dev.mysql.com) MySQL Community Edition is an open-source, free SQL database.
* [Amazon RDS free tier](https://aws.amazon.com/rds/faqs/#free-tier) Amazon provides SQL Server, MySQL, MariaDB, and PostgreSQL instances for free
* [Microsoft Azure free tier](https://azure.microsoft.com/en-us/services/mysql/) Microsoft provides access to SQL Server, MySQL, and PostgreSQL in developer preview

### Supporting Frameworks
* JDBC: You'll probably need a JDBC library for your database of choice. Note that if you choose JavaDB, the JDBC driver is already included in the JDK.
* CSV reader: You may, if you wish, use the [Apache Commons CSV](http://commons.apache.org/proper/commons-csv/) library.
* Testing: You may include unit test libraries such as JUnit, along with a mocking framework, if desired.
* build: You may use Apache Ant, Apache Maven, Gradle, or a shell script to build, test, and run your program.

## Deliverables
* You should provide the source code for your application, along with any other files needed to build, test, and run the program. The program is not expected to be ready for use at scale in production, but it should be clear, easy to read, easy to run, and be code that you'd be comfortable putting up for code review with a peer engineer.
* You should provide a way to initialize the database and schema for your application, as well as to clear and reset it. This  can be done via a script, or from within the program, or any other mechanism that gets the job done.
* You should provide a brief design document that discusses why your program looks the way it does. Please indicate if there are design directions that you considered and rejected, and why you rejected them. It should also answer the following questions:
* * Are there any assumptions that you made in your design? What are they?
* * How would you change your program if it had to process roster files of over 100K records?
* * How would you change your program if it had to process roster files of over 1 million records?


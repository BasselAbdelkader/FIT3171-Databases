--****PLEASE ENTER YOUR DETAILS BELOW****
--T2-cb-insert.sql

--Student ID: 29796776
--Student Name: Bassel Abdelkader
--Tutorial No: 01

/* Comments for your marker:




*/

/*
Task 2 (b):

Load the ANIMAL and BREEDING_EVENT tables with your own test data using the 
supplied T2-cb-insert.sql file script file, and SQL commands which will  
insert as a minimum, the following sample data -
 - 12 animals, some of which must have been captured from the wild, i.e. 
      are not the offspring from a breeding event, and
- 4 breeding events
Your inserted rows must meet the assignment specification requirements
*/
--PLEASE PLACE REQUIRED SQL STATEMENT(S) BELOW

Insert into ANIMAL (ANIMAL_ID,ANIMAL_SEX,BREVENT_ID,CENTRE_ID,SPEC_GENUS,SPEC_NAME) values (20,'M',NULL,'SAF10','Acinonyx','jubatus');
Insert into ANIMAL (ANIMAL_ID,ANIMAL_SEX,BREVENT_ID,CENTRE_ID,SPEC_GENUS,SPEC_NAME) values (22,'M',NULL,'SAF30','Macrotis','lagotis');
Insert into ANIMAL (ANIMAL_ID,ANIMAL_SEX,BREVENT_ID,CENTRE_ID,SPEC_GENUS,SPEC_NAME) values (23,'F',NULL,'SAF30','Macrotis','lagotis');
Insert into ANIMAL (ANIMAL_ID,ANIMAL_SEX,BREVENT_ID,CENTRE_ID,SPEC_GENUS,SPEC_NAME) values (21,'F',NULL,'SAF10','Acinonyx','jubatus');
Insert into BREEDING_EVENT (BREVENT_ID,BREVENT_DATE,MOTHER_ID,FATHER_ID) values (21,TO_DATE('2021-01-21', 'YYYY-MM-DD'),21,20);
Insert into BREEDING_EVENT (BREVENT_ID,BREVENT_DATE,MOTHER_ID,FATHER_ID) values (22,TO_DATE('2021-01-22', 'YYYY-MM-DD'),23,22);
Insert into ANIMAL (ANIMAL_ID,ANIMAL_SEX,BREVENT_ID,CENTRE_ID,SPEC_GENUS,SPEC_NAME) values (25,'M',21,'SAF10','Acinonyx','jubatus');
Insert into ANIMAL (ANIMAL_ID,ANIMAL_SEX,BREVENT_ID,CENTRE_ID,SPEC_GENUS,SPEC_NAME) values (26,'F',21,'SAF10','Acinonyx','jubatus');
Insert into ANIMAL (ANIMAL_ID,ANIMAL_SEX,BREVENT_ID,CENTRE_ID,SPEC_GENUS,SPEC_NAME) values (27,'M',22,'SAF30','Macrotis','lagotis');
Insert into ANIMAL (ANIMAL_ID,ANIMAL_SEX,BREVENT_ID,CENTRE_ID,SPEC_GENUS,SPEC_NAME) values (28,'F',22,'SAF30','Macrotis','lagotis');
Insert into ANIMAL (ANIMAL_ID,ANIMAL_SEX,BREVENT_ID,CENTRE_ID,SPEC_GENUS,SPEC_NAME) values (24,'M',NULL,'SAF10','Acinonyx','jubatus');
Insert into BREEDING_EVENT (BREVENT_ID,BREVENT_DATE,MOTHER_ID,FATHER_ID) values (23,TO_DATE('2020-09-11', 'YYYY-MM-DD'),26,24);
Insert into ANIMAL (ANIMAL_ID,ANIMAL_SEX,BREVENT_ID,CENTRE_ID,SPEC_GENUS,SPEC_NAME) values (29,'M',23,'SAF10','Acinonyx','jubatus');
Insert into ANIMAL (ANIMAL_ID,ANIMAL_SEX,BREVENT_ID,CENTRE_ID,SPEC_GENUS,SPEC_NAME) values (30,'F',23,'SAF10','Acinonyx','jubatus');
Insert into BREEDING_EVENT (BREVENT_ID,BREVENT_DATE,MOTHER_ID,FATHER_ID) values (24,TO_DATE('2020-04-16', 'YYYY-MM-DD'),28,27);
Insert into ANIMAL (ANIMAL_ID,ANIMAL_SEX,BREVENT_ID,CENTRE_ID,SPEC_GENUS,SPEC_NAME) values (31,'M',24,'SAF30','Macrotis','lagotis');
Insert into ANIMAL (ANIMAL_ID,ANIMAL_SEX,BREVENT_ID,CENTRE_ID,SPEC_GENUS,SPEC_NAME) values (32,'F',24,'SAF30','Macrotis','lagotis');

COMMIT;


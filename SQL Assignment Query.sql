----------------------------SQL ASSIGNMENT QUERIES----------------------------

--CREATING DATABASE ASSIGNMENT_SQLQUERIES
CREATE DATABASE ASSIGNMENT_SQLQUERIES;

USE ASSIGNMENT_SQLQUERIES;


--CREATING STUDIES TABLE
CREATE TABLE STUDIES (PNAME VARCHAR(15),INSTITUTE VARCHAR(15),COURSE VARCHAR(10),COURSE_FEE INT);


--INSERTING RECORDS INTO STUDIES
INSERT INTO STUDIES VALUES
('ANAND','SABHARI','PGDCA',4500),
('ALTAF','COIT','DCA',7200),
('JULIANA','BDPS','MCA',22000),
('KAMALA','PRAGATHI','DCA',5000),
('MARY','SABHARI','PGDCA',4500),
('NELSON','PRAGATHI','DAP',6200),
('PATRICK','PRAGATHI','DCAP',5200),
('QADIR','APPLE','HDCA',14000),
('RAMESH','SABHARI','PGDCA',4500),
('REBECCA','BRILLIANT','DCAP',11000),
('REMITHA','DBPS','DCS',6000),
('REVATHI','SABHARI','DAP',5000),
('VIJAYA','BDPS','DCA',48000);


--CREATING SOFTWARE TABLE
CREATE TABLE SOFTWARE(PNAME VARCHAR(15),TITLE VARCHAR (20),DEVELOPIN VARCHAR(15),SCOST INT,DCOST INT,SOLD INT);


--INSERTING RECORDS TO SOFTWARE TABLE
INSERT INTO SOFTWARE VALUES
('MARY','README','CPP',300,1200,84),
('ANAND','PARACHUTES','BASIC',399.95,6000,43),
('ANAND','VIDEO TITLING','PASCAL',7500,16000,9),
('JULIANA','INVENTORY','COBOL',3000,3500,0),
('KAMALA','PAYROLL PKG.','DBASE',9000,20000,7),
('MARY','FINANCIAL ACCT.','ORACLE',18000,85000,4),
('MARY','CODE GENERATOR','C', 4500,20000,23),
('PATTRICK','README','CPP',300,1200,84),
('QADIR','BOMBS AWAY','ASSEMBLY',750,3000,11),
('QADIR','VACCINES','C',1900,3100,21),
('RAMESH','HOTEL MGMT.','DBASE',13000,35000,4),
('RAMESH','DEAD LEE','PASCAL',599.95,4500,73),
('REMITHA','PC UTILITIES','C',725,5000,51),
('REMITHA','TSR HELP PKG.','ASSEMBLY',2500,6000,7),
('REVATHI','HOSPITAL MGMT.','PASCAL',1100,75000,2),
('VIJAYA','TSR EDITOR','C',900,700,6);


--CREATING 'PROGRAMMER' TABLE
CREATE TABLE PROGRAMMER
(PNAME VARCHAR(15),DOB DATE,DOJ DATE,GENDER CHAR(1),PROF1 VARCHAR (15),PROF2 VARCHAR (10),SALARY INT);


INSERT INTO PROGRAMMER VALUES
('ANAND','1966-04-12','1992-04-21','M','PASCAL','BASIC',3200),
('ALTAF','1964-07-02','1990-11-13','M','CLIPPER','COBOL',2800),
('JULIANA','1960-01-31','1990-04-21','F','COBOL','DBASE',3000),
('KAMALA','1965-10-30','1992-01-02','F','C','DBASE',2900),
('MARY','1970-06-24','1991-02-01','F','CPP','ORACL',4500),
('NELSON','1985-09-11','1989-10-11','M','COBOL','DBASE',2500),
('PATTRICK','1965-11-10','1990-04-21','M','PASCAL','CLIPPER',2800),
('QADIR','1965-08-31','1991-04-21','M','ASSEMBLY','C',3000),
('RAMESH','1967-05-03','1991-02-28','M','PASCAL','DBASE',3200),
('REBECCA','1967-01-01','1990-12-01','F','BASIC','COBOL',2500),
('REMITHA','1970-04-19','1993-04-20','F','C','ASSEMBLY',3600),
('REVATHI','1969-12-02','1992-01-02','F','PASCAL','BASIC',3700),
('VIJAYA','1965-12-14','1992-05-02','F','FOXPRO','C',3500);


--VIEWING STUDIES,SOFTWARE AND PROGRAMMER TABLE
SELECT * FROM STUDIES;
SELECT * FROM SOFTWARE;
SELECT * FROM PROGRAMMER;

--------------------Assignment – SQL Queries Tasks to be done-----------------------

--1. Find out the selling cost AVG for packages developed in Pascal.
select AVG(SCOST) AS AVG_COST from SOFTWARE where DEVELOPIN='PASCAL';


--2. Display Names, Ages of all Programmers. 
SELECT PNAME,CONVERT(VARCHAR,DATEDIFF(YEAR,DOB,GETDATE())) + '  YEARS  ' AS PROGRAMMER_AGE FROM PROGRAMMER;


--3. Display the Names of those who have done the DAP Course
SELECT PNAME,COURSE FROM STUDIES WHERE COURSE='DAP';


--4. Display the Names and Date of Births of all Programmers Born in January. 
SELECT PNAME,DOB FROM PROGRAMMER WHERE MONTH(DOB)=1;

 
--5. What is the Highest Number of copies sold by a Package? 
SELECT * FROM SOFTWARE GROUP BY DEVELOPIN;


--6. Display lowest course Fee. 
SELECT MIN(COURSE_FEE) AS LOWEST_COURSEFEE FROM STUDIES;


--7. How many programmers done the PGDCA Course? 
SELECT COUNT(PNAME) AS TOTAL FROM STUDIES WHERE COURSE='PGDCA';


--8. How much revenue has been earned thru sales of Packages Developed in C.
SELECT SUM(SCOST*SOLD) FROM software WHERE DEVELOPIN='C'


--9. Display the Details of the Software Developed by Ramesh
SELECT * FROM SOFTWARE WHERE PNAME='RAMESH';


--10. How many Programmers Studied at Sabhari? 
SELECT COUNT(PNAME) AS TOTAL_NO_OF_PROGRAMMER_STUDIES_SABHARI FROM STUDIES WHERE INSTITUTE='SABHARI'; 


--11. Display details of Packages whose sales crossed the 2000 Mark. 
SELECT * FROM SOFTWARE WHERE SCOST>2000;


--12. Display the Details of Packages for which Development Cost have been recovered. 
SELECT * FROM SOFTWARE WHERE SCOST>DCOST;


--13. What is the cost of the costliest software development in Basic?
SELECT SUM(SCOST*SOLD) AS LEAST_COST FROM SOFTWARE WHERE DEVELOPIN='BASIC';


--14. How many Packages Developed in DBASE? 
SELECT COUNT(DEVELOPIN) AS TOTAL_NO_OF_PACKAGE  FROM SOFTWARE WHERE DEVELOPIN='DBASE';


--15. How many programmers studied in Pragathi? 
SELECT COUNT(*) AS NUMBER_OF_PROGRAMMER_FROM_PRAGATHI FROM STUDIES WHERE INSTITUTE='PRAGATHI';


--16. How many Programmers Paid 5000 to 10000 for their course? 
SELECT  COUNT(PNAME) AS NO_OF_PROGRAMMER FROM STUDIES WHERE COURSE_FEE>=5000 AND COURSE_FEE<=10000;


--17. What is AVG Course Fee 
SELECT AVG(COURSE_FEE) AS AVERAGE_COURSE_FEE FROM STUDIES;


--18. Display the details of the Programmers Knowing C.
SELECT * FROM PROGRAMMER WHERE PROF1='C' OR PROF2='C';


--19. How many Programmers know either COBOL or PASCAL
SELECT * FROM PROGRAMMER WHERE PROF1='COBOL' OR PROF2='PASCAL' OR PROF1='PASCAL' OR PROF2='COBOL';


--20. How many Programmers Don’t know PASCAL and C 
SELECT * FROM PROGRAMMER WHERE PROF1 not in ('PASCAL','C') AND PROF2 NOT IN ('PASCAL','C');
-------OR
SELECT COUNT(*) AS NO_OF_PROGRAMMER_DONT_KNOW_PASCAL_AND_C FROM PROGRAMMER 
WHERE PROF1 not in ('PASCAL','C') AND PROF2 NOT IN ('PASCAL','C');



--21. How old is the Oldest Male Programmer. 
SELECT TOP 1 DATEDIFF(YEAR,DOB,GETDATE()) AS OLDEST_PROGRAMMER  FROM PROGRAMMER WHERE GENDER='M'
ORDER BY DOB ;


--22. What is the AVG age of Female Programmers? 
SELECT AVG(DATEDIFF(YEAR,DOB,GETDATE())) AS AVG_FEMALE_PROGRAMMER_AGE FROM PROGRAMMER WHERE GENDER='F';


--23. Calculate the Experience in Years for each Programmer and Display with their names in Descending order. 
SELECT PNAME,DATEDIFF(YEAR,DOJ,GETDATE()) AS PROGRAMMER_EXPERIANCE FROM PROGRAMMER ORDER BY DOJ;


--24. Who are the Programmers who celebrate their Birthday’s During the Current Month?
SELECT PNAME,DOB, MONTH(DOB) AS BIRTH_MONTH FROM PROGRAMMER WHERE MONTH(DOB)=MONTH(GETDATE());


--25. How many Female Programmers are there?
SELECT COUNT(PNAME) AS NO_OF_FEMALE_PROGRAMMER FROM PROGRAMMER WHERE GENDER='F';


--26. What are the Languages studied by Male Programmers. 
SELECT PNAME,PROF1,PROF2 FROM PROGRAMMER WHERE GENDER='M' ;


--27. What is the AVG Salary?
SELECT AVG(SALARY) AS AVG_SALARY FROM PROGRAMMER;


--28. How many people draw salary 2000 to 4000?
SELECT COUNT(PNAME) AS NO_OF_PROGRAMMER FROM PROGRAMMER WHERE SALARY>=2000 AND SALARY<=4000 ;
                -----OR------
SELECT * FROM PROGRAMMER WHERE SALARY>=2000 AND SALARY<=4000 ;
				-----OR------
SELECT COUNT(*) AS NO_OF_PROGRAMMER FROM PROGRAMMER WHERE SALARY BETWEEN 2000 AND 4000;



--29. Display the details of those who don’t know Clipper, COBOL or PASCAL
SELECT * FROM PROGRAMMER WHERE PROF1 NOT IN ('CLIPPER','COBOL','PASCAL')
AND PROF2 NOT IN ('CLIPPER','COBOL','PASCAL');


--30. Display the Cost of Package Developed By each Programmer. 
SELECT PNAME,SUM(DCOST) AS SUM_OF_COST FROM SOFTWARE GROUP BY PNAME;


--31. Display the sales values of the Packages Developed by the each Programmer
SELECT PNAME,SUM(SCOST*SOLD) AS SALE_VALUE  FROM SOFTWARE GROUP BY PNAME;


--32. Display the Number of Packages sold by Each Programmer. 
SELECT PNAME,SUM(SOLD) AS NUMBER_OF_UNITSOLD FROM SOFTWARE GROUP BY PNAME;


--33. Display the sales cost of the packages Developed by each Programmer Language wise. 
SELECT DEVELOPIN,SUM(SCOST*SOLD) AS SALE_COST_OF_PACKAGES FROM SOFTWARE GROUP BY DEVELOPIN;


---34. Display each language name with AVG Development Cost, AVG Selling Cost and AVG Price per Copy. 
SELECT 
DEVELOPIN,
AVG(DCOST) AS AVG_DEVLOP_COST,
AVG(SCOST) AS AVG_SELLING_COST,
AVG(ISNULL((SCOST*SOLD/SOLD),0)) AS AVG_PERUNIT
FROM SOFTWARE GROUP BY DEVELOPIN;


--35. Display each programmer’s name, costliest and cheapest Packages Developed by him or her. 
SELECT 
P.GENDER,
MIN(DCOST)AS LOWEST_DEVLOPING_COST

FROM SOFTWARE AS S INNER JOIN PROGRAMMER AS P ON S.PNAME=P.PNAME
GROUP BY P.GENDER
HAVING P.GENDER='M' OR  P.GENDER= 'F';



--36. Display each institute name with number of Courses, Average Cost per Course. 
SELECT 
INSTITUTE,
COUNT(COURSE) AS NO_OF_COURSE,
AVG(COURSE_FEE) AS AVG_COURSE_FEE
FROM STUDIES GROUP BY INSTITUTE;


--37. Display each institute Name with Number of Students. 
SELECT 
INSTITUTE,
COUNT(*) AS NUMBER_OF_STUDENT_STUDIES
FROM STUDIES GROUP BY INSTITUTE;


--38. Display Names of Male and Female Programmers. Gender also. 
SELECT PNAME,GENDER FROM PROGRAMMER;
-------OR---
SELECT PNAME,GENDER FROM PROGRAMMER ORDER BY GENDER DESC;


---39. Display the Name of Programmers and Their Packages. 
SELECT PNAME,DEVELOPIN FROM SOFTWARE;


--40. Display the Number of Packages in Each Language Except C and C++. 
SELECT DEVELOPIN,COUNT(*) AS NUMBER_OF_PACKAGE FROM SOFTWARE
GROUP BY DEVELOPIN HAVING DEVELOPIN NOT IN ('C','C++');


--41. Display the Number of Packages in Each Language for which Development Cost is less than 1000.SELECT DEVELOPIN,COUNT(*) AS NUMBER_OF_PACKAGE FROM SOFTWARE WHERE DCOST<1000 GROUP BY DEVELOPIN;--42. Display AVG Difference between SCOST, DCOST for Each PackageSELECT TITLE, AVG(SCOST-DCOST) AS AVG_DIFFERENCE_OF_SCOST_DCOST  FROM SOFTWARE GROUP BY TITLE;

--43. Display the total SCOST, DCOST and amount to Be Recovered for each 
--Programmer for Those Whose Cost has not yet been Recovered. 
select sum(SCOST) as total_scost, sum(DCOST) as total_dcost, sum(DCOST-(SCOST*SOLD)) as amount 
from software 
group by PNAME
having sum(DCOST)> SUM(SCOST*SOLD);--44. Display Highest, Lowest and Average Salaries for those earning more than 2000. SELECTMAX(SALARY) AS HIGHEST_SALARY,MIN(SALARY) AS LOWEST_SALARY,AVG(SALARY) AS AVG_SALARYFROM PROGRAMMER WHERE SALARY>2000;--45. Who is the Highest Paid C Programmers?SELECT * FROM PROGRAMMER WHERE SALARY =(SELECT MAX(SALARY) FROM PROGRAMMER WHERE PROF1 = 'C' OR PROF2 = 'C');   --------OR----SELECT TOP 1 PNAME,MAX(SALARY) AS HIGHEST_SALARY FROM PROGRAMMER WHERE PROF1='C' OR PROF2='C'GROUP BY PNAMEORDER BY HIGHEST_SALARY DESC;--46. Who is the Highest Paid Female COBOL Programmer?SELECT * FROM PROGRAMMER WHERE SALARY=(SELECT  MAX(SALARY) FROM PROGRAMMER WHERE PROF1='COBOL' OR PROF2='COBOL')AND GENDER='F';---47. Display the names of the highest paid programmers for each Language.
 WITH CTC AS 
 (SELECT PNAME, SALARY, PROF1 AS PROF FROM programmer
  UNION 
  SELECT PNAME, SALARY, PROF2 FROM programmer)
SELECT p1.PNAME, p1.PROF, p1.SALARY FROM CTC as p1
LEFT JOIN CTC as p2
ON p1.PROF = p2.PROF AND p1.SALARY < p2.SALARY
WHERE p2.PNAME IS NULL;


--48. Who is the least experienced Programmer
SELECT
PNAME,
DATEDIFF(YEAR,DOJ,GETDATE()) AS LEAST_P_EXP_YEAR
FROM PROGRAMMER WHERE DATEDIFF(YEAR,DOJ,GETDATE())=(SELECT MIN(DATEDIFF(YEAR,DOJ,GETDATE())) FROM PROGRAMMER);


--49. Who is the most experienced male programmer knowing PASCAL. 

SELECT max(
case
when dateadd(year, datediff(YEAR, doj, getdate()), doj)>getdate()
then datediff(YEAR, doj, getdate()) - 1
else
datediff(YEAR, doj, getdate()) end) As Most_experienced
from programmer
where prof1='pascal' or prof2='pascal';

--50. Which Language is known by only one Programmer? 
SELECT PROF1 FROM PROGRAMMER
GROUP BY PROF1 HAVING PROF1 NOT IN
(SELECT PROF2 FROM PROGRAMMER)
AND COUNT(PROF1)=1
UNION
SELECT PROF2 FROM PROGRAMMER
GROUP BY PROF2
HAVING PROF2 NOT IN
(SELECT PROF1 FROM PROGRAMMER)
AND COUNT(PROF2)=1;


--51. Who is the Above Programmer Referred in 50? 
CREATE TABLE #PSLang(PROF VARCHAR(20))

INSERT INTO #PSLang 
SELECT PROF1 FROM programmer 
GROUP BY PROF1 HAVING
PROF1 NOT IN (SELECT PROF2 FROM programmer) 
AND COUNT(PROF1)=1
UNION
SELECT PROF2 FROM programmer GROUP BY PROF2 HAVING
PROF2 NOT IN (SELECT PROF1 FROM programmer) 
AND COUNT(PROF2)=1

SELECT PNAME, PROF FROM programmer INNER JOIN #PSLang ON
PROF=PROF1 OR PROF=PROF2


--52.Who is the Youngest Programmer knowing DBASE?  
select  year(getdate())-year(DOB) as age , * 
from programmer
where year(getdate())-year(DOB) = (select min(year(getdate())-year(DOB)) as age 
                                   from programmer 
								   where PROF1 = 'DBASE' or PROF2 = 'DBASE' ) ;

--53. Which Female Programmer earning more than 3000 does not know C, C++, ORACLE or DBASE? 
select * from PROGRAMMER 
where  GENDER = 'F'
AND (PROF1 not in ('C','CPP','ORACLE','DBASE') OR PROF2 not in ('C','CPP','ORACLE','DBASE'))
AND SALARY > 3000 ;


--54. . Which Institute has most number of Students? 
SELECT TOP 1 INSTITUTE,COUNT(*) AS TOTAL_NO_OF_STUDENT FROM STUDIES GROUP BY INSTITUTE ORDER BY INSTITUTE DESC;


--55. What is the Costliest course? 
SELECT * FROM STUDIES WHERE COURSE_FEE= (SELECT MAX(COURSE_FEE) FROM STUDIES);


--56. Which course has been done by the most of the Students? 
SELECT TOP 5 
COUNT(*) AS NO_OF_DTUDENT_STUDY,
COURSE
FROM STUDIES GROUP BY COURSE ORDER BY NO_OF_DTUDENT_STUDY DESC;

--57. Which Institute conducts costliest course
SELECT INSTITUTE,COURSE,COURSE_FEE FROM STUDIES WHERE COURSE_FEE=(SELECT MAX(COURSE_FEE) FROM STUDIES);


--58. Display the name of the Institute and Course, which has below AVG course fee. 
SELECT INSTITUTE,COURSE ,COURSE_FEE FROM STUDIES WHERE COURSE_FEE<(SELECT AVG(COURSE_FEE) FROM STUDIES);


--59. Display the names of the courses whose fees are within 1000 (+ or -) of the Average Fee.
SELECT * FROM STUDIES WHERE COURSE_FEE <(SELECT AVG(COURSE_FEE)+1000 FROM STUDIES) AND
COURSE_FEE > (SELECT AVG(COURSE_FEE)-1000 FROM STUDIES);


--60. Which package has the Highest Development cost? 

SELECT * FROM SOFTWARE WHERE DCOST=(SELECT MAX(DCOST) FROM SOFTWARE);


--61. Which course has below AVG number of Students? 
CREATE TABLE AVG_COUNT( COURSENEW VARCHAR(10),COUNT_AVG INT )
INSERT INTO AVG_COUNT
SELECT COURSE,COUNT(*)  FROM STUDIES GROUP BY COURSE;

SELECT COURSENEW,COUNT_AVG FROM AVG_COUNT WHERE COUNT_AVG<=(SELECT AVG(COUNT_AVG) FROM AVG_COUNT);


--62. Which Package has the lowest selling cost?

SELECT PNAME,TITLE,DEVELOPIN,SCOST FROM SOFTWARE WHERE SCOST = (SELECT MIN(SCOST) FROM SOFTWARE);


--63. Who Developed the Package that has sold the least number of copies? 

SELECT  * FROM SOFTWARE WHERE SOLD=(SELECT MIN(SOLD) FROM SOFTWARE);


--64. Which language has used to develop the package, which has the highest sales amount? 
SELECT DEVELOPIN,DCOST FROM SOFTWARE WHERE SCOST=(SELECT MAX(SCOST) FROM SOFTWARE);


--65. How many copies of package that has the least difference between development and selling cost where sold. 
SELECT TITLE, SOLD FROM SOFTWARE 
WHERE TITLE = (SELECT TITLE FROM SOFTWARE WHERE (DCOST-SCOST)=(SELECT MIN(DCOST-SCOST) FROM SOFTWARE));


--66. Which is the costliest package developed in PASCAL. 
SELECT *  FROM  SOFTWARE WHERE DCOST=(SELECT MAX(DCOST) FROM SOFTWARE WHERE DEVELOPIN='PASCAL')


--67. Which language was used to develop the most number of Packages. 
SELECT TOP 1 COUNT(*) AS NO_OF_PAC_DEVLOPED,DEVELOPIN FROM SOFTWARE GROUP BY DEVELOPIN ORDER BY COUNT(*) DESC;


--68. Which programmer has developed the highest number of Packages?

select PNAME  from software 
where DEVELOPIN = (select max(DEVELOPIN) from software ) ;


--69. Who is the Author of the Costliest Package? 

SELECT PNAME,DEVELOPIN,DCOST FROM SOFTWARE WHERE DCOST= (SELECT MAX(DCOST) FROM SOFTWARE) ;

--70. Display the names of the packages, which have sold less than the AVG number of copies. 
SELECT  PNAME,TITLE,SOLD FROM SOFTWARE WHERE SOLD<(SELECT AVG(SOLD) FROM SOFTWARE);	


--71. Who are the authors of the Packages, which have recovered more than double the Development cost? 

SELECT  distinct PNAME FROM SOFTWARE WHERE SOLD*SCOST > 2*DCOST;


--72. Display the programmer Name and the cheapest packages developed by them in each language. 

select PNAME , TITLE  
FROM software
WHERE DCOST in (select distinct min(DCOST) as minimun
                FROM software group by DEVELOPIN );


--73. Display the language used by each programmer to develop the Highest Selling and Lowest-selling package.

SELECT PNAME,DEVELOPIN,SOLD FROM SOFTWARE WHERE SOLD IN (SELECT MAX(SOLD) FROM SOFTWARE ) 
UNION
SELECT PNAME,DEVELOPIN,SOLD FROM SOFTWARE WHERE SOLD IN (SELECT MIN(SOLD)FROM SOFTWARE)


--74. Who is the youngest male Programmer born in 1965? 

SELECT TOP 1 DATEDIFF(DAY,DOB,GETDATE()) AS CALCULATED_AGE,  * FROM PROGRAMMER
WHERE YEAR(DOB)=1965 AND GENDER='M' ORDER BY CALCULATED_AGE;


--75. Who is the oldest Female Programmer who joined in 1992? 

SELECT TOP 1 DATEDIFF(DAY,DOB,GETDATE()) AS AGE_CALCULATED ,* FROM PROGRAMMER
WHERE YEAR(DOJ)=1992 AND GENDER='F' ORDER BY AGE_CALCULATED DESC;

--76. In which year was the most number of Programmers born.
SELECT TOP 1 COUNT(*) AS COUNTED, YEAR(DOB) AS BORN_YEAR FROM PROGRAMMER
GROUP BY YEAR(DOB) ORDER BY COUNTED DESC;


--77. In which month did most number of programmers join? 

SELECT TOP 1 COUNT(*) AS COUNTED, MONTH(DOJ) AS JOIN_YEAR FROM PROGRAMMER
GROUP BY MONTH(DOJ) ORDER BY COUNTED DESC;


--78. In which language are most of the programmer’s proficient. 

CREATE TABLE #PCNT (PR VARCHAR(20), CNT INT)
CREATE TABLE #PsCNT (PRs VARCHAR(20), sCNT INT)

INSERT INTO #PCNT
SELECT PROF1, COUNT(PROF1) FROM programmer GROUP BY PROF1 UNION ALL
SELECT PROF2, COUNT(PROF2) FROM programmer GROUP BY PROF2

INSERT INTO #PsCNT
SELECT PR, SUM(CNT) FROM #PCNT GROUP BY PR

SELECT PRs, sCNT FROM #PsCNT WHERE sCNT = 
(SELECT MAX(sCNT) FROM #PsCNT)

--79. Who are the male programmers earning below the AVG salary of Female Programmers?

SELECT PNAME,SALARY FROM PROGRAMMER WHERE GENDER='M' AND
SALARY<(SELECT AVG(SALARY) FROM PROGRAMMER WHERE GENDER='F');

--80. Who are the Female Programmers earning more than the Highest Paid? 
SELECT PNAME,SALARY FROM PROGRAMMER WHERE GENDER='F'
AND SALARY >(SELECT MAX(SALARY) FROM PROGRAMMER WHERE GENDER='F');


--81. Which language has been stated as the proficiency by most of the Programmers? 
SELECT PROF1 FROM PROGRAMMER GROUP BY PROF1 HAVING PROF1=(SELECT MAX(PROF1) FROM PROGRAMMER)
UNION
SELECT PROF2 FROM PROGRAMMER GROUP BY PROF2 HAVING PROF2=(SELECT MAX(PROF2) FROM PROGRAMMER)

--82. Display the details of those who are drawing the same salary.

SELECT * FROM PROGRAMMER WHERE 
SALARY IN (SELECT SALARY FROM PROGRAMMER GROUP BY SALARY HAVING COUNT(SALARY) >1)


--83. Display the details of the Software Developed by the Male Programmers Earning More than 3000/-. 

SELECT SOF.*,PRO.GENDER, PRO.SALARY FROM SOFTWARE AS SOF LEFT JOIN PROGRAMMER AS PRO ON SOF.PNAME=PRO.PNAME
WHERE PRO.GENDER='M' AND PRO.SALARY>3000;


--84. Display the details of the packages developed in Pascal by the Female Programmers. 
SELECT SOF.*,PRO.GENDER FROM SOFTWARE AS SOF LEFT JOIN PROGRAMMER AS PRO ON SOF.PNAME=PRO.PNAME
WHERE SOF.DEVELOPIN='PASCAL' AND PRO.GENDER='F';

--85. Display the details of the Programmers who joined before 1990. 
SELECT * FROM PROGRAMMER WHERE YEAR(DOJ)<1990;


--86. Display the details of the Software Developed in C By female programmers of Pragathi. 
SELECT SOF.*,STU.INSTITUTE,PRO.GENDER FROM SOFTWARE AS SOF LEFT JOIN PROGRAMMER AS PRO ON SOF.PNAME=PRO.PNAME 
INNER JOIN STUDIES AS STU ON SOF.PNAME=STU.PNAME 
WHERE SOF.DEVELOPIN='C' AND PRO.GENDER='F' AND STU.INSTITUTE='PRAGATHI';


--87. Display the number of packages, No. of Copies Sold and sales value of each programmer institute wise.

SELECT STU.INSTITUTE, count(DCOST) as num_of_packages , count(SOLD) as num_of_copies_sold,sum(SCOST*SOLD) as sales_value 
from STUDIES AS STU
INNER JOIN SOFTWARE AS SOF
ON STU.PNAME=SOF.PNAME GROUP BY INSTITUTE;

--88. Display the details of the software developed in DBASE by Male Programmers, 
--who belong to the institute in which most number of Programmers studied. 
CREATE TABLE #INST (INS VARCHAR(20), CNT INT)

INSERT INTO #INST
SELECT INSTITUTE, COUNT(PNAME) FROM studies GROUP BY INSTITUTE

SELECT DISTINCT SW.* FROM software AS SW, programmer AS PG, studies AS ST, #INST
WHERE DEVELOPIN='DBASE' AND GENDER='M' AND SW.PNAME = PG.PNAME 
AND INSTITUTE = INS AND CNT= (SELECT MAX(CNT) FROM #INST);

--89. Display the details of the software Developed by the male programmers 
--Born before 1965 and female programmers born after 1975. 
select * from programmer
where GENDER = 'M' and year(DOB) < 1965 
union
select * from programmer
where GENDER = 'F' and year(DOB) > 1975


--90. Display the details of the software that has developed in the language which 
--is neither the first nor the second proficiency of the programmers. 
select s.* , p.* from software as s 
inner join programmer as p
on s.PNAME = p.PNAME
where s.DEVELOPIN <> p.PROF1 and s.DEVELOPIN <> p.PROF2

 
--91. Display the details of the software developed by the male students of Sabhari. 
SELECT SOF.*,STU.INSTITUTE,PRO.GENDER FROM SOFTWARE AS SOF 
LEFT JOIN PROGRAMMER AS PRO ON SOF.PNAME=PRO.PNAME
INNER JOIN STUDIES AS STU ON STU.PNAME=SOF.PNAME
WHERE PRO.GENDER='M' AND STU.INSTITUTE='SABHARI';

--92. Display the names of the programmers who have not developed any packages. 
SELECT PRO.*,SOF.DEVELOPIN FROM PROGRAMMER AS PRO 
LEFT JOIN SOFTWARE AS SOF ON PRO.PNAME=SOF.PNAME
WHERE SOF.DEVELOPIN IS NULL;

--93. What is the total cost of the Software developed by the programmers of Apple?
SELECT SUM(SCOST*SOLD) AS TOTAL_COST FROM STUDIES AS STU
INNER JOIN SOFTWARE AS SOF
ON STU.PNAME=SOF.PNAME
WHERE STU.INSTITUTE = 'APPLE' ;

--94. Who are the programmers who joined on the same day? 
select PNAME, DOJ from programmer 
where DOJ in (select DOJ from programmer
			  group by DOJ
			  having count(*) >1);

--95. Who are the programmers who have the same Prof2? 
select PNAME from programmer 
where prof2 in (select prof2 from programmer 
                group by prof2 
				having count(*) >1);

               --ANOTHER--

select PNAME from programmer
where prof2 = any(select prof2 from programmer
                  group by prof2 
				  having count(*) >1);

--96. Display the total sales value of the software, institute wise. 

SELECT STU.INSTITUTE,SUM(SOF.SCOST*SOF.SOLD) AS TOTAL_SALES FROM SOFTWARE AS SOF 
INNER JOIN STUDIES AS STU ON SOF.PNAME=STU.PNAME 
GROUP BY STU.INSTITUTE;


--97. In which institute does the person who developed the costliest package studied. 
select s.INSTITUTE from studies as s
inner join programmer as p
on s.PNAME = p.PNAME
where p.SALARY = (select max(SALARY) from programmer)
group by s.INSTITUTE ;

--98. Which language listed in prof1, prof2 has not been used to develop any package. 
select PROF1 from programmer 
where PROF1 not in(select DEVELOPIN from software) 
union 
select PROF2 from programmer
where PROF2 not in(select DEVELOPIN from software);

--99. How much does the person who developed the highest selling package earn and what course did HE/SHE undergo. 
select s.PNAME, p.SALARY, s.INSTITUTE, so.SCOST from studies as s
inner join software as so 
on s.PNAME = so.PNAME
inner join programmer as p 
on so.PNAME = p.PNAME
where SCOST = (select max(SCOST) from software);

--100. What is the AVG salary for those whose software sales is more than 50,000/-. 
select avg(SALARY) as avg_salary, s.PNAME from software as s
inner join programmer as p 
on s.PNAME = p.PNAME
where (SCOST*SOLD) > 50000 
group by s.PNAME ;

--101. . How many packages were developed by students, who studied in institute that charge the lowest course fee? 
select count(TITLE) as count  , s.PNAME from  studies as s 
inner join software as so
on s.PNAME = so.PNAME 
where s.COURSE_FEE = (select min(COURSE_FEE) from studies) 
group by s.PNAME, COURSE_FEE

--102. How many packages were developed by the person who developed the cheapest package, where did HE/SHE study?
select count(*) as count , s.INSTITUTE from  studies as s 
inner join software as so
on s.PNAME = so.PNAME 
where so.DCOST = (select min(DCOST) from software) 
group by s.INSTITUTE

--103. How many packages were developed by the female programmers earning more than the highest paid male programmer? 
select  count(DEVELOPIN) as count from software as s
inner join programmer as p 
on s.PNAME = p.PNAME
where p.SALARY > (select max(SALARY) from programmer
                   where GENDER = 'M')
and p.GENDER = 'F' 

--104. How many packages are developed by the most experienced programmer form BDPS. 
select count(*) as counter, p.DOJ from software s,programmer p
where p.pname=s.pname group by doj 
having min(doj)=(select min(doj)
from studies st,programmer p, software s
where p.pname=s.pname and st.pname=p.pname and (institute='bdps'));

--105. List the programmers (form the software table) and the institutes they studied. 
 select PNAME, INSTITUTE from studies
 where PNAME not in(select PNAME from software);

--106. List each PROF with the number of Programmers having that PROF and the number of the packages in that PROF. 
select count(*) as count ,sum(scost*sold-dcost) as profit , DEVELOPIN as PROFIT from software
where DEVELOPIN in (select prof1 from programmer) group by DEVELOPIN
union 
select count(*) as count ,sum(scost*sold-dcost) as PROFIT , DEVELOPIN from software
where DEVELOPIN in (select PROF2 from programmer) group by DEVELOPIN;

--107. List the programmer names (from the programmer table) and No. Of Packages each has developed. 
select p.PNAME, count(DEVELOPIN) from software as s
inner join programmer as p 
on s.PNAME = p.PNAME
group by p.PNAME;




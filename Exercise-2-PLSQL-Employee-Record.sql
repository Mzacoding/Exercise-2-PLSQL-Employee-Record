
SET VERIFY OFF
SET SERVEROUTPUT ON 
-- Declaring varable 
DECLARE 

--Creating record
TYPE EMPLOYEE IS RECORD(
salary   o_emp.SAL%TYPE,
hiredate         o_emp.HIREDATE%TYPE,
staff_name        o_emp.ENAME%TYPE);

--creating varables
staff_record EMPLOYEE ;
message VARCHAR2(30);
annual_salary   o_emp.SAL%TYPE;
employee_number   o_emp.EMPNO%TYPE:=&employeeNo;
 
BEGIN 

--Select from table emp
SELECT SAL,HIREDATE,ENAME
INTO staff_record 
FROM o_emp
WHERE EMPNO=employee_number;

annual_salary :=staff_record.salary*12;
--Dispaly message based of criteria

IF annual_salary <TO_NUMBER('18000.00') THEN 
    message:='Staff earn less';
	
 IF staff_record.staff_name LIKE('%AR%') THEN 
    message:='Either Martin or Clarke';
	 
ELSIF staff_record.staff_name LIKE('%AR%') THEN 
    message:='Either Martin or Clarke';
	
ELSIF TO_CHAR(staff_record.hiredate,'YYYY') IN (1980) THEN 
    message:='Foundation member';
	
ELSE 
     message:='Criteria do not exist';
	
END IF;

--Printing Results
 
DBMS_OUTPUT.PUT_LINE(message);
 
END;
/

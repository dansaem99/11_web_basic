/*

	# 조인(JOIN) 
    
		- 조인은 두 개 이상의 테이블을 결합하는 연산이다.
		- 서로 다른 테이블에서 데이터를 가져오려면 조인 연산을 해야 한다. 
		- 주로 주키(PRIMARY KEY)와 참조키(FOREIGN KEY)를 기준으로 테이블을 조인 연산한다.
        - 대표적인 조인은 INNER , LEFT(LEFT OUTER), RIGHT(RIGHT OUTER) 조인이 있다.
        - INNER JOIN은 INNER를 생략한 JOIN으로 사용가능하다.        Ex) INNER JOIN , JOIN
        - LEFT JOIN은 OUTER를 생략한 LEFT JOIN으로 사용가능하다.    Ex) LEFT OUTER JOIN , LEFT JOIN
        - RIGHT JOIN은 OUTER를 생략한 RIGHT JOIN으로 사용가능하다.  Ex) RIGHT OUTER JOIN , RIGHT JOIN
 		- 테이블명은 주로 별칭을 사용한다.
 		- 체계적이고 효율적인 설계를 위한 '정규화 과정'을 이해해야 한다.
   
		[형식]
		
		SELECT
				*
		FROM
				(TABLE1 ALIAS)
			INNER(LEFT,RIGHT) JOIN (TABLE2 ALIAS)
								ON (CONDITION)

*/

USE SQL_ADVANCED;

CREATE TABLE CLASS (
	CLASS_CD   VARCHAR(20),
	CLASS_NM   VARCHAR(20),
	LOCATION   VARCHAR(20)
);


CREATE TABLE STUDENT (
    STUDENT_CD 	 VARCHAR(20),
	STUDENT_NM 	 VARCHAR(20),
	CLASS_CD 	 VARCHAR(20)
);


INSERT INTO CLASS VALUES("C1" , "C" , "101호");
INSERT INTO CLASS VALUES("C2" , "JAVA" , "102호");
INSERT INTO CLASS VALUES("C3" , "PYTHON" , "201호");
INSERT INTO CLASS VALUES("C4" , "SPRING" , "202호");
INSERT INTO CLASS VALUES("C5" , "JSP" , "301호");
INSERT INTO CLASS VALUES("C6" , "FRONT_END" , "302호");
INSERT INTO CLASS VALUES("C7" , "CLOUD" , "303호");

INSERT INTO STUDENT VALUES("S1" , "학생1" , "C1");
INSERT INTO STUDENT VALUES("S2" , "학생2" , "C2");
INSERT INTO STUDENT VALUES("S3" , "학생3" , "C3");
INSERT INTO STUDENT VALUES("S4" , "학생4" , "C4");
INSERT INTO STUDENT VALUES("S5" , "학생5" , "C4");
INSERT INTO STUDENT VALUES("S6" , "학생6" , "C4");
INSERT INTO STUDENT VALUES("S7" , "학생7" , "C5");
INSERT INTO STUDENT VALUES("S8" , "학생8" , NULL);
INSERT INTO STUDENT VALUES("S9" , "학생9" , NULL);
INSERT INTO STUDENT VALUES("S10" , "학생10" , NULL);

SELECT * FROM CLASS;
SELECT * FROM STUDENT;

# WHERE절을 이용한 두 테이블의 join (oracle 조인)

SELECT
		*
FROM
		CLASS , STUDENT
WHERE
		CLASS.CLASS_CD = STUDENT.CLASS_CD;
#--------------------------------------------

SELECT
			C.*, 					# CLASS 테이블의 모든 컬럼
            S.*					#STUDENT 테이블의 모든 컬럼
FROM
			CLASS C, 			# AS 는 생략가능하다.
            STUDENT S
WHERE
			C.CLASS_CD = S.CLASS_CD;		        
 #------------------------------------------------       
SELECT
			C.CLASS_NM AS CLASS_CD,
            C.LOCATION AS LOCATION,
            S.STUDENT_NM AS STUDENT_NM
FROM
			CLASS C,
            STUDENT S
WHERE
			C.CLASS_CD = S.CLASS_CD;	
		
# INNER JOIN 사용예시  (ANSI 조인) 

SELECT
		*
FROM
		CLASS  
		  JOIN STUDENT
			ON CLASS.CLASS_CD = STUDENT.CLASS_CD;  
#----------------------------------------------

SELECT
		*
FROM
		CLASS  T1
		  JOIN STUDENT T2
			ON T1.CLASS_CD = T2.CLASS_CD; 
		   
# LEFT 조인 사용 예시



# RIGHT 조인 사용 예시

			   	 
# (연습 예시 1) 2층에서 수업을 듣는 학생이름 , 과목이름 , 강의실위치를 조회하시오.			   	 


# (연습 예시 2) 각층별로 수업을 듣는 학생수를 조회하고 학생수가 많은 순서대로 조회하시오.

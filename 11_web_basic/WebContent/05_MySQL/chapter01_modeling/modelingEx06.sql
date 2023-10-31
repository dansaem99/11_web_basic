/*

	# 제약 조건 (constraint)
	
	    -  데이터의 무결성을 지키기위해서 유효하지 않은 데이터가 입력받는 것을 예방하기위한 제약조건을 지정할 수 있다.
	
		1) NOT NULL : NULL 금지
		2) UNIQUE   : 중복값입력 금지 (단 NULL은 중복입력가능)
		3) CHECK    : 특정 컬럼의 입력 가능한 값의 범위를 지정
		4) DEFAULT  : 초깃값 지정
		5) PRIMARY KEY(PK) : 
							테이블에 유일하게 구분되는 키로 주 식별자, 주키 등으로 불린다.
							PRIMARY KEY는 유일한 값이기 때문에 중복된 값을 가질 수 없으며 NULL 값이 입력될 수 없다. (NOT NULL과 UNIQUE 제약 조건의 특징을 모두 가진다.)
							
		6) FOREIGN KEY(FK)  :
							외부키, 참조키, 외부 식별자 등으로 불린다.
							FOREIGN KEY 는 외부 테이블에서 참고하려는 주 키 (primary key) 를 의미한며 테이블으을 연결해주는 역할을 한다.
							FOREIGN KEY 는 참조관계의 기본 키와 같은 속성을 가진다.
							'외래 키 테이블'에 데이터를 입력할 때는 꼭 '기준 테이블'을 참조해서 입력하므로 반드시 '기준 테이블'에 존재하는 데이터만 입력이 가능하다.
							'외래 키 테이블'이 참조하는 '기준 테이블'의 열은 반드시 PK이거나 UNIQUE 제약 조건이 설정되어 있어야 한다.
		
        [ 형식 ]
	
		  (CONSTRAINT [CONSTRAINT_NAME]생략가능) FOREIGN KEY (자식 테이블 컬럼 명) REFERENCES 참조테이블(부모 테이블 기본키명) 
		  ON UPDATE 옵션 ON DELETE 옵션
		  
            - 옵션 상세
          
			 CASCADE     : 참조되는 테이블에서 데이터를 삭제하거나 수정하면 참조하는 테이블에서도 삭제와 수정이 같이 이루어짐
			 SET NULL    : 참조되는 테이블에서 데이터를 삭제하거나 수정하면 참조하는 테이블의 데이터는 NULL로 변경됨
			 RESTRICT    : 참조하는 테이블에 데이터가 남아 있으면 참조되는 테이블의 데이터를 삭제하거나 수정할 수 없음(기본설정)
             NO ACTION   : 참조되는 테이블에서 데이터를 삭제하거나 수정하면 참조하는 테이블의 데이터는 변경되지 않음


	 # ERD Diagram 생성하기
	 
	 	- Database태그 > Reverse Engineer > Stored Connection 선택 및 username , password 인증 > schemas 선택

*/

CREATE DATABASE CONSTRAINTS_TEST;
USE CONSTRAINTS_TEST;

# 1) 제약사항 없음
CREATE TABLE TEST1 (
	PRODUCT_CD INT,
    PRODUCT_NM VARCHAR(20),
    PRICE	   INT,
    REG_DT     TIMESTAMP
);

INSERT INTO TEST1 (PRODUCT_CD , PRICE) VALUES(-1,-1); 						  				# SUCCESS
INSERT INTO TEST1 VALUES(1, '상품1', 1000 , NOW()); 						  					# SUCCESS
INSERT INTO TEST1(PRODUCT_NM , PRICE , REG_DT) VALUES('상품2', 2000 , NOW()); 	# SUCCESS 
INSERT INTO TEST1(PRODUCT_CD , PRICE , REG_DT) VALUES(3, 3000 , NOW());       	# SUCCESS
INSERT INTO TEST1(PRICE , REG_DT) VALUES(4000 , NOW());      				  				# SUCCESS
INSERT INTO TEST1(REG_DT) VALUES(NOW()); 									  					# SUCCESS
SELECT * FROM TEST1;


# 2) NOT NULL : NULL 입력 금지
CREATE TABLE TEST2 (
	PRODUCT_CD INT  NOT NULL,
    PRODUCT_NM VARCHAR(20) NOT NULL,
    PRICE	   INT,
    REG_DT     TIMESTAMP
);


INSERT INTO TEST2 VALUES(1, '상품1', 1000 , NOW()); 						 					 # SUCCESS
INSERT INTO TEST2(PRODUCT_NM , PRICE , REG_DT) VALUES('상품2', 2000 , NOW());	 # ERROR (PRODUCT_CD > NOT NULL 제약위반)
INSERT INTO TEST2(PRODUCT_CD , PRICE , REG_DT) VALUES(3, 3000 , NOW());   	     # ERROR (PRODUCT_NM > NOT NULL 제약위반) 
INSERT INTO TEST2(PRICE , REG_DT) VALUES(4000 , NOW());      								 # ERROR (PRODUCT_CD , PRODUCT_NM > NOT NULL 제약위반) 
INSERT INTO TEST2(REG_DT) VALUES(NOW()); 														 # ERROR (PRODUCT_CD , PRODUCT_NM > NOT NULL 제약위반) 
INSERT INTO TEST2(PRODUCT_CD , PRODUCT_NM) VALUES(6 , '상품6'); 					 # SUCCESS

SELECT * FROM TEST2;


# 3) UNIQUE : 중복데이터 입력 금지 ( NULL 값은 중복으로 인식하지 않는다. )
CREATE TABLE TEST3 (
	PRODUCT_CD INT UNIQUE,
    PRODUCT_NM VARCHAR(20) UNIQUE,
    PRICE	   INT,
    REG_DT     TIMESTAMP
);

INSERT INTO TEST3 VALUES(1, '상품1', 1000 , NOW()); 						  					#  SUCCESS
INSERT INTO TEST3(PRODUCT_NM , PRICE , REG_DT) VALUES('상품2', 2000 , NOW()); 	#  SUCCESS
INSERT INTO TEST3(PRODUCT_CD , PRICE , REG_DT) VALUES(3, 3000 , NOW());      		#  SUCCESS
INSERT INTO TEST3(PRICE , REG_DT) VALUES(4000 , NOW());      				  				#  SUCCESS
INSERT INTO TEST3(REG_DT) VALUES(NOW()); 									  					#  SUCCESS
INSERT INTO TEST3(PRODUCT_CD , PRODUCT_NM) VALUES(1 , '상품6'); 			 		#  ERROR (PRODUCT_CD > UNIQUE 제약위반) 
INSERT INTO TEST3(PRODUCT_CD , PRODUCT_NM) VALUES(7 , '상품1');				  		#  ERROR (PRODUCT_NM > UNIQUE 제약위반)
SELECT * FROM TEST3;


# 4) CHECK : 입력데이터 범위 지정
CREATE TABLE TEST4 (
	PRODUCT_CD INT CHECK (PRODUCT_CD > 0 AND PRODUCT_CD <= 100),
    PRODUCT_NM VARCHAR(20),
    PRICE	  		   INT,
    REG_DT     	   TIMESTAMP
);

INSERT INTO TEST4 (PRICE) VALUES(-1); 					 # SUCCESS
INSERT INTO TEST4 (PRICE) VALUES(101); 				 # SUCCESS
INSERT INTO TEST4 (PRODUCT_CD) VALUES(-1);		 # ERROR (PRODUCT_CD > CHECK 제약 위반)
INSERT INTO TEST4 (PRODUCT_CD) VALUES(101);       # ERROR (PRODUCT_CD > CHECK 제약 위반)
INSERT INTO TEST4 (PRODUCT_CD) VALUES(1);			 # SUCCESS
INSERT INTO TEST4 (PRODUCT_CD) VALUES(100);		 # SUCCESS
SELECT * FROM TEST4;


# 5) DEFAULT : 초깃값 지정
CREATE TABLE TEST5 (
	PRODUCT_CD INT,
    PRODUCT_NM VARCHAR(20),
    PRICE	  		   INT				   DEFAULT 99999,
    REG_DT     	   TIMESTAMP   DEFAULT '2023-01-01'
);

INSERT INTO TEST5 VALUES(1, '상품1', 1000 , NOW()); 							 #	SUCCESS
INSERT INTO TEST5(PRODUCT_CD , PRODUCT_NM) VALUES(2 , '상품2'); 	 #	SUCCESS (초깃값 적용)
INSERT INTO TEST5(PRODUCT_CD , PRODUCT_NM) VALUES(3 , '상품3');		 #	SUCCESS (초깃값 젇용)
INSERT INTO TEST5 VALUES(4 , '상품4' , 4000 , '2022-12-31');				 # SUCCESS
SELECT * FROM TEST5;


# 6) AUTO_INCREMENT : 인덱스 +1씩 자동증가 ( PRIMARY KEY 속성과 같이 사용한다. )
CREATE TABLE TEST6 (
	PRODUCT_CD INT AUTO_INCREMENT PRIMARY KEY, 
    PRODUCT_NM VARCHAR(20),
    PRICE	   		   INT,
    REG_DT     	   TIMESTAMP 
);

INSERT INTO TEST6 VALUES(1, '상품1', 1000 , NOW()); 			 		 # SUCCESS
INSERT INTO TEST6(PRODUCT_NM) VALUES('상품2'); 				    	 # SUCCESS
INSERT INTO TEST6(PRODUCT_NM) VALUES('상품3');				   		 # SUCCESS	
INSERT INTO TEST6 VALUES(10 , '상품10' , 10000 , '2022-12-31');	 # SUCCESS
INSERT INTO TEST6(PRODUCT_NM) VALUES('상품11');				  		 # SUCCESS (마지막 데이터 이후부터 1증가)

SELECT * FROM TEST6;


# 7) PRIMARY KEY  : NOT NULL + UNIQUE : 대표키다. / 메인키
CREATE TABLE TEST7 (
	PRODUCT_CD INT , # PRIMARY KEY,
    PRODUCT_NM VARCHAR(20)  ,
    PRICE	   INT,
    REG_DT     TIMESTAMP,
    PRIMARY KEY (PRODUCT_CD)
    # PRIMARY KEY는 맨위에 넣는다.
);

INSERT INTO TEST7 VALUES(1, '상품1', 1000 , NOW()); 						  					 # SUCCESS
INSERT INTO TEST7(PRODUCT_NM , PRICE , REG_DT) VALUES('상품2', 2000 , NOW());	 # ERROR (PRODUCT_CD > NOT NULL 제약위반)
INSERT INTO TEST7(PRODUCT_CD , PRICE , REG_DT) VALUES(3, 3000 , NOW());       	 # SUCCESS
INSERT INTO TEST7(PRICE , REG_DT) VALUES(4000 , NOW());      				  				 # ERROR (PRODUCT_CD > NOT NULL 제약위반)
INSERT INTO TEST7(REG_DT) VALUES(NOW()); 									  					 # ERROR (PRODUCT_CD > NOT NULL 제약위반)
INSERT INTO TEST7(PRODUCT_CD , PRODUCT_NM) VALUES(6 , '상품6'); 			  		 # SUCCESS
INSERT INTO TEST7(PRODUCT_CD , PRODUCT_NM) VALUES(6 , '상품7'); 			  		 # ERROR (PRODUCT_CD > UNIQUE 제약위반)
SELECT * FROM TEST7;


# 8~10) PRIMARY KEY , FOREIGN KEY = 외부키 , 참조 / 조인할때 쓴다.

# 8) 메인키와 참조키를 사용하지 않았을 경우의 예시
CREATE TABLE TEST8_1(
	PRODUCT_CD INT,
    PRODUCT_NM VARCHAR(20),
    PRICE      VARCHAR(20) 	   DEFAULT 10000,
    REG_DT     TIMESTAMP	   DEFAULT NOW()
); 

INSERT INTO TEST8_1(PRODUCT_CD , PRODUCT_NM) VALUES (1 , '상품1'); 
INSERT INTO TEST8_1(PRODUCT_CD , PRODUCT_NM) VALUES (2 , '상품2'); 
INSERT INTO TEST8_1(PRODUCT_CD , PRODUCT_NM) VALUES (3 , '상품3'); 

CREATE TABLE TEST8_2(
	ORDER_CD  VARCHAR(10),
    MEMBER_ID VARCHAR(20),
    PRODUCT_CD INT
);

INSERT INTO TEST8_2 VALUES ('O1' , '유저1' , 1); 
INSERT INTO TEST8_2 VALUES ('O2' , '유저2' , 2); 
INSERT INTO TEST8_2 VALUES ('O3' , '유저3' , 3);
INSERT INTO TEST8_2 VALUES ('O4' , '유저3' , 3); 
INSERT INTO TEST8_2 VALUES ('O5' , '유저3' , 3);  
INSERT INTO TEST8_2 VALUES ('O6' , '유저1' , 4); 	# 메인테이블과 참조테이블 사이에서 데이터의 차이가 발생
INSERT INTO TEST8_2 VALUES ('O7' , '유저2' , 5); 	# 메인테이블과 참조테이블 사이에서 데이터의 차이가 발생

UPDATE TEST8_1 SET PRODUCT_CD = 11 WHERE PRODUCT_CD = 1; 	# 메인테이블과 참조테이블 사이에서 데이터의 차이가 발생
UPDATE TEST8_1 SET PRODUCT_CD = 22 WHERE PRODUCT_CD = 2; 	# 메인테이블과 참조테이블 사이에서 데이터의 차이가 발생
DELETE FROM TEST8_1 WHERE PRODUCT_CD = 3;                			# 메인테이블과 참조테이블 사이에서 데이터의 차이가 발생

SELECT * FROM TEST8_1;
SELECT * FROM TEST8_2;



# 9) 메인키와 참조키 설정 예시
CREATE TABLE TEST9_1(
	PRODUCT_CD INT PRIMARY KEY,		#메인키 설정 
    PRODUCT_NM VARCHAR(20),
    PRICE      VARCHAR(20) DEFAULT 10000,
    REG_DT     TIMESTAMP   DEFAULT NOW()
); 

INSERT INTO TEST9_1(PRODUCT_CD , PRODUCT_NM) VALUES (1 , '상품1'); 
INSERT INTO TEST9_1(PRODUCT_CD , PRODUCT_NM) VALUES (2 , '상품2'); 
INSERT INTO TEST9_1(PRODUCT_CD , PRODUCT_NM) VALUES (3 , '상품3'); 

CREATE TABLE TEST9_2(
	ORDER_CD  VARCHAR(10),
    MEMBER_ID VARCHAR(20),
    PRODUCT_CD INT ,
    #FOREIGN KEY (PRODUCT_CD) REFERENCES TEST9_1(PRODUCT_CD) # 참조키 설정
	CONSTRAINT PRODUCT_CD_REF1 FOREIGN KEY (PRODUCT_CD) REFERENCES TEST9_1(PRODUCT_CD) # 참조키 설정 이게 앞에 변수명을 만들어서 FM방식
);

INSERT INTO TEST9_2 VALUES ('O1' , '유저1' , 1); 
INSERT INTO TEST9_2 VALUES ('O2' , '유저2' , 2); 
INSERT INTO TEST9_2 VALUES ('O3' , '유저3' , 3);
INSERT INTO TEST9_2 VALUES ('O4' , '유저3' , 3); 
INSERT INTO TEST9_2 VALUES ('O5' , '유저3' , 3);  
INSERT INTO TEST9_2 VALUES ('O6' , '유저1' , 4); 	# ERROR (메인키에 없는 데이터 > KEY 참조 제약 위반)
INSERT INTO TEST9_2 VALUES ('O7' , '유저2' , 5); 	# ERROR (메인키에 없는 데이터 > KEY 참조 제약 위반)

UPDATE TEST9_1 SET PRODUCT_CD = 11 WHERE PRODUCT_CD = 1;		# 참조키가 있을 겨우 메인키의 데이터만 수정 불가
UPDATE TEST9_1 SET PRODUCT_CD = 22 WHERE PRODUCT_CD = 2; 	# 참조키가 있을 겨우 메인키의 데이터만 수정 불가
DELETE FROM TEST9_1 WHERE PRODUCT_CD = 3;                			# 참조키가 있을 겨우 메인키의 데이터만 삭제 불가
# 참고키를 바꾸고 메인키를 바꾸면 수정이 가능하다.

SELECT * FROM TEST9_1;
SELECT * FROM TEST9_2;



# 10) 메인키와 참조키 옵션 적용 예시 / CASCASDE 메인키를 수정하면 참조키도 같이 수정된다.
CREATE TABLE TEST10_1(
	PRODUCT_CD INT PRIMARY KEY, # 메인키 설정 
    PRODUCT_NM VARCHAR(20),
    PRICE      VARCHAR(20) DEFAULT 10000,
    REG_DT     TIMESTAMP	   DEFAULT NOW()
); 

INSERT INTO TEST10_1(PRODUCT_CD , PRODUCT_NM) VALUES (1 , '상품1'); 
INSERT INTO TEST10_1(PRODUCT_CD , PRODUCT_NM) VALUES (2 , '상품2'); 
INSERT INTO TEST10_1(PRODUCT_CD , PRODUCT_NM) VALUES (3 , '상품3'); 

CREATE TABLE TEST10_2(
	ORDER_CD  VARCHAR(10),
    MEMBER_ID VARCHAR(20),
    PRODUCT_CD INT,
    #FOREIGN KEY (PRODUCT_CD) REFERENCES TEST10_1 (PRODUCT_CD)
    CONSTRAINT PRODUCT_CD_REF2 FOREIGN KEY (PRODUCT_CD) REFERENCES TEST10_1 (PRODUCT_CD)
    ON UPDATE CASCADE 
    ON DELETE SET NULL # CASCADE를 사용하면 03~05가 지워졌지만 SET NULL을 해서 NULL로 바뀐거다.
);

INSERT INTO TEST10_2 VALUES ('O1' , '유저1' , 1); 
INSERT INTO TEST10_2 VALUES ('O2' , '유저2' , 2); 
INSERT INTO TEST10_2 VALUES ('O3' , '유저3' , 3);
INSERT INTO TEST10_2 VALUES ('O4' , '유저3' , 3); 
INSERT INTO TEST10_2 VALUES ('O5' , '유저3' , 3);  
INSERT INTO TEST10_2 VALUES ('O6' , '유저1' , 4); 	# ERROR (메인키에 없는 데이터 > KEY 참조 제약 위반)
INSERT INTO TEST10_2 VALUES ('O7' , '유저2' , 5); 	# ERROR (메인키에 없는 데이터 > KEY 참조 제약 위반)

UPDATE TEST10_1 SET PRODUCT_CD = 11 WHERE PRODUCT_CD = 1; 	# 
UPDATE TEST10_1 SET PRODUCT_CD = 22 WHERE PRODUCT_CD = 2; 	# 
DELETE FROM TEST10_1 WHERE PRODUCT_CD = 3;                			# 

SELECT * FROM TEST10_1;
SELECT * FROM TEST10_2;
	 			
                
DROP DATABASE CONSTRAINTS_TEST;

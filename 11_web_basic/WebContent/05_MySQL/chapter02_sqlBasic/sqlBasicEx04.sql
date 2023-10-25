/*

	# 데이터 조작어 (DML : Data Manipulation Language) 
	
		[ DELETE문 ]
	
		- 테이블의 레코드를 삭제한다.
		- 대부분 where절과 같이 사용한다.
		- MySQL에서 safe update 정책이 걸려 있어서 safe update를 설정을 해제해야 delete쿼리를 사용할 수 있다.
	       좌측 상단 메뉴 Edit클릭 > Preference클릭 > SQL Editor클릭 Safe Updates 체크박스 해지 > MySQL Workbench 재시작
	   
	   [ 레코드 삭제 형식 ]
	   
	    - DELETE FROM TABLE WHERE FIELD_CONDITION='DATA';
	    
		EX) 
			DELETE FROM 
						MEMBER 
			WHERE 
						NO=1;

*/
USE SQL_BASIC;

CREATE TABLE DELETE_EX (	
	PRODUCT_CD 		VARCHAR(20),
	PRODUCT_NM 		VARCHAR(100),
	PRICE			INT,
	REG_DT			TIMESTAMP
);

INSERT INTO DELETE_EX VALUES ('P10001' , '게이밍마우스패드' , 24850 , '2020-02-11'),
						     ('P10002' , '조립 PC' , 1000000 , '2020-06-30'),
						     ('P10003' , '브리츠 2채널 스피커' , 30750 , '2020-08-08'),
							 ('P10004' , '기계식키보드 화이트(청축)', 38150 , '2020-12-30'),
						     ('P10005' , '기계식키보드 화이트(적축)', 38150 , '2020-12-30'),
						     ('P10006' , '기계식키보드 화이트(갈축)', 38150 , '2020-12-30'),
						     ('P10007' , '기계식키보드 화이트(흑축)', 95450 , '2020-12-30');
						     
# 예시 1) 상품코드가 'P10001'인 레코드 삭제

DELETE FROM DELETE_EX			# 테이블명을 적는다.
WHERE PRODUCT_CD = 'P10001';	# 지울 정보를 적는다. 한줄을 지워준다.

# 예시 2) 상품코드가 'P10002'인 레코드 삭제

DELETE FROM DELETE_EX
WHERE PRODUCT_CD = 'P10002';

# 예시 3) 상품명에 '키보드'가 있는 레코드 삭제

DELETE FROM DELETE_EX
WHERE PRODUCT_NM LIKE '%키보드%';

# 예시 4) 전체 데이터 삭제 예시

DELETE FROM DELETE_EX;

COMMIT;
SELECT * FROM DELETE_EX;
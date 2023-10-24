/*
	
	# 트랜잭션 제어 언어 (Transaction Control Language) 

		1) COMMIT : 트렌젝션을 데이터베이스에 반영한다.
        
        INSERT, UPDATE, DELETE를 하면 무조건 COMMIT를 해야 저장해준다.
			
	        - 반드시 커밋 명령어를 실행 해야 트렌젝션(변경)이 database에 적용 된다.
	        - commit명령어를 사용하지 않으면 , 현재 연결상태에서만 변경사항이 보이는 것이고 재접속을 할 경우 변경했던 내용이 반영이 되어있지 않다.
			- 기본적으로 autocommit설정이 되어있는데 중요한 서버(운영)에는 autocommit 설정을 걸지 않는다.
			- autocommit 여부를 항상 확인해야된다. (에디터 마다 다름) 
	          mysqlworkbench : edit> sql execution > new connections us auto commit mode)
			
		2) SAVEPOINT :  현재 시점을 저장한다. 
			
			- 저장점을 정의하면 롤백할 때 현 시점에서 SAVEPOINT 까지 트랜잭션을 롤백할 수 있다.
	    
	    3) ROLLBACK  : 변경사항을 취소한다. 
	
			- ROLLBACK 은 데이터 변경 사항이 취소되어 데이터의 SAVEPOINT 이전 상태로 복구된다.
		
				
	[ 트랜잭션의 특성 ]

	 	1) 원자성 (Atomicity)
	 	트랜잭션에서 정의된 연산들은 모두 성공적으로 실행되던지 아니면 전혀 실행되지 않은 상태로 남아있어야 한다. ( All Or Nothing )
	
	 	2) 일관성 (Consistency)
	 	트랜잭션이 실행되기 전의 데이터베이스 내용이 잘못 되어 있지 않다면 트랜잭션이 실행된 이후에도 데이터베이스의 내용에 잘못이 있으면 안 된다.
	
	 	3) 고립성 (Isolation)
	 	트랜잭션이 실행되는 도중에 다른 트랜잭션의 영향을 받아 잘못된 결과를 만들어서는 안된다.
	
	 	4) 지속성 (Durability)
	 	트랜잭션이 성공적으로 수행되면 그 트랜잭션이 갱신한 데이커베이스의 내용은 영구적으로 저장된다.
	
*/

/*

	
	# 데이터 조작어 (DML : Data Manipulation Language) 
	
		[ INSERT문 ]
	
	 - 테이블에 새로운 레코드를 추가한다.
	 - 모든 컬럼의 데이터가 입력되면 필드명 입력을 생략할 수 있다.
	
	[ 레코드(데이터) 추가 형식 ]
   
	- INSERT INTO TABLE_NAME(컬럼명1 , 컬럼명2 , ....) VALUES('VAL1','VAL2',....);
	
   EX) 
		INSERT INTO MEMBER(NO,NAME,PHONE) VALUES('1','JAMES','111-111');    # 모든 필드의 데이터가 입력
		INSERT INTO MEMBER VALUES('1','JAMES','111-111');					# 모든 필드의 데이터가 입력되어 필드명을 생략
		INSERT INTO MEMBER(NAME) VALUES('JOHN');							# 특정 필드의 데이터만 입력
		
*/

USE SQL_BASIC;
CREATE TABLE INSERT_EX (	
	PRODUCT_CD 		VARCHAR(20),
	PRODUCT_NM 		VARCHAR(100),
	PRICE			INT,
	REG_DT			TIMESTAMP
);

# 예시 1) 전체 컬럼 추가 예시

INSERT INTO INSERT_EX VALUES ('P10000', 'USB', 23500, NOW());

# 예시 2) 전체 컬럼 추가 예시

INSERT INTO INSERT_EX
VALUES ('P10001', 
			  '모니터받침대',
              8340,
              NOW());

# 예시 3) 전체 컬럼 추가 예시

INSERT INTO INSERT_EX
VALUES ('P10002',
			  '게이밍마우스패드', 
              24850, 
              NOW());
		
# 예시 4) 특정 컬럼 추가 예시

INSERT INTO
		INSERT_EX (PRODUCT_CD)
VALUES
		('P100003');
		
        
# 예시 5) 특정 컬럼 추가 예시

INSERT INTO
		INSERT_EX (PRODUCT_CD , PRODUCT_NM)
VALUES
		('P10004' , '스피커');
		
# 예시 6) 특정 컬럼 추가 예시
		
INSERT INTO
		INSERT_EX (PRODUCT_CD , 
						PRODUCT_NM, 
                        PRICE)
VALUES
		('P10005' , 
		'키보드', 
        38000);
		
# 예시 7) 특정 컬럼 추가 예시		
INSERT INTO
		INSERT_EX  
        #(PRODUCT_CD , PRODUCT_NM, PRICE, REG_DT) 컬럼을 다 쓰는 경우는 생략가능하다
VALUES
		('P10006' , 
		'먼지제거제', 
        5000,
        NOW());
        
COMMIT;
SELECT * FROM INSERT_EX;
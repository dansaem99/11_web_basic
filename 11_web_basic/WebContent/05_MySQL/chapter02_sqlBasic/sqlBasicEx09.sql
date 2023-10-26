USE SQL_BASIC;

/*
	1. 숫자 > ROUND
    2. 글자 > CONCAT, SUBSTRING + @
    3. 날짜 > NOW()
*/

/*
	
    # 숫자 관련함수 

		1) ROUND	: 소수점을 반올림한 값을 반환한다. (반올림할 소수점 자릿수를 지정할 수 있다.)
		2) CEIL		: 소수점을 올린값을 반환한다.
		3) FLOOR	: 소수점을 버린값을 반환한다.
		4) TRUNCATE : 소수점을 버린값을 반환한다. (버리기 시작할 소수점 자릿수를 지정할 수 있다.)
        5) ABS		: 절대값을 반환한다.
		6) POW		: x의 y승을 반환한다.
		7) MOD		: 나머지값을 반환한다.
		8) GREATEST : 최대값을 반환한다.
		9) LEAST    : 최소값을 반환한다.

*/


# 1) ROUND	: 소수점을 반올림한 값을 반환한다. (반올림할 소수점 자릿수를 지정할 수 있다.)
SELECT
		ROUND(10.1),              # 10 > 자릿수를 생략하면 소숫점이 5이상일때 반올림한다.
		ROUND(10.4), 			  # 10
		ROUND(10.8),			  # 11
		ROUND(166.555 , 0),       # 167    > 첫번째 소숫점에서 반올림한다.
		ROUND(166.555 , 1),       # 166.6  > 두번째 소수점에서 반올림한다.
        ROUND(166.555 , 2),       # 166.56 > 세번째 소수점에서 반올림한다.
		ROUND(166.555 , -1);      # 170    > -1인 경우 소숫점 이하를 버리고 정수의 뒤에서부터 지정된 자릿수까지 반올림한다.

# 2) CEIL : 소수점을 올린값을 반환한다.
SELECT
		CEIL(10.1),    #11
		CEIL(10.4),    #11
		CEIL(10.8);	   #11


# 3) FLOOR , TRUNCATE: 소수점을 버린값을 반환한다. ( TRUNCATE는 버리기 시작할 소수점 자릿수를 지정할 수 있다.)
SELECT
		FLOOR(10.1),			  # 10
		FLOOR(10.4), 			  # 10
		FLOOR(10.8), 			  # 10
        TRUNCATE(166.555 , 0),    # 166   > 0소수점 이하 자리수를 버린다.
		TRUNCATE(166.555 , 1),	  # 166.5 > 1소수점 이하 자리수를 버린다. 
		TRUNCATE(166.555 , -1);   # 160   > -1인 경우 소숫점 이하를 버리고 정수의 뒤에서부터 지정된 자릿수까지 0으로 처리한다.


# 4) ABS : 절대값을 반환한다.
SELECT 
		ABS(100),    # 100
		ABS(-100);    # 100	


# 5) POW : x의 y승을 반환한다.
SELECT
		POW(10 , 1),   # 10
        POW(10 , 2),   # 100
        POW(10 , 3);   # 1000
    
    
# 7) MOD: 나머지값을 반환한다.
SELECT
		MOD(10 , 3),
		MOD(5 , 3),
        MOD(3 , 3);
     
     
# 8) GREATEST : 최대값을 반환한다.
SELECT 
		GREATEST(1 , 2 , 3 , 4 , 5),
        GREATEST(10 , 9 , 8 , 7 , 6),
        GREATEST(1 , 10 , 100 , 10 , 1);
        
# 9) LEAST : 최소값을 반환한다.
SELECT 
		LEAST(1 , 2 , 3 , 4 , 5),
        LEAST(10 , 9 , 8 , 7 , 6),
        LEAST(1 , 10 , 100 , 10 , 1);



/*
	# 문자열 함수 

	*1) CONCAT  : 연결된 문자열을 반환한다. (여러 문자열를 하나의 문자열로 합치기)
	2) SUBSTRING , MID : 원본문자열을 자른 문자열을 반환한다.
    3) LEFT : 원본문자열을 왼쪽부터 자른 문자열을 반환한다. 
    4) RIGHT : 원본문자열을 오른쪽부터 자른 문자열을 반환한다.
    5) TRIM : 양쪽 공백을 제거한 문자열을 반환한다. 
    6) LTRIM : 왼쪽 공백을 제거한 문자열을 반환한다.
    7) RTRIM  : 오른쪽 공백을 제거한 문자열을 반환한다.
    8) REPLACE : 원본 문자열의 특정 문자열을 새로운 문자열로 교체한다.
    9) INSERT  : 특정 문자열을 원본문자열에 삽입한다.
    10) INSTR : 원본문자열에서 특정문자열의 위치(index)를 반환한다.
    11) LOCATE : 원본문자열에서 특정문자열의 위치(index)를 반환한다.
    12) LCASE , LOWER : 대문자를 소문자로 변환하여 반환한다.
    13) UCASE , UPPER : 소문자를 대문자로 변환하여 반환한다.
    
*/

# 1) CONCAT  : 연결된 문자열을 반환한다.
SELECT 
		CONCAT('qwer1234' , '@' , 'gmail.com'),	 # qwer1234@gmail.com
        CONCAT('%','keyword','%'),				 	 # %keyword%	
		CONCAT('2021' , '-' , '01' , '-' ,'01');  	 # 2021-01-01
        
        
# 2) SUBSTRING , MID : 원본문자열을 자른 문자열을 반환한다.
# SUBSTRING(문자열 , 자르기 시작할 위치) 			   , MID(문자열 , 자르기 시작할 위치)
# SUBSTRING(문자열 , 자르기 시작할 위치 , 자를단어의 개수) , MID(문자열 , 자르기 시작할 위치 , 자를단어의 개수)
SELECT 
		SUBSTRING('770312-1234567' , 8),     				# 1234567
        SUBSTRING('770312-1234567' , 3 , 4),				# 0312
		MID('770312-1234567' , 8),           				# 1234567
		MID('770312-1234567' , 3 , 4);	     				# 0312
		
        
# 3) LEFT : 원본문자열을 왼쪽부터 자른 문자열을 반환한다.   LEFT(원본문자열 , 왼쪽부터 자를 갯수)
SELECT	
		LEFT('770312-1234567' , 2),		     				# 77
		LEFT('770312-1234567' , 4),		     				# 7703
        LEFT('770312-1234567' , 6);	     					# 770312
   
   
# 4) RIGHT : 원본문자열을 오른쪽부터 자른 문자열을 반환한다.   RIGHT(원본문자열 , 오른쪽부터 자를 갯수)      
SELECT 
		RIGHT('770312-1234567' , 7),	   # 1234567  				
        RIGHT('770312-1234567' , 4),	   # 4567
        RIGHT('770312-1234567' , 1);	   # 7


# 5) TRIM : 양쪽 공백을 제거한 문자열을 반환한다. 
SELECT
		'   음성인식     ',			#    음성인식     
        TRIM('   음성인식     ');		# 음성인식


# 6) LTRIM : 왼쪽 공백을 제거한 문자열을 반환한다. 
SELECT
		'   음성인식     ',			#    음성인식     
        LTRIM('   음성인식     ');     # 음성인식     
        
        
# 7) RTRIM  : 오른쪽 공백을 제거한 문자열을 반환한다. 
SELECT
		'   음성인식     ',			#    음성인식     
        RTRIM('   음성인식     ');     #   음성인식


# 8) REPLACE : 원본 문자열의 특정 문자열을 새로운 문자열로 교체한다.  # (원본문자열 , 교체될 문자열 , 새로운 문자열)
SELECT
        REPLACE('qwer1234@gmail.com' , 'gmail' , 'naver'),  # qwer1234@naver.com
        REPLACE('2021-09-10' , '-' , ''),					# 20210910
        REPLACE('m', 'm' , '남성'),							# 남성
		REPLACE('f', 'f' , '여성');                          # 여성
		

# 9) INSERT : 특정 문자열을 원본문자열에 삽입한다. # (문자열 , 삭제하기 시작할 위치 , 삭제할 문자열 갯수 , 삽입할 문자열) 
# 1부터 인덱스를 센다.
SELECT 
		INSERT('qwer1234gmail.com' , 9 , 0 ,'@'),	  # qwer1234@gmail.com	
		INSERT('CODE=1234' , 6 , 4 ,'7777');		  # CODE=7777


# 10) INSTR : 원본문자열에서 특정문자열의 위치(index)를 반환한다.  # (원본 문자열 , 조회할 문자열) 
# 문자열이 2개 이상 있을 경우 처음 위치만 반환한다. 
# 문자열이 없을 경우 0을 반환한다.
SELECT
		INSTR('qwer1234@gmail.com' , '@gmail.com'),		# 9
		INSTR('qwer1234@gmail.com' , '@naver.com'), 	# 0 (없음)
        INSTR('qwer1234@gmail.com' , 'com'),			# 16
        INSTR('qwer1234@gmail.com' , '@'),				# 9
        INSTR('qwer1234@gmail.com' , '.');				# 15
        
        
# 11) LOCATE : 원본문자열에서 특정문자열의 위치(index)를 반환한다. # (조회할 문자열 , 원본문자열)
# 문자열이 2개 이상 있을 경우 처음 위치만 반환한다. 
# 문자열이 없을 경우 0을 반환한다.
SELECT
		LOCATE('@gmail.com' , 'qwer1234@gmail.com'),	# 9
		LOCATE('@naver.com' , 'qwer1234@gmail.com'), 	# 0 (없음)
        LOCATE('com' , 'qwer1234@gmail.com'),			# 16
        LOCATE('@' , 'qwer1234@gmail.com'),				# 9
        LOCATE('.' , 'qwer1234@gmail.com' );			# 15		

		
# 12) LCASE , LOWER : 대문자를 소문자로 변환하여 반환한다.
SELECT
		LCASE('MySQL Workbench'), # mysql workbench
		LOWER('MySQL Workbench'); # mysql workbench


# 13) UCASE , UPPER : 소문자를 대문자로 변환하여 반환한다.
SELECT
		UCASE('MySQL Workbench'), # MYSQL WORKBENCH
		UPPER('MySQL Workbench'); # MYSQL WORKBENCH
        




/*
  
	# 날짜 관련 함수
    
		1)  NOW() , SYSDATE() , CURRENT_TIMESTAMP() : 날짜와 시간관련 정보를 반환한다.
		2)  CURRENT_DATE() ,  CURDATE() 			: 날짜관련 정보를 반환한다.
		3)  CURRENT_TIME(), CURTIME()   			: 시간관련 정보를 반환한다.
        
*/

SELECT 
		NOW(),              	# yyyy-mm-dd hh:ii:ss
		SYSDATE(),				# yyyy-mm-dd hh:ii:ss
		CURRENT_TIMESTAMP(),    # yyyy-mm-dd hh:ii:ss
		CURRENT_DATE(),         # yyyy-mm-dd
		CURDATE(),				# yyyy-mm-dd
		CURRENT_TIME(), 		# hh:ii:ss
		CURTIME();				# hh:ii:ss
    
    
/*

	# 날짜 형식 포맷하기
    
        - 포맷으로 지정한 형식으로 변환된 날짜 및 시간 값을 반환한다.

*/


SELECT
		DATE_FORMAT(NOW() , '%y년 %m월 %d일 , %h시 %i분 %s초'),    # yy년 mm월 dd일 , hh시 ii분 ss초
	    DATE_FORMAT(SYSDATE() , '%y-%m-%d'),				   # yy-mm-dd
	    DATE_FORMAT(CURRENT_TIMESTAMP() , '%y/%m/%d');	       # yy/mm/dd

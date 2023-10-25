/*
	
    # CASE문
    
    - MySQL에서 CASE문은 프로그래밍 언어에서 스위치(switch)문과 비슷하지만,
	  다수의 조건에 하나의 반환 값은 동작하지 않는다.
		[형식]
		CASE
			WHEN 조건 THEN  '반환 값'
			WHEN 조건 THEN  '반환 값'
			ELSE 			'WHEN 조건에 해당 안되는 경우 반환 값'
		END AS '컬럼 명'
	- WHEN과 THEN은 한쌍이어야 한다.
	- WHEN과 THEN은 다수가 존재할 수 있다.
	- ELSE가 존재하면 모든 조건에 해당하지 않는 경우에 반환 값을 설정할 수 있다.
	- ELSE가 존재하지 않고, 조건에 맞지 않아서 반환 값이 없으면 NULL를 반환한다.

*/

USE SQL_BASIC;
 
# 예시 1)
SELECT DISTINCT
		PRODUCT_CD,
	    CASE
			WHEN PRODUCT_CD IN ('P10004','P10005','P10006','P10007') 		    THEN '키보드'
			WHEN PRODUCT_CD IN ('P10008','P10009','P10010','P10010','P10011')	THEN 'USB'
		END AS SUMMARY # AS = 별명
FROM
		SELECT_EX;



# 예시 2) ELSE문 사용
SELECT DISTINCT
		PRODUCT_CD,
	    CASE
			WHEN PRODUCT_CD IN ('P10004','P10005','P10006','P10007') 		    THEN '키보드'
			WHEN PRODUCT_CD IN ('P10008','P10009','P10010','P10010','P10011')	THEN 'USB'
			ELSE																	  '전자기기'
		END AS SUMMARY
FROM
		SELECT_EX;

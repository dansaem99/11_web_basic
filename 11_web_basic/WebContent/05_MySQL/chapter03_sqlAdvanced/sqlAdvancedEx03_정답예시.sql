USE SQL_ADVANCED_PRACTICE;       

CREATE TABLE CAR_TB(
	CAR_TB_CD 			VARCHAR(20),
	CAR_TB_NM 			VARCHAR(20),
	PRICE 			INT,
	BRAND_NM 		VARCHAR(10),
	CATEGORY		VARCHAR(100),
	REG_DT			VARCHAR(500)
);


/*
	
	CAR_TB테이블에 데이터 삽입하기.

	'car1', '아반떼',  60000, '현대' , '준중형' , '2020-01-01'
	'car2' , '아이오닉', 67500, '현대', '준중형' , '2020-02-02'
	'car3' , '쏘나타',  80000, '현대', '중형' , '2020-03-03'
	'car4' , '그랜저',  115000, '현대', '준대형' , '2020-04-04'
	'car5' , '스타렉스',  155000, '현대', '대형' , '2020-05-05'
	'car6' , '제네시스', 175000, '현대', '중형' , '2020-06-06'
	'car7' , 'k3' , 68000, '기아', '준중형' , '2020-07-07'
	'car8' , '모닝',  39900, '기아', '소형' , '2020-08-08'
	'car9' , 'k5', 78000, '기아', '중형' , '2020-09-09'
	'car10' , 'k7', 115000, '기아', '준대형' , '2020-10-10'
	'car11', 'k9', 288000, '기아', '대형' , '2020-11-11'
	'car12', '레이', 65000, '기아', '소형' , '2021-01-01'
	'car13', '스포티지',  115000, '기아', '준중형' , '2021-02-02'
	'car14', '카니발', 180000, '기아', '대형' , '2021-03-03'
	'car15', 'SM5', 50000, '르노', '중형' , '2021-04-04'
	'car16', 'SM6', 73920, '르노', '중형' , '2021-05-05'
	'car17', 'QM6', 78000, '르노', '중형' , '2021-06-06'
	'car18', '렉스턴', 66000, '쌍용', '준대형' , '2021-07-07'
	'car19', '티볼리', 25500, '쌍용', '소형' , '2021-08-08'
	'car20', '코란도', 59700, '쌍용', '준중형' , '2021-09-09'
	
*/

INSERT INTO CAR_TB VALUES ('car1', '아반떼',  60000, '현대', '준중형' , '2020-01-01');
INSERT INTO CAR_TB VALUES ('car2' , '아이오닉', 67500, '현대', '준중형' , '2020-02-02');
INSERT INTO CAR_TB VALUES ('car3' , '쏘나타',  80000, '현대', '중형' , '2020-03-03');
INSERT INTO CAR_TB VALUES ('car4' , '그랜저',  115000, '현대', '준대형' , '2020-04-04');
INSERT INTO CAR_TB VALUES ('car5' , '스타렉스',  155000, '현대', '대형' , '2020-05-05');
INSERT INTO CAR_TB VALUES ('car6' , '제네시스', 175000, '현대', '중형' , '2020-06-06');
INSERT INTO CAR_TB VALUES ('car7' , 'k3' , 68000, '기아', '준중형' , '2020-07-07');
INSERT INTO CAR_TB VALUES ('car8' , '모닝',  39900, '기아', '소형' , '2020-08-08');
INSERT INTO CAR_TB VALUES ('car9' , 'k5', 78000, '기아', '중형' , '2020-09-09');
INSERT INTO CAR_TB VALUES ('car10' , 'k7', 115000, '기아', '준대형' , '2020-10-10');
INSERT INTO CAR_TB VALUES ('car11', 'k9', 288000, '기아', '대형' , '2020-11-11');
INSERT INTO CAR_TB VALUES ('car12', '레이', 65000, '기아', '소형' , '2021-01-01');
INSERT INTO CAR_TB VALUES ('car13', '스포티지',  115000, '기아', '준중형' , '2021-02-02');
INSERT INTO CAR_TB VALUES ('car14', '카니발', 180000, '기아', '대형' , '2021-03-03');
INSERT INTO CAR_TB VALUES ('car15', 'SM5', 50000, '르노', '중형' , '2021-04-04');
INSERT INTO CAR_TB VALUES ('car16', 'SM6', 73920, '르노', '중형' , '2021-05-05');
INSERT INTO CAR_TB VALUES ('car17', 'QM6', 78000, '르노', '중형' , '2021-06-06');
INSERT INTO CAR_TB VALUES ('car18', '렉스턴', 66000, '쌍용', '준대형' , '2021-07-07');
INSERT INTO CAR_TB VALUES ('car19', '티볼리', 25500, '쌍용', '소형' , '2021-08-08');
INSERT INTO CAR_TB VALUES ('car20', '코란도', 59700, '쌍용', '준중형' , '2021-09-09');

# 1) 기아브랜드 차량의 개수를 조회하기
SELECT
		COUNT(*)
FROM
		CAR_TB
WHERE
		BRAND_NM = '기아';
	
		
# 2) 기아브랜드 차량중 소형차량의 개수를 조회하기
SELECT
		COUNT(*)
FROM
		CAR_TB
WHERE
		BRAND_NM = '기아' AND CATEGORY = '소형';
	
		
# 3) 기아 , 쌍용브랜드 차량의 개수를 조회하기
SELECT
		COUNT(*)
FROM
		CAR_TB
WHERE
		BRAND_NM IN ('기아' , '쌍용');
	
		
# 4) 렌트가격이 50000 ~ 100000사이의 차량의 개수를 조회하기
SELECT 
		COUNT(*)
FROM
		CAR_TB
WHERE
		PRICE BETWEEN 50000 AND 100000;
		
		
# 5) 대형 차량의 평균금액을 조회하기
SELECT
		AVG(PRICE)
FROM
		CAR_TB
WHERE
		CATEGORY = '대형';

		
# 6) 제일비싼 렌트 가격을 조회하기
SELECT
		MAX(PRICE)
FROM
		CAR_TB;

		
# 7) 가장 많이 등록된 브랜드이름과 등록횟수를 조회하기
SELECT
		BRAND_NM,
		COUNT(*)
FROM
		CAR_TB
GROUP BY
		BRAND_NM
ORDER BY
		COUNT(*) DESC
LIMIT 
		1;
	
		
# 8) 브랜드로 그룹화하여 등록된 차량의 수를 조회하기
SELECT
		BRAND_NM,
		COUNT(*)
FROM
		CAR_TB
GROUP BY
		BRAND_NM;

		
# 9) 브랜드로 그룹화하여 각각 최소렌트금액을 조회하기
SELECT
		BRAND_NM,
		MIN(PRICE)
FROM
		CAR_TB
GROUP BY
		BRAND_NM;
		
		
# 10) 브랜드로 그룹화하여 평균 렌트금액을 조회하기
SELECT
		BRAND_NM,
		AVG(PRICE)
FROM
		CAR_TB
GROUP BY
		BRAND_NM;
	
		
# 11) 차량의 크기로 그룹화하여 평균렌트금액을 조회하기
SELECT
		CATEGORY,
		AVG(PRICE)
FROM
		CAR_TB
GROUP BY
		CATEGORY;
		
		
# 12) 등록연도별로 그룹화하여 등록된 차량의 수를 조회하기
SELECT
		SUBSTRING(REG_DT , 1 , 4) AS YEAR,
		COUNT(*)
FROM
		CAR_TB
GROUP BY
		YEAR;
		
		
# 13) 브랜드명 , 차량의 크기별로 그룹화하여 평균금액을 조회하기
SELECT
		BRAND_NM,
		CATEGORY,
		AVG(PRICE)
FROM
		CAR_TB
GROUP BY
		BRAND_NM,
		CATEGORY;
		
		
# 14) 등록연도 , 브랜드명 , 차량의 크기별로 그룹화하여 평균렌트금액을 조회하되 평균 렌트금액 50000원 이상만 조회하기
SELECT
		SUBSTRING(REG_DT , 1 , 4) AS YEAR,
		BRAND_NM,
		CATEGORY,
		AVG(PRICE)
FROM
		CAR_TB
GROUP BY
		YEAR,
		BRAND_NM,
		CATEGORY
HAVING
		AVG(PRICE) >= 50000;
		
		
# 15) 2020년도 1사분기(1월~3월)과 2021년도 1사분기(1월~3월)에 등록된 차량의 개수 조회하기
SELECT
		COUNT(*)
FROM
		CAR_TB
WHERE
		REG_DT BETWEEN '2020-01-01' AND '2020-03-31'
OR 		
		REG_DT BETWEEN '2021-01-01' AND '2021-03-31';
	 
	 
# 16) 브랜드로 그룹화하여 2020년도 1사분기(1월~3월)과 2021년도 1사분기(1월~3월)에 등록된 차량의 개수 조회하기
SELECT
		BRAND_NM,
		COUNT(*)
FROM
		CAR_TB
WHERE
		REG_DT BETWEEN '2020-01-01' AND '2020-03-31'
OR 
		REG_DT BETWEEN '2021-01-01' AND '2021-03-31'
GROUP BY
		BRAND_NM;

		
# 17) 브랜드로 그룹화하여 2020년도 1사분기(1월~3월)과 2021년도 1사분기(1월~3월)에 등록된 차량의 평균 렌트 가격을 조회하기 (가격 내림차순)
SELECT
		BRAND_NM,
		AVG(PRICE)
FROM
		CAR_TB
WHERE
		REG_DT BETWEEN '2020-01-01' AND '2020-03-31'
OR 
	 	REG_DT BETWEEN '2021-01-01' AND '2021-03-31'
GROUP BY
		BRAND_NM
ORDER BY
		AVG(PRICE) DESC;

		
# 18) 브랜드별로 그룹화하여 렌트가격이 50000 ~ 100000사이의 차량의 개수를 조회하기(브랜드이름 오름차순)
SELECT 
		BRAND_NM,
		COUNT(*)
FROM
		CAR_TB
WHERE
		PRICE BETWEEN 50000 AND 100000
GROUP BY
		BRAND_NM
ORDER BY
		BRAND_NM;


# 19) 차량 크기별로 그룹화하여 등록된 차량의 개수를 조회하여 차량의 수가 많은 순서대로 정렬하기 (개수 내림차순 )
SELECT
		CATEGORY,
		COUNT(*)
FROM
		CAR_TB
GROUP BY
		CATEGORY
ORDER BY
		COUNT(*) DESC;

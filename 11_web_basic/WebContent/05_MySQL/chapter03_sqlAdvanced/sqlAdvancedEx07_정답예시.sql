CREATE DATABASE SQL_ADVANCE_PRACTICE;
USE SQL_ADVANCE_PRACTICE;

CREATE TABLE TB_MEMBER(
    MEMBER_ID 		VARCHAR(20),
	MEMBER_NM 		VARCHAR(50),
	SEX 			VARCHAR(10),
	HP 				VARCHAR(20),
	EMAIL 			VARCHAR(20),
    RESIDENCE		VARCHAR(20)
);

CREATE TABLE TB_PRODUCT(
    PRODUCT_CD 		VARCHAR(20),
    PRODUCT_NM 		VARCHAR(100),
	PRICE 			INT,
	DELIVERY_PRICE 	INT
);

CREATE TABLE TB_ORDER(
	ORDER_CD 			VARCHAR(50),
	MEMBER_ID 			VARCHAR(50),
    PRODUCT_CD			VARCHAR(20),
	ORDER_GOODS_QTY 	INT,
    DELIVERY_MESSAGE 	VARCHAR(300),
    DELIVERY_STATUS 	VARCHAR(100),
	ORDER_DT 			DATETIME
);

INSERT INTO TB_MEMBER VALUES('user1', '메르켈' , 'f' , '010-1111-1111' , 'mer@gmail.com'  , '서울');
INSERT INTO TB_MEMBER VALUES('user2', '제임스고슬링' , 'm' , '010-2222-2222' , 'james@gmail.com' , '서울'); 
INSERT INTO TB_MEMBER VALUES('user3', '신사임당' , 'f' , '010-3333-3333' , 'shinsa@naver.com' , '경기');
INSERT INTO TB_MEMBER VALUES('user4', '유관순' , 'f' , '010-4444-4444' , 'yks@gmail.com' , '인천');
INSERT INTO TB_MEMBER VALUES('user5', '데니스리치' , 'm' , '010-5555-5555' , 'denis@gmail.com' , '부산');
INSERT INTO TB_MEMBER VALUES('user6', '팀버너스리' , 'm' , '010-6666-6666' , 'tim@naver.com' , '대구');
INSERT INTO TB_MEMBER VALUES('user7', '스티븐워즈니악' , 'm' , '010-7777-7777' , 'stevenw@gmail.com' , '경기');
INSERT INTO TB_MEMBER VALUES('user8', '선덕여왕' , 'f' , '010-8888-8888' , 'seonduk@gmail.com' , '서울');
INSERT INTO TB_MEMBER VALUES('user9', '스티브잡스' , 'm' , '010-9999-9999' , 'jobs@daum.net' , '부산');
INSERT INTO TB_MEMBER VALUES('user10', '빌게이츠' , 'm' , '010-1010-1010' , 'bill@naver.com' , '서울');

INSERT INTO TB_PRODUCT VALUES('product1', '삼성전자 2021 노트북 플러스2 15.6' , 598000 , 0 );    
INSERT INTO TB_PRODUCT VALUES('product2', '삼성전자 2021 갤럭시북 15.6' , 1208000 , 0 );
INSERT INTO TB_PRODUCT VALUES('product3', 'LG전자 10세대 코어i7 윈10탑재 17형 LG 그램 2020년형 17Z90N' , 2149000 , 0);
INSERT INTO TB_PRODUCT VALUES('product4', 'LG전자 2021그램 360 14' , 1740000 , 0 );
INSERT INTO TB_PRODUCT VALUES('product5', 'LG전자 2020 울트라 PC 14' , 477000 , 0 );
INSERT INTO TB_PRODUCT VALUES('product6', '2020 맥북 프로 13' , 2129650 , 3000 );
INSERT INTO TB_PRODUCT VALUES('product7', 'Apple 2020 맥북 에어 13' , 1489800 , 3000 );
INSERT INTO TB_PRODUCT VALUES('product8', '레노버 2021 IdeaPad Slim3 15.6' , 2129650 , 2500 );
INSERT INTO TB_PRODUCT VALUES('product9', '기가바이트 2021 Gaming G5 15.6' , 1499000 , 2500 );
INSERT INTO TB_PRODUCT VALUES('product10', 'HP 2021 노트북 15s' , 768840 , 2500 );

INSERT INTO TB_ORDER VALUES('order1', 'user1' , 'product1' ,  1 , '배송전 연락 주세요.' , '배송준비중' , '2019-01-03');
INSERT INTO TB_ORDER VALUES('order2', 'user1' , 'product2' ,  1 , '배송전 연락 주세요.' , '배송준비중' , '2019-02-25');
INSERT INTO TB_ORDER VALUES('order3', 'user1' , 'product3' ,  1 ,  '배송전 연락 주세요.' , '배송준비중' , '2019-03-12');
INSERT INTO TB_ORDER VALUES('order4', 'user5' , 'product8' ,  2 , '배송전 연락 주세요.' ,  '배송중' , '2019-04-11');
INSERT INTO TB_ORDER VALUES('order5', 'user6' , 'product2' ,  2 , '배송전 연락 주세요.' , '배송준비중' , '2019-05-30');
INSERT INTO TB_ORDER VALUES('order6', 'user3' , 'product1' ,  1 ,  '배송전 연락 주세요.' , '배송준비중' , '2019-06-01');
INSERT INTO TB_ORDER VALUES('order7', 'user2' , 'product2' ,  2 , '배송전 연락 주세요.' , '배송준비중' , '2019-07-12');
INSERT INTO TB_ORDER VALUES('order8', 'user10' , 'product1' ,  10 ,  '배송전 연락 주세요.' , '배송준비중' , '2019-12-25');
INSERT INTO TB_ORDER VALUES('order9', 'user9' , 'product2' ,  2 ,  '문 앞에 놓고 벨 눌러주세요.' , '배송중' , '2020-01-07');
INSERT INTO TB_ORDER VALUES('order10', 'user5' , 'product10' , 1 , '문 앞에 놓고 벨 눌러주세요.' , '배송완료' , '2020-02-28');
INSERT INTO TB_ORDER VALUES('order11', 'user7' , 'product4' , 1 , '경비실에 맡겨 주세요.' , '배송완료' , '2020-03-03');
INSERT INTO TB_ORDER VALUES('order12', 'user2' , 'product4' , 2 , '문 앞에 놓고 벨 눌러주세요.' , '배송완료' , '2020-04-27');
INSERT INTO TB_ORDER VALUES('order13', 'user8' , 'product3' , 1 , '배송전 연락 주세요' , '배송완료' , '2020-05-05');
INSERT INTO TB_ORDER VALUES('order14', 'user9' , 'product7' , 2 , '문 앞에 놓고 벨 눌러주세요.' , '배송완료' , '2020-05-08');
INSERT INTO TB_ORDER VALUES('order15', 'user3' , 'product2' , 3 ,  '문 앞에 놓고 벨 눌러주세요.' , '배송완료' , '2020-06-27');
INSERT INTO TB_ORDER VALUES('order16', 'user3' , 'product9' , 10 , '문 앞에 놓고 벨 눌러주세요.' , '배송완료' , '2020-07-08');
INSERT INTO TB_ORDER VALUES('order17', 'user4' , 'product7' , 7 ,  '경비실에 맡겨 주세요.' , '배송중' , '2020-08-15');
INSERT INTO TB_ORDER VALUES('order18', 'user6' , 'product6' , 3 , '문 앞에 놓고 벨 눌러주세요.' , '배송완료' , '2020-10-03');
INSERT INTO TB_ORDER VALUES('order19', 'user7' , 'product6' , 12 , '문 앞에 놓고 벨 눌러주세요.' , '배송완료' , '2020-11-11');
INSERT INTO TB_ORDER VALUES('order20', 'user10' , 'product8' , 5 , '배송전 연락 주세요' , '배송중' , '2020-12-20');

SELECT
		*
FROM
		TB_ORDER O
	  INNER JOIN TB_PRODUCT P
	          ON O.PRODUCT_CD = P.PRODUCT_CD
      INNER JOIN TB_MEMBER M
	          ON O.MEMBER_ID = M.MEMBER_ID;   


# 1) 남자가 주문한 상품의 총 주문량을 조회하기

SELECT
		SUM(O.ORDER_GOODS_QTY) AS TOTAL_ORDER_GOODS_QTY
FROM
		TB_ORDER O
	 INNER JOIN TB_MEMBER M
			 ON O.MEMBER_ID = M.MEMBER_ID
			AND M.SEX = 'm';

			
# 2) 서울지역에 사는 여자가 주문한 상품의 총 주문량을 조회하기

SELECT
		SUM(O.ORDER_GOODS_QTY) AS TOTAL_ORDER_GOODS_QTY
FROM
		TB_ORDER O
	 INNER JOIN TB_MEMBER M
			 ON O.MEMBER_ID = M.MEMBER_ID
			AND M.RESIDENCE = '서울'
			AND M.SEX = 'f';
	
    
# 3) '서울' , '경기' , '인천' 지역에 사는 여자가 주문한 상품의 평균 주문개수를 조회하기

SELECT
		AVG(O.ORDER_GOODS_QTY) AS AVG_ORDER_GOODS_QTY
FROM
		TB_ORDER O
	 INNER JOIN TB_MEMBER M
			 ON O.MEMBER_ID = M.MEMBER_ID
			AND M.RESIDENCE IN ('서울' , '경기' , '인천')
			AND M.SEX = 'f';
			
			
# 4) 남자가 주문한 '상품코드별로' 상품의 코드와 주문량의 합을 조회하되 주문량의 합이 적은 순서로 정렬하여 3개만 조회하기.

SELECT
        P.PRODUCT_CD			AS PRODUCT_CD,
		SUM(O.ORDER_GOODS_QTY)  AS TOTAL_ORDER_GOODS_QTY
FROM
		TB_ORDER O
	 INNER JOIN TB_MEMBER M
			 ON O.MEMBER_ID = M.MEMBER_ID
	 INNER JOIN TB_PRODUCT P
	 		 ON P.PRODUCT_CD = O.PRODUCT_CD
			AND M.SEX = 'm'
GROUP BY
		P.PRODUCT_CD
ORDER BY
		TOTAL_ORDER_GOODS_QTY
LIMIT
		3;
		
	
# 5) 2020년에 가장 많이 팔린 상품명 3개와 총 판매량을 조회하기.

SELECT
		P.PRODUCT_NM					AS PRODUCT_NM,
		SUM(O.ORDER_GOODS_QTY)			AS TOTAL_ORDER_GOODS_QTY
FROM
		TB_ORDER O
	 INNER JOIN TB_PRODUCT P
             ON O.PRODUCT_CD = P.PRODUCT_CD
			AND O.ORDER_DT BETWEEN '2020-01-01' AND '2020-12-31'
GROUP BY
		P.PRODUCT_NM
ORDER BY	
		TOTAL_ORDER_GOODS_QTY DESC
LIMIT 
		3;


# 6) '지역별'로 지역명 , 배송중인 상품의 주문량의 총합을 조회하기

SELECT
		M.RESIDENCE					AS RESIDENCE,
		SUM(O.ORDER_GOODS_QTY)		AS TOTAL_ORDER_GOODS_QTY
FROM
		TB_ORDER O
	 INNER JOIN TB_MEMBER M
             ON O.MEMBER_ID = M.MEMBER_ID
			AND O.DELIVERY_STATUS = "배송중"
GROUP BY
		M.RESIDENCE;


# 7) 'Apple 2020 맥북 에어 13'를 구매한 유저의 아이디와 이름을 조회하기

SELECT
		M.MEMBER_ID 	AS MEMBER_ID ,
		M.MEMBER_NM 	AS MEMBER_NM
FROM
		TB_ORDER O
	 INNER JOIN TB_PRODUCT P
             ON O.PRODUCT_CD = P.PRODUCT_CD
             AND P.PRODUCT_NM = 'Apple 2020 맥북 에어 13'
	 INNER JOIN TB_MEMBER M
			 ON M.MEMBER_ID = O.MEMBER_ID;
			

# 8) 1000000 ~ 2000000가격의 판매된 상품들의 '상품코드별로' 상품의 코드 , 총 판매량 조회하기

SELECT
        P.PRODUCT_CD 			AS PRODUCT_CD,
        SUM(O.ORDER_GOODS_QTY)	AS TOTAL_ORDER_GOODS_QTY
FROM
		TB_ORDER O
	 INNER JOIN TB_PRODUCT P
             ON O.PRODUCT_CD = P.PRODUCT_CD
			AND P.PRICE BETWEEN 1000000 AND 2000000
GROUP BY
		P.PRODUCT_CD;

		
# 9) 1000000 ~ 2000000가격의 판매된 '상품이름별로' 상품이름 , 총 판매량을 조회하되 판매량이 5개 이상인 상품을 판매량이 높은순서 , 상품이름을 ㄱ~ㅎ 순서로 조회하기

SELECT
        P.PRODUCT_NM 		   AS PRODUCT_NM,
        SUM(O.ORDER_GOODS_QTY) AS TOTAL_ORDER_GOODS_QTY
FROM
		TB_ORDER O
	 INNER JOIN TB_PRODUCT P
             ON O.PRODUCT_CD = P.PRODUCT_CD
			AND P.PRICE BETWEEN 1000000 AND 2000000
GROUP BY
		P.PRODUCT_NM
HAVING
		SUM(O.ORDER_GOODS_QTY) >= 5
ORDER BY
		SUM(O.ORDER_GOODS_QTY) DESC,
        P.PRODUCT_NM ASC;
        

# 10) 한번에 주문 수량이 10개 이상인 상품 정보 모두와 주문수량 조회하기.

SELECT
		P.* ,
        O.ORDER_GOODS_QTY
FROM
		TB_ORDER O
	 INNER JOIN TB_PRODUCT P
             ON O.PRODUCT_CD = P.PRODUCT_CD
			AND O.ORDER_GOODS_QTY >= 10;


# 11) 2020년 동안 판매된 매출총액 조회하기.(가격 * 개수 + 배송비)

SELECT
		SUM(P.PRICE * O.ORDER_GOODS_QTY + P.DELIVERY_PRICE) AS ANNUAL_2020_SALES
FROM 
		TB_ORDER O
	 INNER JOIN TB_PRODUCT P
             ON O.PRODUCT_CD = P.PRODUCT_CD
			AND O.ORDER_DT BETWEEN '2020-01-01' AND '2020-12-31';


# 12) '상품이름별'로 2020년 동안 판매된 수량(내림차순)순으로 정렬하여 상품이름 , 상품판매량 조회하기.

SELECT
		P.PRODUCT_NM 			AS PRODUCT_NM,
        SUM(O.ORDER_GOODS_QTY)  AS TOTAL_ORDER_COUNT
FROM 
		TB_ORDER O
	 INNER JOIN TB_PRODUCT P
             ON O.PRODUCT_CD = P.PRODUCT_CD
			AND O.ORDER_DT BETWEEN '2020-01-01' AND '2020-12-31'
GROUP BY
		P.PRODUCT_NM
ORDER BY
		TOTAL_ORDER_COUNT DESC;


# 13) '지역별'로 판매량이 많은 순서대로 정렬하여 지역명과 판매량 조회하기.

SELECT
		M.RESIDENCE			   AS RESIDENCE,
        SUM(O.ORDER_GOODS_QTY) AS TOTAL_ORDER_COUNT
FROM 
		TB_ORDER O
	 INNER JOIN TB_MEMBER M
			 ON O.MEMBER_ID = M.MEMBER_ID
GROUP BY
		M.RESIDENCE
ORDER BY
		TOTAL_ORDER_COUNT DESC;


# 14) 배송이 완료된 상품의 회원테이블의 모든 정보와 배송상태 조회하기.

SELECT
		M.*,
        O.DELIVERY_STATUS	AS DELIVERY_STATUS
FROM
		TB_ORDER O
	 INNER JOIN TB_MEMBER M
             ON M.MEMBER_ID = O.MEMBER_ID
			AND O.DELIVERY_STATUS = '배송완료';


# 15) 배송이 완료되지 않은 '상품이름별로'  상품 이름 , 배송이 완료되지 않은 주문 건수 조회하기.

SELECT
		P.PRODUCT_NM	AS PRODUCT_NM,
        COUNT(*)		AS COUNT
FROM
		TB_ORDER O
	 INNER JOIN TB_PRODUCT P
             ON O.PRODUCT_CD = P.PRODUCT_CD
			AND O.DELIVERY_STATUS <> '배송완료'
GROUP BY
		P.PRODUCT_NM;


# 16) '상품 코드별'로 상품코드 , 판매금액 총합을 판매급액이 많은 순으로 조회하기. 

SELECT
		P.PRODUCT_CD														AS PRODUCT_CD,
        SUM(P.PRICE * O.ORDER_GOODS_QTY + P.DELIVERY_PRICE) 				AS TOTAL_SALES
FROM
		TB_ORDER O
	 INNER JOIN TB_PRODUCT P
             ON P.PRODUCT_CD = O.PRODUCT_CD
GROUP BY
		P.PRODUCT_CD
ORDER BY
		TOTAL_SALES DESC;


# 17) '메르켈' 회원의 주문 상품 이름과 배송상태를 조회하기.

SELECT 
		P.PRODUCT_NM    	AS PRODUCT_NM,
		O.DELIVERY_STATUS   AS DELIVERY_STATUS
FROM
		TB_ORDER O
 INNER JOIN TB_MEMBER T
		 ON T.MEMBER_ID = O.MEMBER_ID
		AND T.MEMBER_NM = '메르켈'
 INNER JOIN TB_PRODUCT P
         ON P.PRODUCT_CD = O.PRODUCT_CD;


# 18) '메르켈' 회원의 주문금액 총합을 조회하기.

SELECT
        SUM(P.PRICE * O.ORDER_GOODS_QTY + P.DELIVERY_PRICE) AS TOTAL_PRICE
FROM
		TB_ORDER O
	 INNER JOIN TB_MEMBER M
		     ON M.MEMBER_ID = O.MEMBER_ID
			AND M.MEMBER_NM = '메르켈'
	 INNER JOIN TB_PRODUCT P
             ON P.PRODUCT_CD = O.PRODUCT_CD;


# 19) '사용자 아이디별로' 사용자 아이디와 주문금액의 총합을 조회하기.

SELECT
		M.MEMBER_ID											AS MEMBER_ID,
        SUM(P.PRICE * O.ORDER_GOODS_QTY + P.DELIVERY_PRICE) AS TOTAL_PRICE
FROM
		TB_ORDER O
	 INNER JOIN TB_MEMBER M
		     ON M.MEMBER_ID = O.MEMBER_ID
	 INNER JOIN TB_PRODUCT P
             ON P.PRODUCT_CD = O.PRODUCT_CD
GROUP BY
		M.MEMBER_ID;


# 20) '사용자아이디'별로 주문금액 총합이 700만원 이상인 회원의 이름과 주문금액의 총합을 조회하기.

SELECT
		M.MEMBER_ID											AS MEMBER_ID,
        SUM(P.PRICE * O.ORDER_GOODS_QTY + P.DELIVERY_PRICE) AS TOTAL
FROM
		TB_ORDER O
	 INNER JOIN TB_MEMBER M
		     ON M.MEMBER_ID = O.MEMBER_ID
	 INNER JOIN TB_PRODUCT P
             ON P.PRODUCT_CD = O.PRODUCT_CD
GROUP BY
		M.MEMBER_ID
HAVING 
		TOTAL >= 7000000;


# 21) '사용자아이디'별로 주문금액 총합이 가장 많은 사람 3명의 아이디와 총 주문 금액을 순서대로 조회하기.

SELECT
		M.MEMBER_ID												AS MEMBER_ID,
        SUM(P.PRICE * O.ORDER_GOODS_QTY + P.DELIVERY_PRICE) 	AS TOTAL_PRICE
FROM
		TB_ORDER O
	 INNER JOIN TB_MEMBER M
		     ON M.MEMBER_ID = O.MEMBER_ID
	 INNER JOIN TB_PRODUCT P
             ON P.PRODUCT_CD = O.PRODUCT_CD
GROUP BY
		M.MEMBER_ID
ORDER BY 
		 TOTAL_PRICE DESC
LIMIT
		3;
        

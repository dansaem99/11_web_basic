USE SQL_ADVANCE_PRACTICE;
# TB_MEMBER, TB_PRODUCT , TB_ORDER 테이블 사용

# 1) 한번에 주문 수량이 10개 이상인 상품 정보 조회하기.
              
SELECT	*
FROM	TB_PRODUCT 
WHERE 	PRODUCT_CD IN (SELECT PRODUCT_CD
					   FROM	  TB_ORDER 
					   WHERE   ORDER_GOODS_QTY >= 10);     



# 2) 한번에 제일 많은 수량을 주문한 주문 코드 조회하기.

SELECT	ORDER_CD
FROM	TB_ORDER
WHERE	ORDER_GOODS_QTY IN (SELECT MAX(ORDER_GOODS_QTY) 
						    FROM   TB_ORDER);



# 3) 한번에 제일 많은 수량을 주문한 상품명 조회하기.

SELECT	PRODUCT_NM
FROM	TB_PRODUCT
WHERE	PRODUCT_CD = (SELECT PRODUCT_CD
					  FROM	 TB_ORDER
					  WHERE	 ORDER_GOODS_QTY IN (SELECT MAX(ORDER_GOODS_QTY) 
												 FROM   TB_ORDER));        
		
        
        
# 4) 한번에 제일 많은 수량을 주문한 유저의 모든 정보 조회하기.

SELECT	*
FROM	TB_MEMBER
WHERE	MEMBER_ID = (SELECT	MEMBER_ID
					 FROM	TB_ORDER
					 WHERE	ORDER_GOODS_QTY IN (SELECT MAX(ORDER_GOODS_QTY) 
											    FROM   TB_ORDER));       
                            
                                
                                
# 5) 배송이 완료된 상품의 회원테이블의 모든 정보 조회하기.

SELECT *
FROM   TB_MEMBER 
WHERE  MEMBER_ID IN (SELECT MEMBER_ID 
					 FROM   TB_ORDER 
					 WHERE  DELIVERY_STATUS = '배송완료');



# 6) 배송이 완료되지 않은 상품의 상품명 조회하기.

SELECT	PRODUCT_NM
FROM	TB_PRODUCT 
WHERE	PRODUCT_CD IN (SELECT PRODUCT_CD 
					   FROM   TB_ORDER 
					   WHERE  DELIVERY_STATUS <> '배송완료');


# 7) '메르켈' 회원이 주문한 상품 코드와 주문상품 명을 조회하기.

SELECT PRODUCT_CD,PRODUCT_NM
FROM   TB_PRODUCT
WHERE  PRODUCT_CD IN (SELECT PRODUCT_CD
					  FROM   TB_ORDER
					  WHERE  MEMBER_ID = (SELECT  MEMBER_ID
										  FROM    TB_MEMBER
									      WHERE	  MEMBER_NM = "메르켈")) ;


# 8) '메르켈' 회원의 총 주문수량을 조회하기.

SELECT SUM(ORDER_GOODS_QTY)
FROM   TB_ORDER
WHERE  MEMBER_ID = (SELECT	MEMBER_ID
					FROM	TB_MEMBER
					WHERE	MEMBER_NM = "메르켈");
  
  
  
# 9) 서울지역의 모든 제품의 판매수량의 총합을 조회하기.

SELECT	SUM(ORDER_GOODS_QTY)
FROM	TB_ORDER
WHERE	MEMBER_ID IN (SELECT MEMBER_ID
					  FROM	 TB_MEMBER
					  WHERE  RESIDENCE = '서울');



# 10) 삼성전자 2021 노트북 플러스2 15.6이 판매된 지역을 조회하기.

SELECT DISTINCT	RESIDENCE
FROM			TB_MEMBER
WHERE		    MEMBER_ID IN (SELECT MEMBER_ID
							  FROM   TB_ORDER
							  WHERE  PRODUCT_CD = (SELECT PRODUCT_CD
												   FROM	  TB_PRODUCT
												   WHERE  PRODUCT_NM = '삼성전자 2021 노트북 플러스2 15.6'));



# 11) 2020년 동안 판매된 상품의 양이 5개 미만인 상품 이름 조회하기.

SELECT	PRODUCT_NM
FROM	TB_PRODUCT
WHERE	PRODUCT_CD IN (SELECT 	 PRODUCT_CD
					   FROM 	 TB_ORDER 
					   WHERE 	 ORDER_DT BETWEEN '2020-01-01' AND '2020-12-31'
					   GROUP BY  PRODUCT_CD 
					   HAVING	 SUM(ORDER_GOODS_QTY) < 5);
                                
                                

# 12) user4가 주문한 주문보다 주문을 많이 한 회원의 아이디와 주문개수를 조회하기.

SELECT	 MEMBER_ID , SUM(ORDER_GOODS_QTY) AS TOTAL_ORDER
FROM	 TB_ORDER
GROUP BY MEMBER_ID
HAVING	 TOTAL_ORDER > (SELECT SUM(ORDER_GOODS_QTY) 
						FROM   TB_ORDER 
						WHERE  MEMBER_ID = 'user4');
								
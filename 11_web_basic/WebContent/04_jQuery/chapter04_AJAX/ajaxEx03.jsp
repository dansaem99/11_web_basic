<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>receive 예시</title>
<script src="04_jQuery/js/jquery-3.6.1.min.js"></script>
<script>

	$().ready(function(){
		
		$("#ajaxExBtn").click(function(){
				
			$.ajax({
				url : "ajaxEx03",
				type : "post",
				success : function(data, status, xhr) {
					
					// 통신이 성공했을 경우 실해되는 콜백 함수 (성공 리액션)
					console.log(" - 통신 성공 -");
					console.log(data); 		// 반환 데이터
					console.log(status); 	// 상태
					console.log(xhr); 		// 메타데이터 json형태로 알려준다.
					console.log("");
					
					let checkCnt = $("#checkCnt").text();
					checkCnt++;
					$("#checkCnt").text(checkCnt);
					
					$("#recvData").text(checkCnt + data);
					
				}
			});
			
		});
		
	});
</script>
</head>
<body>

	<p><img src="04_jQuery/images/pic_9.jpg" width="200" height="200"> </p>
	<h3>데이터 수신 횟수 : <span id="checkCnt">1</span></h3>
	<p>
		<span id="recvData"></span> <input type="button" id="ajaxExBtn" value="recvData">
	</p>
	
</body>
</html>
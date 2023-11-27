<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>ajax 기초</title>
<script src="04_jQuery/js/jquery-3.6.1.min.js"></script>
<script>

	/*
	
		# AJAX(Asynchronous Javascript And XML)
		
		- 웹 페이지 전체를 다시 로딩하지 않고도 웹 페이지의 일부분만을 갱신하여 사용할 수 있다.
		- 페이지의 전환 없이 서버와 브라우저가 비동기 방식으로 통신하여 데이터를 교환하고 그 결과를 웹 페이지의 일부분에만 표시할 수 있다.
		- 서버에서 처리가 완료될때까지 기다리지 않고 페이지 이동 없이 다른 프로세스를 진행할 수 있다.
		- 서버와 통신하기 위해 XMLHttpRequest 객체를 사용한다.
		- 서버와 주고받을 수 있는 데이터 형식은 JSON , XML , HTML 등이 있다.
		
			[ 형식 ]
		
		 $.ajax({
			 url : "",
			 type : "",
			 async : ,
			 cache : "",
			 contentType : 
			 data : "",
			 dataType : "",
			 success : function(data , status , xhr){
			 },
			 error : function(xhr , status , errorThrown){
			 },
			 complete : function(xhr , status){
			 }
		});
	
		1) url         : 요청이 전송될 URL주소를 작성한다.
		2) type        : 데이터 전송방식( get 또는 post )을 작성한다.
		3) async	   : true가 기본이며 비동기식으로 동작한다. false로 설정하게 되면 동기방식으로 동작한다.
		4) cache       : 요청 페이지의 브라우저 캐시 여부를 (false 또는 true) 통제한다. 
		5) contentType : 서버로 전송할 데이터의 타입이다. (application/x-www-form-urlencoded; charset=utf-8 , application/json; charset-utf-8)
		6) data        : 서버에 전송하고 싶은 데이터를 작성한다.
		7) dataType    : 서버에서 받아올 데이터를 어떤 형태(xml, json, html, script)로 해석할 것인지를 작성한다.
		8) success     : AJAX 통신에 성공했을 때 실행되는 콜백 함수이다.
		9) error       : AJAX 통신에 실패했을 때 실행되는 콜백 함수이다.
		10) complete   : AJAX 통신의 성공 및 실패와 상관없이 반드시 실행되는 콜백 함수이다.
	
	*/

	$().ready(function(){
		
		$("#ajaxExBtn").click(function(){
			
			// before
			var sendData = "testData1=" +$("#testData1").val();
				sendData += "&testData2=" + $("#testData2").val();
				sendData += "&testData3=임시데이터";
			
			// after
			var param = {
					"testData1" : $("#testData1").val(),
					"testData2" : $("#testData2").val(),
					"testData3" : "임시데이터"
			}
			
			$.ajax({
				url : "ajaxEx02",
				type : "post",
				// data : sendData
				data : param,
				success : function(){
					// 리액션
					let checkCnt = $("#checkCnt").text();
					checkCnt++;
					$("#checkCnt").text(checkCnt);
				}
			});
			
		});
		
	});
	
</script>
</head>
<body>

	<p><img src="04_jQuery/images/pic_9.jpg" width="200" height="200"> </p>
	<h3>데이터 전송횟수 : <span id="checkCnt">1</span></h3>
	
	<p>테스트 데이터1 : <input type="text" id="testData1"></p>
	<p>테스트 데이터2 : <textarea rows="10" cols="30" id="testData2"></textarea></p>
	<p><input type="button" id="ajaxExBtn" value="sendData"></p>	
</body>
</html>
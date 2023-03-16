<%@ page contentType="text/html; charset=EUC-KR" %>
<%@ page pageEncoding="EUC-KR"%>

<!--  ///////////////////////// JSTL  ////////////////////////// -->
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>

<!DOCTYPE html>

<html lang="ko">
	
<head>
	<meta charset="EUC-KR">
	
	<meta name="viewport" content="width=device-width, initial-scale=1.0" />
	
	<!--   jQuery , Bootstrap CDN  -->
	<link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.7/css/bootstrap.min.css" >
	<link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.7/css/bootstrap-theme.min.css" >
	<script src="https://code.jquery.com/jquery-3.1.1.min.js"></script>
	<script src="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.7/js/bootstrap.min.js" ></script>
	
	<!-- Bootstrap Dropdown Hover CSS -->
   <link href="/css/animate.min.css" rel="stylesheet">
   <link href="/css/bootstrap-dropdownhover.min.css" rel="stylesheet">
   
    <!-- Bootstrap Dropdown Hover JS -->
   <script src="/javascript/bootstrap-dropdownhover.min.js"></script>
	
	<!--  CSS 추가 : 툴바에 화면 가리는 현상 해결 :  주석처리 전, 후 확인-->
	<style>
        body {
            padding-top : 70px;
        }
   	</style>
   	
     <!--  ///////////////////////// JavaScript ////////////////////////// -->
	<script type="text/javascript">
	
	let arr = [
		{
			quote: "아이들은 누구나 예술가이다.",
			author: "피카소"
		},
		{
			quote: "내면의 목소리는 들리지 않게 된다.",
			author: "반 고흐"
		},
		{
			quote: "완벽을 두려워하지 말라.",
			author: "달리"
		},
		{
			quote: "영감이 오는 것을 기다리고 있을 수는 없다.",
			author: "런던"
		},
		{
			quote: "의욕만 있으면 이런 노력만으로도 얼마든지 많은 생각을 찾을 수 있다.",
			author: "수스"
		},
	];
	
	$(function(){
		var random = Math.floor(Math.random()* arr.length);
		$('#quote').text(arr[random].quote);
		$('#author').text(arr[random].author);	
		})
	})
	</script>
	
</head>
	
<body>

	<!-- ToolBar Start /////////////////////////////////////-->
	<jsp:include page="/layout/toolbar.jsp" />
   	<!-- ToolBar End /////////////////////////////////////-->

	<!--  아래의 내용은 http://getbootstrap.com/getting-started/  참조 -->	
   	<div class="container ">
      <!-- Main jumbotron for a primary marketing message or call to action -->
      <div class="jumbotron">
        <h1>Model2MVCShop </h1>
        <p>J2SE , DBMS ,JDBC , Servlet & JSP, Java Framework , HTML5 , UI Framework 학습 후 Mini-Project 진행</p>
     </div>
    </div>

	<!-- 참조 : http://getbootstrap.com/css/   : container part..... -->
	<div class="container">
        <h3>오늘의 명언</h3>
        <br/><br/><br/>
        
         <h3 id="quote">변명 중에서도 가장 어리석고 못난 변명은 "시간이 없어서" 라는 변명이다.</h3>
         <h2></h2>
         <h4 id="author">-Thomas Alva Edison-</h4>
  	 </div>

</body>

</html>
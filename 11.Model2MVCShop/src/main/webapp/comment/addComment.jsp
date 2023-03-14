<%@ page language="java" contentType="text/html; charset=EUC-KR"
    pageEncoding="EUC-KR"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html>
<html>
<head>
<title>리뷰하기</title>

	<!-- 참조 : http://getbootstrap.com/css/   참조 -->
	<meta name="viewport" content="width=device-width, initial-scale=1.0" />
	
	<!--  ///////////////////////// Bootstrap, jQuery CDN ////////////////////////// -->
	<link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.7/css/bootstrap.min.css" >
	<link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.7/css/bootstrap-theme.min.css" >
	<script src="https://code.jquery.com/jquery-3.1.1.min.js"></script>
	<script src="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.7/js/bootstrap.min.js" ></script>
	
	<!-- Bootstrap Dropdown Hover CSS -->
   <link href="/css/animate.min.css" rel="stylesheet">
   <link href="/css/bootstrap-dropdownhover.min.css" rel="stylesheet">
   
    <!-- Bootstrap Dropdown Hover JS -->
   <script src="/javascript/bootstrap-dropdownhover.min.js"></script>
   
   <style>
 		body {
            padding-top : 70px;
        }
     </style>
<script type="text/javascript">

$(function(){
	
	$("a[name='prePage']").on('click',function(){
		$(self.location).attr("href","/prch/listPurchase");
	})
	
	$("a[name='prch']").on('click',function(){
		$("form").attr("method","post").attr("action","/comment/addComment").submit();
	})
	
})
</script>
</head>

<body bgcolor="#ffffff" text="#000000">

<jsp:include page="/layout/toolbar.jsp" />

<div class="container">

      <!-- Static navbar -->
      <nav class="navbar navbar-default">
        <div class="container-fluid">
          <div class="navbar-header">
            <h3 class="text-info" href="#">리뷰하기</h3>
          </div>
          <div id="navbar" class="navbar-collapse collapse">
            <ul class="nav navbar-nav navbar-right">
            <li><a name='prch'><strong>리뷰등록</strong></a></li>
              <li><a name='prePage'><strong>돌아가기</strong></a></li>
            </ul>
          </div><!--/.nav-collapse -->
          
        </div><!--/.container-fluid -->
      </nav>
</div>

<div class="container">
	
		<div class="row">
	  		<div class="col-xs-4 col-md-2"><strong>상품번호 </strong></div>
			<div class="col-xs-8 col-md-4">${comment.purchase.purchaseProd.prodNo}</div>
		</div>
		
		<hr/>
		
		<div class="row">
	  		<div class="col-xs-4 col-md-2 "><strong>구매자 아이디 </strong></div>
			<div class="col-xs-8 col-md-4">${comment.purchase.buyer.userId}</div>
		</div>
		
		<hr/>
		
		<div class="row">
	  		<div class="col-xs-4 col-md-2 "><strong>상품명 </strong></div>
			<div class="col-xs-8 col-md-4">${comment.purchase.purchaseProd.prodName}</div>
		</div>
		
		<hr/>
		
		<div class="row">
	  		<div class="col-xs-4 col-md-2 "><strong>상품이미지 </strong></div>
			<div class="col-xs-8 col-md-4">
			<c:set var="i" value="0" />
				<c:forEach items="${fileList}" var="file" varStatus="status">
					<c:set var="i" value="${ i+1 }" />
					<img alt="상품 이미지" src="/images/uploadFiles/${file}" width="400px" height="400px"><br>
				</c:forEach>
			</div>		
		</div>
		<div>
		
		<hr/>
		
		<div class="row">
	  		<div class="col-xs-4 col-md-2 "><strong>상품상세정보 </strong></div>
			<div class="col-xs-8 col-md-4">${comment.purchase.purchaseProd.prodDetail}</div>
		</div>
		
		<hr/>
		
		<div class="row">
	  		<div class="col-xs-4 col-md-2"><strong>제조일자</strong></div>
			<div class="col-xs-8 col-md-4">${comment.purchase.purchaseProd.manuDate}</div>
		</div>
		
		<hr/>
		
		<div class="row">
	  		<div class="col-xs-4 col-md-2 "><strong>가격</strong></div>
			<div class="col-xs-8 col-md-4">${comment.purchase.purchaseProd.price}</div>
		</div>
		
		<hr/>
		
		<div class="row">
	  		<div class="col-xs-4 col-md-2 "><strong>등록일자</strong></div>
			<div class="col-xs-8 col-md-4">${comment.purchase.purchaseProd.regDate}</div>
		</div>
		
		<hr/>
		<br/><br/><br/>
		<hr/>
		<form name="detailForm">
		<div class="row">
	  		<div class="col-xs-4 col-md-2 "><strong>별점 선택</strong></div>
			<div class="col-xs-8 col-md-4">
				<label class="radio-inline">
				  <input type="radio" name="prodGrade" id="inlineRadio1" value="option1"> 1
				</label>
				<label class="radio-inline">
				  <input type="radio" name="prodGrade" id="inlineRadio2" value="option2"> 2
				</label>
				<label class="radio-inline">
				  <input type="radio" name="prodGrade" id="inlineRadio3" value="option3"> 3
				</label>
				<label class="radio-inline">
				  <input type="radio" name="prodGrade" id="inlineRadio3" value="option3"> 4
				</label>
				<label class="radio-inline">
				  <input type="radio" name="prodGrade" id="inlineRadio3" value="option3"> 5
				</label>
			</div>
		</div>
		
		<hr/>
		
		<div wid class="row">
	  		<span class="col-xs-4 col-md-2 "><strong>리뷰 입력(100자 이하)</strong></span>
			<span class="col-xs-8 col-md-4">
				<textarea rows="3" cols="40"  name="commentDetail"></textarea>
			</span>
		</div>
		<hr/>
		
		<input type="hidden" name="prodNo" value="${comment.purchase.purchaseProd.prodNo}">
		<input type="hidden" name="tranNo" value="${comment.purchase.tranNo}">
		</form>
 	</div>

</body>
</html>
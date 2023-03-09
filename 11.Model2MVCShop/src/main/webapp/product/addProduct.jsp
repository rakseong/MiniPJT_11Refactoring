<%@ page contentType="text/html; charset=EUC-KR"
    pageEncoding="EUC-KR"%>
<!DOCTYPE html>
<html>
<head>
<title>상품등록</title>
<meta name="viewport" content="width=device-width, initial-scale=1.0" />
<!--  ///////////////////////// Bootstrap, jQuery CDN ////////////////////////// -->
	<link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.7/css/bootstrap.min.css" >
	<link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.7/css/bootstrap-theme.min.css" >
	<script src="https://code.jquery.com/jquery-3.1.1.min.js"></script>
	<script src="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.7/js/bootstrap.min.js" ></script>
	
	<!--  ///////////////////////// CSS ////////////////////////// -->
	<style>
        
        body{
			padding-top : 70px;
			padding-bottom: 70px;
		}
	</style>
<script type="text/javascript" src="../javascript/calendar.js">
</script>
<script type="text/javascript">
	$(function(){
		$("button.btn.btn-default").on('click',function(){
			self.location = "/prod/listProduct?menu=manage";
		})
		
		$("a.btn-default.btn").on('click',function(){
			self.location = "../product/addProductView.jsp";
		})
		
	})
</script>
</head>

<body bgcolor="#ffffff" text="#000000">

<jsp:include page="/layout/toolbar.jsp" />

<div class="container">

      <div class="starter-template">
        <h1 class="text-center">상품등록</h1>
      </div>

</div>

<!--  화면구성 div Start /////////////////////////////////////-->
	<div class="container">
	<div class="row">
		<!-- form Start /////////////////////////////////////-->
		<div class="col-sm-offset-3 col-sm-6 panel panel-default">
		  <div class="panel-heading">
		    <h3 class="panel-title text-center">상품명</h3>
		  </div>
		  <div class="panel-body text-center">
		    ${vo.prodName}
		  </div>
		</div>
	</div>
	<div class="row">
		<div class="col-sm-offset-3 col-sm-6 panel panel-default">
		  <div class="panel-heading">
		    <h3 class="panel-title text-center">상품상세정보 </h3>
		  </div>
		  <div class="panel-body text-center">
		    ${vo.prodDetail}
		  </div>
		</div>
	</div>
	<div class="row">
		<div class="col-sm-offset-3 col-sm-6 panel panel-default">
		  <div class="panel-heading">
		    <h3 class="panel-title text-center">제조일자  </h3>
		  </div>
		  <div class="panel-body text-center">
		    ${vo.manuDate}
		  </div>
		</div>
	</div>
	<div class="row">
		<div class="col-sm-offset-3 col-sm-6 panel panel-default">
		  <div class="panel-heading">
		    <h3 class="panel-title text-center">가격</h3>
		  </div>
		  <div class="panel-body text-center">
		    ${vo.price}&nbsp;원
		  </div>
		</div>
	</div>
	<div class="row">
		<div class="panel panel-default">
		  <div class="panel-heading">
		    <h3 class="panel-title text-center">상품이미지</h3>
		  </div>
		  <div class="panel-body text-center">
		    <img alt="상품 이미지" src="/images/uploadFiles/${vo.fileName}">
		  </div>
		</div>
	</div>
		<!-- form Start /////////////////////////////////////-->
	<div class="form-group">
	    <div class="col-sm-offset-4  col-sm-4 text-center">
	      <button type="button" class="btn btn-default"  >확 &nbsp;인</button>
		  <a class="btn btn-default btn" href="#" role="button">추가등록</a>
	    </div>
	</div>
 	</div>
	<!--  화면구성 div end /////////////////////////////////////-->
</body>

</html>
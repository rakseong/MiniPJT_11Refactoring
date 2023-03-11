<%@ page language="java" contentType="text/html; charset=EUC-KR"
    pageEncoding="EUC-KR"%>
<!DOCTYPE html>
<html>
<head>
<title>회원정보수정</title>

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
		}
	</style>
<script type="text/javascript" src="/javascript/calendar.js"></script>

<script type="text/javascript">

$(function(){
	
	$("button.btn.btn-default").on('click',function(){
		
		var name = $("input[name='prodName']").val();
		var detail = $("textarea[name='prodDetail']").val();
		var manuDate = $("input[name='manuDate']").val();
		var price = $("input[name='price']").val();
		
		if(name == null || name.length<1){
			alert("상품명은 반드시 입력하여야 합니다.");
			return;
		}
		if(detail == null || detail.length<1){
			alert("상품상세정보는 반드시 입력하여야 합니다.");
			return;
		}
		if(manuDate == null || manuDate.length<1){
			alert("제조일자는 반드시 입력하셔야 합니다.");
			return;
		}
		if(price == null || price.length<1){
			alert("가격은 반드시 입력하셔야 합니다.");
			return;
		}
		
		$("form").attr("enctype","multipart/form-data").attr("method","POST").attr("action","/prod/updateProduct").submit();
		
	})
	
	$("a.btn-default.btn").on('click',function(){
		self.location = "/user/listUser"
	})
	
	$("img:first").on('click',function(){
		show_calendar('document.detailForm.manuDate', document.detailForm.manuDate.value);
	})
	
})


</script>
</head>

<body bgcolor="#ffffff" text="#000000">

<jsp:include page="/layout/toolbar.jsp" />

<div class="container">

      <div class="starter-template">
        <h1 class="text-center text-info">상품 수정</h1>
        <hr>
      </div>

</div>

<!--  화면구성 div Start /////////////////////////////////////-->
	<div class="container">
		<!-- form Start /////////////////////////////////////-->
		<form name="detailForm" class="form-horizontal">
		
		<input type="hidden" name="prodNo" value="${vo.prodNo}"/>
		<input type="hidden" name="menu" value="${menu}"/>
			
		<div class="form-group">
		    <label for="prodName" class="col-sm-offset-1 col-sm-3 control-label">상품명</label>
		    <div class="col-sm-4">
		      <input type="text" value="${vo.prodNo}" class="form-control" id="prodNo" name="prodNo" readonly="readonly">
		    </div>
		  </div>
		
		  <div class="form-group">
		    <label for="prodName" class="col-sm-offset-1 col-sm-3 control-label">상품명</label>
		    <div class="col-sm-4">
		      <input type="text" value="${vo.prodName}" class="form-control" id="prodName" name="prodName" placeholder="변경할 등록할 상품 이름">
		    </div>
		  </div>
		  
		  <div class="form-group">
		    <label for="prodDetail" class="col-sm-offset-1 col-sm-3 control-label">상품상세정보</label>
		    <div class="col-sm-4">
		      <textarea class="form-control"  value="${vo.prodDetail}" rows="3" id="prodDetail" name="prodDetail" placeholder="변경할 상품에 대한 간단한 설명"></textarea>
		    </div>
		  </div>
		  
		  <div class="form-group">
		    <label for="password2" class="col-sm-offset-1 col-sm-3 control-label">제조일자 </label>
		    <div class="col-sm-4">
		      <input type="text" class="form-control" value="${vo.manuDate}" id="manuDate" name="manuDate" placeholder="아래 캘린더 클릭 후 날짜를 선택" readonly>
		      <img src="../images/ct_icon_date.gif" width="15" height="15"/>
		    </div>
		  </div>
		  
		  <div class="form-group">
		    <label for="userName"  value="${vo.price}" class="col-sm-offset-1 col-sm-3 control-label">가격 </label>
		    <div class="col-sm-4">
		      <input type="text" class="form-control" id="price" name="price" placeholder="변경할 가격">
		    </div>
		  </div>
		  
		  <div class="form-group">
		    <label for="files" class="col-sm-offset-1 col-sm-3 control-label">상품이미지</label>
		    <div class="col-sm-4">
		      <input type="file" multiple="multiple" id="files" name="files" ><br><br>
		      <input type="hidden" name="fileName" value="${vo.fileName}">
		    </div>
		  </div>
		  
		  <div class="form-group">	
		  	<div class="col-sm-offset-3 col-sm-6">
		  	<img alt="상품 이미지" width="500px" height="500px" src="/images/uploadFiles/${vo.fileName}">
		  	</div>	
		  </div>
		  
		  <div class="form-group">
		    <div class="col-sm-offset-4  col-sm-4 text-center">
		      <button type="button" class="btn btn-default"  >수 &nbsp;정</button>
			  <a class="btn btn-default btn" href="#" role="button">취&nbsp;소</a>
		    </div>
		  </div>
		</form>
		<!-- form Start /////////////////////////////////////-->
		
 	</div>
	<!--  화면구성 div end /////////////////////////////////////-->
</body>
</html>
<%@ page contentType="text/html; charset=EUC-KR"
    pageEncoding="EUC-KR"%>
<!DOCTYPE html>
<html>
<head>

<link rel="stylesheet" href="/css/admin.css" type="text/css">

<title>Insert title here</title>
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
<script type="text/javascript" src="../javascript/calendar.js">
</script>

<script type="text/javascript">

$(function(){
	
	$("a[name='prch']").on('click',function(){
		
		$("form").attr("method","post").attr("action","/prch/addPurchase").attr("enctype","multipart/form-data").submit();
		
	})
	
	$("a[name='prePage']").on('click',function(){
		$("form")[0].reset();
	})
	
	$("img").on('click',function(){
		show_calendar('document.detailForm.divyDate', document.detailForm.divyDate.value);
	})
	
})
</script>
</head>

<body>

<jsp:include page="/layout/toolbar.jsp" />

<div class="container">

      <!-- Static navbar -->
      <nav class="navbar navbar-default">
        <div class="container-fluid">
          <div class="navbar-header">
            <h3 class="text-info" href="#">상품상세조회</h3>
          </div>
          <div id="navbar" class="navbar-collapse collapse">
            <ul class="nav navbar-nav navbar-right">
            <li><a name='prch'><strong>구매하기</strong></a></li>
              <li><a name='prePage'><strong>취소</strong></a></li>
            </ul>
          </div><!--/.nav-collapse -->
          
        </div><!--/.container-fluid -->
      </nav>
</div>



<div class="container">
	
		<div class="row">
	  		<div class="col-sm-offset-1 col-sm-3"><strong>상품번호 </strong></div>
			<div class="col-sm-4">${purchase.purchaseProd.prodNo}</div>
		</div>
		
		<hr/>
		
		<div class="row">
	  		<div class="col-sm-offset-1 col-sm-3"><strong>상품명 </strong></div>
			<div class="col-sm-4">${purchase.purchaseProd.prodName}</div>
		</div>
		
		<hr/>
		
		<div class="row">
	  		<div class="col-sm-offset-1 col-sm-3"><strong>상품상세정보 </strong></div>
			<div class="col-sm-4">${purchase.purchaseProd.prodDetail}</div>
		</div>
		
		<hr/>
		
		<div class="row">
	  		<div class="col-sm-offset-1 col-sm-3"><strong>제조일자</strong></div>
			<div class="col-sm-4">${purchase.purchaseProd.manuDate}</div>
		</div>
		
		<hr/>
		
		<div class="row">
	  		<div class="col-sm-offset-1 col-sm-3"><strong>가격</strong></div>
			<div class="col-sm-4">${purchase.purchaseProd.price}</div>
		</div>
		
		<hr/>
		
		<div class="row">
	  		<div class="col-sm-offset-1 col-sm-3"><strong>등록일자</strong></div>
			<div class="col-sm-4">${purchase.purchaseProd.prodRegDateString}</div>
		</div>
		
		<hr/>
		
 	</div>

	<div class="container">
		<!-- form Start /////////////////////////////////////-->
		<form name="detailForm" class="form-horizontal">
		  
		  <div class="form-group">
		    <label for="buyerId" class="col-sm-offset-1 col-sm-3 control-label">구매자 Id</label>
		    <div class="col-sm-4">
		      <input type="text" value="${user.userId}" class="form-control" id="buyerId" name="buyerId" readonly>
		    </div>
		  </div>
		  
		  <div class="form-group">
		    <label for="paymentOption" class="col-sm-offset-1 col-sm-3 control-label">결제 방법</label>
		    <div class="col-sm-4">
		      <select 	name="paymentOption" id="paymentOption"	class="form-control">
				<option value="1" selected="selected">현금구매</option>
				<option value="2">신용구매</option>
			</select>
		    </div>
		  </div>
		  
		  <div class="form-group">
		    <label for="receiverName" class="col-sm-offset-1 col-sm-3 control-label">수령인 이름</label>
		    <div class="col-sm-4">
		      <input type="text" value="${user.userName}" class="form-control" id="receiverName" name="receiverName" >
		    </div>
		  </div>
		  
		  <div class="form-group">
		    <label for="receiverPhone" class="col-sm-offset-1 col-sm-3 control-label">수령인 연락처</label>
		    <div class="col-sm-4">
		      <input type="text" value="${user.phone}" class="form-control" id="receiverPhone" name="receiverPhone" placeholder="'-'를 제외하고 입력해주세요">
		      <strong class="text-danger">정확한 핸드폰 번호를 입력해주세요</strong>
		    </div>
		  </div>
		  
		  <div class="form-group">
		    <label for="divyAddr" class="col-sm-offset-1 col-sm-3 control-label">배송 주소</label>
		    <div class="col-sm-4">
		      <input type="text" value="${user.addr}" class="form-control" id="divyAddr" name="divyAddr" placeholder="배송될 구매자 주소">
		    </div>
		  </div>
	
		  <div class="form-group">
		    <label for="divyRequest" class="col-sm-offset-1 col-sm-3 control-label">구매요청사항 </label>
		    <div class="col-sm-4">
		      <textarea class="form-control" row=3 id="divyRequest" name="divyRequest" placeholder="구매시 요청사항"></textarea>
		    </div>
		  </div>
		  
		  <div class="form-group">
		    <label for="divyDate" class="col-sm-offset-1 col-sm-3 control-label">배송희망일자 </label>
		    <span class="col-sm-4">
		      <input type="text" class="form-control" id="divyDate" readonly="readonly" name="divyDate" placeholder="배송희망 날짜">
		    </span>
		    <span>
		    	<img src="../images/ct_icon_date.gif" width="15" height="15"/>
		    </span>
		  </div>
		  
		  <input type="hidden" name="prodNo" value="${purchase.purchaseProd.prodNo}" />
		</form>
		<!-- form Start /////////////////////////////////////-->
		
 	</div>
	<!--  화면구성 div end /////////////////////////////////////-->

</body>
</html>
<%@ page language="java" contentType="text/html; charset=EUC-KR"
    pageEncoding="EUC-KR"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions" %>
<!DOCTYPE html>
<html>
<head>
<link rel="stylesheet" href="/css/admin.css" type="text/css">

<title>구매정보 수정</title>

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
   <script type="text/javascript" src="../javascript/calendar.js">
</script>
   
   <style>
 		body {
            padding-top : 70px;
        }
     </style>
<script type="text/javascript">
$(function(){
	
	$("a[name='update']").on('click',function(){
		
		$("form").attr("method","POST").attr("action","/prch/updatePurchase?tranNo=${purchase.tranNo}").submit();
		
	})
	
	$("a[name='prePage']").on('click',function(){
		self.location = "/prch/listPurchase";
	})
	
	$("img").on('click',function(){
		show_calendar('document.updatePurchase.divyDate', document.updatePurchase.divyDate.value);
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
            <h3 class="text-info" href="#">구매정보 수정</h3>
          </div>
          <div id="navbar" class="navbar-collapse collapse">
            <ul class="nav navbar-nav navbar-right">
            <li><a name='update'><strong>수정</strong></a></li>
             <li><a name='prePage'><strong>처음으로</strong></a></li>
            </ul>
          </div><!--/.nav-collapse -->
          
        </div><!--/.container-fluid -->
      </nav>
</div>


<div class="container">
	<form name="updatePurchase" class="form-horizontal">
	
		<div class="form-group">
		    <label for="buyerId" class="col-sm-offset-1 col-sm-3 control-label">구매자아이디</label>
		    <div class="col-sm-4">
		      <input type="text" value="${purchase.buyer.userId}" class="form-control" id="buyerId" name="buyerId" readonly="readonly">
		
		    </div>
		    <strong class="text-danger">아이디는 변경 불가능합니다.</strong>
		  </div>
		
		<hr/>
		
		<div class="form-group">
		    <label for="paymentOption" class="col-sm-offset-1 col-sm-3 control-label">구매자아이디</label>
		    <div class="col-sm-4">
		     <select 	name="paymentOption" id="paymentOption"	class="form-control" maxLength="20">
					<option value="1" ${fn:trim(purchase.paymentOption) eq '1'? 'selected' : ''}>현금구매</option>
					<option value="2" ${fn:trim(purchase.paymentOption) eq '2'? 'selected' : ''}>신용구매</option>
				</select>
		    </div>
		 </div>
		
		<hr/>
		<div class="form-group">
		    <label for="receiverName" class="col-sm-offset-1 col-sm-3 control-label">구매자이름</label>
		    <div class="col-sm-4">
		      <input type="text" value="${purchase.receiverName}" class="form-control" id="receiverName" name="receiverName" >
		    </div>
		  </div>
		
		<hr/>
		<div class="form-group">
		    <label for="receiverPhone" class="col-sm-offset-1 col-sm-3 control-label">구매자 연락처</label>
		    <div class="col-sm-4">
		      <input type="text" value="${purchase.receiverPhone}" class="form-control" id="receiverPhone" name="receiverPhone" >
		    </div>
		  </div>
		
		<hr/>
		<div class="form-group">
		    <label for="divyAddr" class="col-sm-offset-1 col-sm-3 control-label">구매자주소</label>
		    <div class="col-sm-4">
		      <input type="text" value="${purchase.divyAddr}" class="form-control" id="divyAddr" name="divyAddr">
		    </div>
		  </div>
		
		<hr/>
		<div class="form-group">
		    <label for="divyRequest" class="col-sm-offset-1 col-sm-3 control-label">구매요청사항</label>
		    <div class="col-sm-4">
		      <textarea row=3 class="form-control" id="divyRequest" name="divyRequest">${purchase.divyRequest}</textarea>
		    </div>
		  </div>
		
		<hr/>
		<div class="form-group">
		    <label for="divyDate" class="col-sm-offset-1 col-sm-3 control-label">배송희망일자</label>
		    <span class="col-sm-4">
		      <input type="text" value="${purchase.divyDate}" class="form-control" id="divyDate" name="divyDate" readonly="readonly">
		    </span>
		    <span>
		    	<img src="../images/ct_icon_date.gif" width="15" height="15"/>
		    </span>
		  </div>
		
		<hr/>
		</form>
 	</div>


</body>
</html>
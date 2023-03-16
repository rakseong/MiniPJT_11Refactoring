<%@ page contentType="text/html; charset=EUC-KR"
    pageEncoding="EUC-KR"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions" %>

<!DOCTYPE html>
<html>
<head>
<meta name="viewport" content="width=device-width, initial-scale=1.0" />
<title>상품 목록조회</title>

<style type="text/css">
	
	body{
		padding-top : 50px;
	}
</style>

<!--  ///////////////////////// Bootstrap, jQuery CDN ////////////////////////// -->
<link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.7/css/bootstrap.min.css" >
<link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.7/css/bootstrap-theme.min.css" >
<script src="https://code.jquery.com/jquery-3.1.1.min.js"></script>
<script src="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.7/js/bootstrap.min.js" ></script>
	
<link href="/css/animate.min.css" rel="stylesheet">
<link href="/css/bootstrap-dropdownhover.min.css" rel="stylesheet">
<!-- Bootstrap Dropdown Hover JS -->
<script src="/javascript/bootstrap-dropdownhover.min.js"></script>

<!-- jQuery UI toolTip 사용 CSS-->
<link rel="stylesheet" href="//code.jquery.com/ui/1.12.1/themes/base/jquery-ui.css">
<!-- jQuery UI toolTip 사용 JS-->
<script src="https://code.jquery.com/ui/1.12.1/jquery-ui.js"></script>

<script type="text/javascript">
function fncGetList(currentPage){
	$("#currentPage").val(currentPage);
	$("form").attr("method","POST").attr("action","/prod/listProduct").submit();
// 	document.getElementById("currentPage").value = currentPage;
// 	document.detailForm.submit();
}

function fncGetOrderList(currentPage,orderStandard){
	$("#orderStandard").val(orderStandard);
// 	document.getElementById("orderStandard").value = orderStandard;
	fncGetList(currentPage);
}

$(function(){
	
	$(".ct_list_pop:nth-child(4n+6)").css("background-color" , "whitesmoke");
	
	$("tbody td").css("height","75px");
	
	$("button").each(function(index,elem){
		$(elem).on('click',function(){
			var num = $($("button input")[index]).val();
			console.log(num);
			self.location = "/prch/updateTranCodeByProd?prodNo="+num+"&tranCode=2";
		})
	})
	
	$("td.getProd").each(function(index,elem){
		var num = $($("td.getProd input")[index]).val();
		$(elem).on('click',function(){
			self.location = "/prod/getProduct?productNo="+num+"&menu=${param.menu}";
		})
	})
	
});

</script>

</head>

<body bgcolor="#ffffff" text="#000000">
<form class="form-inline" name="detailForm">
	<jsp:include page="/layout/toolbar.jsp" />

<div class="container">

	<div class="page-header text-info">
	<h3></h3>
	</div>
	
<div class="row">
	<div class="col-md-6 text-left">
		    <p class="text-primary">
		    	전체  ${resultPage.totalCount } 건수, 현재 ${resultPage.currentPage}  페이지
		   	</p>
	</div>
	
		
				<input type="hidden" id="currentPage" name="currentPage" value=""/>
		
</div>


<table class="table table-hover table-striped">
	<thead>
		<tr>
			<th class="text-center">No</th>
			<th align="left">상품명</th>
			<th align="left">가격</th>
			<c:if test="${user.role ne 'admin' || empty user}">
			<th align="left">제조일자</th>
			</c:if>
			<c:if test="${user.role eq 'admin'}">
			<th align="left">등록일</th>	
			</c:if>
			<th align="left">현재상태</th>	
		</tr>
	</thead>
	<tbody>
		<c:set var="i" value="0"/>
		<c:forEach var="product" items="${list}">
		<c:set var="i" value="${ i+1 }" />
		<tr>
			<td align="center">${i}</td>
				<td class="getProd" align="left">
				${product.prodName}
				<input type="hidden" value="${product.prodNo}">
			</td>
			<td align="left">${product.price}</td>
			<c:if test="${user.role ne 'admin' || empty user}">
			<td align="left">${product.manuDate}
			</td>
			</c:if>
			<c:if test="${user.role eq 'admin'}">
			<td align="left">${product.regDate}
			</td>
			</c:if>
			<td align="left">
			<c:set var="tranCode" value="${fn:trim(product.proTranCode)}"/>
			<c:if test="${!empty user && user.role eq 'admin'}">
				<c:if test="${tranCode eq '0'}">
					판매중
				</c:if>
				<c:if test="${tranCode eq '1'}">
					구매완료
					<c:if test="${param.menu eq 'dev'}">
						&nbsp;&nbsp;&nbsp;&nbsp;
						<input type="hidden" value="${product.prodNo}">
						<button type="button" class="btn btn-default">배송하기</button>
					</c:if>
				</c:if>
				<c:if test="${tranCode eq '2'}">
					배송중
				</c:if>
				<c:if test="${tranCode eq '3'}">
					배송완료
				</c:if>
			</c:if>
			</td>
		</tr>
	</c:forEach>
	</tbody>
	
</table>
</div>
	<jsp:include page="../common/pageNavigator_new.jsp"/>

<!--  페이지 Navigator 끝 -->

</form>
</body>
</html>
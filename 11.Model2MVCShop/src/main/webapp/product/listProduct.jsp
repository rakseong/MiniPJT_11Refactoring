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
	
// 	let productIndex=1;
	
// 	$(window).scroll(function(){
// 			var scrollTop = $(this).scrollTop();
// 			var windowHeight = $(this).height();
// 			var documentHeight = $(document).height();
// 			//console.log("scrollTop : "+scrollTop+" windowHeight : "+windowHeight+" documentHeight : "+documentHeight)
		 	
// 			if(scrollTop + windowHeight == documentHeight && ${resultPage.totalCount}>= (productIndex*(${resultPage.pageSize}-1))){
// 				productIndex++;
// 				$.ajax({
// 					url : "/prod/json/prodListScroll",
// 					method : "POST",
// 					data : JSON.stringify({
// 						searchCondition : $("select[name='searchCondition']").val(),
// 						searchKeyword : $("input[name='searchKeyword']").val(),
// 						currentPage : productIndex
// 					}),
// 					headers : {
// 						"Accept" : "application/json",
// 						"Content-Type" : "application/json"
// 					},
// 					success : function(JSONData , status){
// 						var prodIndex = (${resultPage.pageSize} * (productIndex-1))+1;
// 						for(var i=0; i<JSONData.length; i++){
							
// 							let product = JSONData[i];
// 							console.log(product.prodName);
// 							$("table:last").append(	
									
// 							)//end of append
// 						}//end of for
// 					}//end of sucess
					
// 				})//end of scrollAjax
				
// 			}
// 	})//end of scroll
	
	$("#searchKeyword").on('keydown',function(){
		var condition = $("select[name=searchCondition]").val()
		$.ajax( 
				{
					url : "/prod/json/getProdListAutoComplete/"+condition ,
					method : "POST" ,
					dataType : "json" ,
					headers : {
						"Accept" : "application/json",
						"Content-Type" : "application/json"
					},
					success : function(JSONData , status) {
						var list = JSONData;
						console.log(list)
						$("#searchKeyword").autocomplete({
							source:list
						});
					}
			}); 
	});	
	
	$("button[type='button']:contains('검색')").on('click',function(){
		fncGetList(1);
	})
	
	$("ul.nav-pills li").each(function(index,elem){
		$(elem).on('click',function(){
			fncGetOrderList('1',index);
		})
	})
	
	$(".ct_list_pop:nth-child(4n+6)").css("background-color" , "whitesmoke");
	
	$("tbody td").css("height","75px");
	
	$(".ct_list_pop:contains('배송하기')").each(function(index,elem){
		var num = $($(".ct_list_pop:contains('배송하기') input")[index]).val();
		$(elem).on('click',function(){
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

	<jsp:include page="/layout/toolbar.jsp" />

<div class="container">

	<div class="page-header text-info">
	<h3>${(param.menu eq 'manage') ? '상품 관리' : '상품 목록 조회'}</h3>
	</div>
	
<div class="row">
	<div class="col-md-6 text-left">
		    <p class="text-primary">
		    	전체  ${resultPage.totalCount } 건수, 현재 ${resultPage.currentPage}  페이지
		   	</p>
	</div>
	
	<div class="col-md-6 text-right">
		<form class="form-inline" name="detailForm">
			    
				  <div class="form-group">
				    <select class="form-control" name="searchCondition" >
						<option value="0"  ${ ! empty search.searchCondition && search.searchCondition==0 ? "selected" : "" }>상품번호</option>
						<option value="1"  ${ ! empty search.searchCondition && search.searchCondition==1 ? "selected" : "" }>상품이름</option>
					</select>
				  </div>
				  
				  <div class="form-group">
				    <label class="sr-only" for="searchKeyword">검색어</label>
				    <input type="text" class="form-control" id="searchKeyword" name="searchKeyword"  placeholder="검색어"
				    			 value="${! empty search.searchKeyword ? search.searchKeyword : '' }"  >
				  </div>
				  
				  <button type="button" class="btn btn-default">검색</button>
				  
				  <!-- PageNavigation 선택 페이지 값을 보내는 부분 -->
				<input type="hidden" id="orderStandard" name="orderStandard" value="${search.orderStandard}"/>
				<input type="hidden" id="menu" name="menu" value="${param.menu}"/>
				<input type="hidden" id="currentPage" name="currentPage" value=""/>
		</form>
	</div>
</div>

	<ul class="nav nav-pills" role="tablist">
		<c:if test="${user.role eq 'admin'}">
		<li role="presentation"><a href="#">등록 번호순</a></li>
		</c:if>
        <li role="presentation"><a href="#">낮은 가격순</a></li>
        <li role="presentation"><a href="#">높은 가격순</a></li>
        <li role="presentation"><a href="#">이름순</a></li>
      </ul>

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
			<c:if test="${product.proTranCode ne '0' && param.menu eq 'manage'}">
				<td align="left">
			</c:if>
			<c:if test="${product.proTranCode eq '0' || (product.proTranCode ne '0' && param.menu eq 'search')}">
				<td class="getProd" align="left">
			</c:if>
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
					<c:if test="${param.menu eq 'manage'}">
						배송하기
						<input type="hidden" value="${product.prodNo}">
					</c:if>
				</c:if>
				<c:if test="${tranCode eq '2'}">
					배송중
				</c:if>
				<c:if test="${tranCode eq '3'}">
					배송완료
				</c:if>
			</c:if>
			<c:if test="${empty user || user.role ne 'admin'}">
				<c:if test="${tranCode eq '0'}">
					판매중
				</c:if>
				<c:if test="${tranCode eq '1' || tranCode eq '2' || tranCode eq '3'}">
					재고 없음
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


</body>
</html>
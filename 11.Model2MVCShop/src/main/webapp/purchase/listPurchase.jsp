<%@ page language="java" contentType="text/html; charset=EUC-KR"
    pageEncoding="EUC-KR"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions" %>
<!DOCTYPE html>
<html>
<head>
<title>구매 목록조회</title>

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

<style>
	  body {
            padding-top : 50px;
        }
        
      tbody td{
      		height : 75px;
      }
    </style>

<script type="text/javascript">
function fncGetList(currentPage) {
	$("#currentPage").val(currentPage);
	$("form").attr("method","POST").attr("action","/prch/listPurchase").submit();
}

$(function(){
	
	$("td.list_user").each(function(index,elem){
		$(elem).on('click',function(){
			self.location = "/user/getUser?userId="+$.trim($($(".ct_list_pop td")[3]).text());
		})
	})
	
	$("td.list_tranNo").each(function(index,elem){
		var num =$($("td.list_tranNo input")[index]).val();
		$(elem).on('click',function(){
			self.location = "/prch/getPurchase?tranNo="+num;
		})
	})
	
	$(".list_tranCode:contains('물건도착')").each(function(index,elem){
		var num = $($(".list_tranCode:contains('물건도착') input")[index]).val();
		$(elem).on('click',function(){
			self.location = "/prch/updateTranCode?tranNo="+num+"&tranCode=3";
		})
	})
	
	$(".list_tranCode:contains('리뷰하기')").each(function(index,elem){
		var num1 = $($(".list_tranCode:contains('리뷰하기') input")[index*2]).val();
		var num2 = $($(".list_tranCode:contains('리뷰하기') input")[(index*2)+1]).val();
		$(elem).on('click',function(){
			self.location = "/comment/addCommentView?tranNo="+num1+"&prodNo="+num2;
		})
	})

})

</script>

</head>

<body bgcolor="#ffffff" text="#000000">

<jsp:include page="/layout/toolbar.jsp" />

<div style="width: 98%; margin-left: 10px;">

<form name="detailForm" action="/prch/listPurchase" method="post">

<!--  화면구성 div Start /////////////////////////////////////-->
	<div class="container">
		
		<div class="page-header text-info">
	       <h3>회원목록조회</h3>
	    </div>
	    
	    <!-- table 위쪽 검색 Start /////////////////////////////////////-->
	    <div class="row">
	    
		    <div class="col-md-6 text-left">
		    	<p class="text-primary">
		    		전체  ${resultPage.totalCount } 건수, 현재 ${resultPage.currentPage}  페이지
		    	</p>
		    </div>
	    	
		</div>
		<!-- table 위쪽 검색 Start /////////////////////////////////////-->
		
	<form class="form-inline" name="detailForm">
      <!--  table Start /////////////////////////////////////-->
      <table class="table table-hover table-striped" >
      
        <thead>
          <tr>
            <th class="text-center">No</th>
            <th align="left" >회원 ID</th>
            <th align="left">회원명</th>
            <th align="left">수령인 전화번호</th>
            <th align="left">배송현황</th>
            <th align="left">정보수정</th>
          </tr>
        </thead>
       
		<tbody>
		
		  <c:set var="i" value="0" />
		  <c:forEach var="purchase" items="${list}">
			<c:set var="i" value="${ i+1 }" />
			<c:set var="tranCode" value="${fn:trim(purchase.tranCode)}"/>
			<tr class="ct_list_pop">
		 	<td class="list_tranNo text-center" title="Click : 구매정보 확인">
		 		${i}
		 		<input type="hidden" value="${purchase.tranNo}">
		 	</td>
			  <td class="list_user" title="Click : 회원정보 확인">${purchase.buyer.userId}</td>
			  <td align="left">${purchase.receiverName}</td>
			  <td align="left">${purchase.receiverPhone}</td>
			  <td align="left">현재
				<c:if test="${tranCode eq 1}">
					구매완료
				</c:if>
				<c:if test="${tranCode eq 2}">
					배송중
				</c:if>
				<c:if test="${tranCode eq 3 || tranCode eq 4}">
					배송완료
				</c:if>
						상태 입니다.
			  </td>
			  <td class="list_tranCode">
			  	<c:if test="${tranCode eq 2}">
					물건도착
					<input type="hidden" value="${purchase.tranNo}">
				</c:if>
				<c:if test="${tranCode eq 3}">
					리뷰하기
					<input type="hidden" value="${purchase.tranNo}">
					<input type="hidden" value="${purchase.purchaseProd.prodNo}">
				</c:if>
			  </td>
			</tr>
          </c:forEach>
        
        </tbody>
      
      </table>
       <input type="hidden" id="currentPage" name="currentPage" value=""/>
      </form>
	  <!--  table End /////////////////////////////////////-->
 	</div>
 	<!--  화면구성 div End /////////////////////////////////////-->

<jsp:include page="../common/pageNavigator_new.jsp"/>

<!--  페이지 Navigator 끝 -->
</form>

</div>

</body>
</html>

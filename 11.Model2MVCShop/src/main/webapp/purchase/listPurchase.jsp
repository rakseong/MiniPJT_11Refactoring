<%@ page language="java" contentType="text/html; charset=EUC-KR"
    pageEncoding="EUC-KR"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions" %>
<!DOCTYPE html>
<html>
<head>
<title>���� �����ȸ</title>

<link rel="stylesheet" href="/css/admin.css" type="text/css">
<script src="http://code.jquery.com/jquery-2.1.4.min.js"></script>
<script type="text/javascript">
function fncGetList(currentPage) {
	$("#currentPage").val(currentPage);
	$("form").attr("method","POST").attr("action","/prch/listPurchase").submit();
}

$(function(){
	
	$(".list_user").each(function(index,elem){
		$(elem).on('click',function(){
			self.location = "/user/getUser?userId="+$.trim($($(".ct_list_pop td")[3]).text());
		})
	})
	
	$(".list_tranNo").each(function(index,elem){
		var num =$($(".list_tranNo input")[index]).val();
		$(elem).on('click',function(){
			self.location = "/prch/getPurchase?tranNo="+num;
		})
	})
	
	$(".list_tranCode:contains('���ǵ���')").each(function(index,elem){
		var num = $($(".list_tranCode:contains('���ǵ���') input")[index]).val();
		$(elem).on('click',function(){
			self.location = "/prch/updateTranCode?tranNo="+num+"&tranCode=3";
		})
	})
	
	$(".list_tranCode:contains('�����ϱ�')").each(function(index,elem){
		var num1 = $($(".list_tranCode:contains('�����ϱ�') input")[index*2]).val();
		var num2 = $($(".list_tranCode:contains('�����ϱ�') input")[(index*2)+1]).val();
		$(elem).on('click',function(){
			self.location = "/comment/addCommentView?tranNo="+num1+"&prodNo="+num2;
		})
	})

})

</script>

</head>

<body bgcolor="#ffffff" text="#000000">

<div style="width: 98%; margin-left: 10px;">

<form name="detailForm" action="/prch/listPurchase" method="post">

<table width="100%" height="37" border="0" cellpadding="0"	cellspacing="0">
	<tr>
		<td width="15" height="37"><img src="/images/ct_ttl_img01.gif"width="15" height="37"></td>
		<td background="/images/ct_ttl_img02.gif" width="100%" style="padding-left: 10px;">
			<table width="100%" border="0" cellspacing="0" cellpadding="0">
				<tr>
					<td width="93%" class="ct_ttl01">���� �����ȸ</td>
				</tr>
			</table>
		</td>
		<td width="12" height="37"><img src="/images/ct_ttl_img03.gif"	width="12" height="37"></td>
	</tr>
</table>

<table width="100%" border="0" cellspacing="0" cellpadding="0"	style="margin-top: 10px;">
	<tr>
		<td colspan="11">��ü ${resultPage.totalCount} �Ǽ�, ���� ${resultPage.currentPage} ������</td>
	</tr>
	<tr>
		<td class="ct_list_b" width="100">No</td>
		<td class="ct_line02"></td>
		<td class="ct_list_b" width="150">ȸ��ID</td>
		<td class="ct_line02"></td>
		<td class="ct_list_b" width="150">ȸ����</td>
		<td class="ct_line02"></td>
		<td class="ct_list_b">������ ��ȭ��ȣ</td>
		<td class="ct_line02"></td>
		<td class="ct_list_b">�����Ȳ</td>
		<td class="ct_line02"></td>
		<td class="ct_list_b">��������</td>
	</tr>
	<tr>
		<td colspan="11" bgcolor="808285" height="1"></td>
	</tr>
	
	<c:set var="i" value="0"/>
	<c:forEach var="purchase" items="${list}">
		<c:set var="i" value="${ i+1 }" />
		<c:set var="tranCode" value="${fn:trim(purchase.tranCode)}"/>
	 <tr class="ct_list_pop">
	 	<c:if test="${tranCode eq '0' || tranCode eq '1'}">
	 	<td class="list_tranNo" align="center">
	 		${i}
	 		<input type="hidden" value="${purchase.tranNo}">
	 	</c:if>
	 	<c:if test="${tranCode eq '2' || tranCode eq '3'}">
	 	<td align="center">
			${i}
		</c:if>
		</td>
		<td></td>
		<td class="list_user" align="left">
			${purchase.buyer.userId}
		</td>
		<td></td>
		<td align="left">${purchase.receiverName}</td>
		<td></td>
		<td align="left">${purchase.receiverPhone}</td>
		<td></td>
		<td align="left">����
		<c:if test="${tranCode eq 1}">
			���ſϷ�
		</c:if>
		<c:if test="${tranCode eq 2}">
			�����
		</c:if>
		<c:if test="${tranCode eq 3}">
			��ۿϷ�
		</c:if>
				���� �Դϴ�.</td>
		<td></td>
		<td class="list_tranCode" align="left">
		<c:if test="${tranCode eq 2}">
			���ǵ���
			<input type="hidden" value="${purchase.tranNo}">
		</c:if>
		<c:if test="${tranCode eq 3}">
			�����ϱ�
			<input type="hidden" value="${purchase.tranNo}">
			<input type="hidden" value="${purchase.purchaseProd.prodNo}">
		</c:if>
		</td>
	</tr>
	<tr>
		<td colspan="11" bgcolor="D6D7D6" height="1"></td>
	</tr>
	</c:forEach>
</table>

<table width="100%" border="0" cellspacing="0" cellpadding="0" style="margin-top: 10px;">
	<tr>
		<td align="center">
		<input type="hidden" id="currentPage" name="currentPage" value=""/>
		<jsp:include page="../common/pageNavigator.jsp"/>
		</td>
	</tr>
</table>

<!--  ������ Navigator �� -->
</form>

</div>

</body>
</html>

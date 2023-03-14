<%@ page contentType="text/html; charset=EUC-KR"
    pageEncoding="EUC-KR"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>

<!DOCTYPE html>
<html>
<head>

<meta charset="EUC-KR">
	
	<!-- ���� : http://getbootstrap.com/css/   ���� -->
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
	function fncGetList(currentPage){
		$("#currentPage").val(currentPage);
		$("form").attr("method" , "POST").attr("action" , "/prod/getProd").submit();
	}

	$(function(){
		
		$("a[name='prch']").on('click',function(){
			
			self.location = "/prch/addPurchase?prod_no=${vo.prodNo}";
		})
		
		$("a[name='prePage']").on('click',function(){
			self.location = "/prod/listProduct?menu=${param.menu}";;
		})
		
	})
</script>
<title>Insert title here</title>
</head>

<body>

<jsp:include page="/layout/toolbar.jsp" />

<div class="container">

      <!-- Static navbar -->
      <nav class="navbar navbar-default">
        <div class="container-fluid">
          <div class="navbar-header">
            <h3 class="text-info" href="#">��ǰ����ȸ</h3>
          </div>
          <div id="navbar" class="navbar-collapse collapse">
            <ul class="nav navbar-nav navbar-right">
            <li><a name='prePage'><strong>Ȯ��</strong></a></li>
              <c:if test="${!empty user && vo.proTranCode eq '0'}">
              <li><a name='prch'><strong>����</strong></a></li>
            </c:if>
            </ul>
          </div><!--/.nav-collapse -->
          
        </div><!--/.container-fluid -->
      </nav>
</div>

<div class="container">
	
		<div class="row">
	  		<div class="col-xs-4 col-md-2"><strong>��ǰ��ȣ </strong></div>
			<div class="col-xs-8 col-md-4">${param.productNo}</div>
		</div>
		
		<hr/>
		
		<div class="row">
	  		<div class="col-xs-4 col-md-2 "><strong>��ǰ�� </strong></div>
			<div class="col-xs-8 col-md-4">${vo.prodName}</div>
		</div>
		
		<hr/>
		
		<div class="row">
	  		<div class="col-xs-4 col-md-2 "><strong>��ǰ�̹��� </strong></div>
			<div class="col-xs-8 col-md-4">
			<c:set var="i" value="0" />
				<c:forEach items="${fileList}" var="file" varStatus="status">
					<c:set var="i" value="${ i+1 }" />
					<img alt="��ǰ �̹���" src="/images/uploadFiles/${file}" width="400px" height="400px"><br>
				
				</c:forEach>
			</div>
		</div>
		
		<hr/>
		
		<div class="row">
	  		<div class="col-xs-4 col-md-2 "><strong>��ǰ������ </strong></div>
			<div class="col-xs-8 col-md-4">${vo.prodDetail}</div>
		</div>
		
		<hr/>
		
		<div class="row">
	  		<div class="col-xs-4 col-md-2"><strong>��������</strong></div>
			<div class="col-xs-8 col-md-4">${vo.manuDate}</div>
		</div>
		
		<hr/>
		
		<div class="row">
	  		<div class="col-xs-4 col-md-2 "><strong>����</strong></div>
			<div class="col-xs-8 col-md-4">${vo.price}</div>
		</div>
		
		<hr/>
		
		<div class="row">
	  		<div class="col-xs-4 col-md-2 "><strong>�������</strong></div>
			<div class="col-xs-8 col-md-4">${vo.regDate}</div>
		</div>
		
		<hr/>
		
 	</div>
 	<br><br>
 <div class="container">
 <c:if test="${resultPage.totalCount != 0}">
 	<div class="row">
 		<div>
	       <h3 class=" text-success">${vo.prodName}�� ���� ����</h3>
	    </div>
	</div>
	
	<table class="table table-hover table-striped" >
      
        <thead>
          <tr>
            <th class="text-center">No</th>
            <th align="left" >�ۼ���</th>
            <th align="left">����</th>
            <th align="left">��������</th>
            <th align="left">����</th>
          </tr>
        </thead>
       
		<tbody>
		  <c:set var="i" value="0" />
		  <c:forEach var="comment" items="${list}">
			<c:set var="i" value="${ i+1 }" />
			<tr>
			  <td align="center">${ i }</td>
			  <td align="left">${comment.userId}</td>
			  <td align="left">${comment.prodGrade} / 5</td>
			  <td align="left">${comment.commentRegDate}</td>
			  <td align="left">${comment.commentDetail}</td>
			</tr>
          </c:forEach>
        
        </tbody>
      
      </table>
<form>
	<input type="hidden" id="currentPage" name="currentPage" value="${resultPage.currentPage}"/>
	<input type="hidden" id="productNo" name="productNo" value="${param.productNo}"/>
	<jsp:include page="../common/pageNavigator_new.jsp"/>
</form>
</c:if>
</div>
<div class="container">
	
</div>
</body>
</html>
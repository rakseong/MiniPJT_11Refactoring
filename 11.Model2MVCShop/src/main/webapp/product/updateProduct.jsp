<%@ page language="java" contentType="text/html; charset=EUC-KR"
    pageEncoding="EUC-KR"%>
<!DOCTYPE html>
<html>
<head>
<title>ȸ����������</title>

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
			alert("��ǰ���� �ݵ�� �Է��Ͽ��� �մϴ�.");
			return;
		}
		if(detail == null || detail.length<1){
			alert("��ǰ�������� �ݵ�� �Է��Ͽ��� �մϴ�.");
			return;
		}
		if(manuDate == null || manuDate.length<1){
			alert("�������ڴ� �ݵ�� �Է��ϼž� �մϴ�.");
			return;
		}
		if(price == null || price.length<1){
			alert("������ �ݵ�� �Է��ϼž� �մϴ�.");
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
        <h1 class="text-center text-info">��ǰ ����</h1>
        <hr>
      </div>

</div>

<!--  ȭ�鱸�� div Start /////////////////////////////////////-->
	<div class="container">
		<!-- form Start /////////////////////////////////////-->
		<form name="detailForm" class="form-horizontal">
		
		<input type="hidden" name="prodNo" value="${vo.prodNo}"/>
		<input type="hidden" name="menu" value="${menu}"/>
			
		<div class="form-group">
		    <label for="prodName" class="col-sm-offset-1 col-sm-3 control-label">��ǰ��</label>
		    <div class="col-sm-4">
		      <input type="text" value="${vo.prodNo}" class="form-control" id="prodNo" name="prodNo" readonly="readonly">
		    </div>
		  </div>
		
		  <div class="form-group">
		    <label for="prodName" class="col-sm-offset-1 col-sm-3 control-label">��ǰ��</label>
		    <div class="col-sm-4">
		      <input type="text" value="${vo.prodName}" class="form-control" id="prodName" name="prodName" placeholder="������ ����� ��ǰ �̸�">
		    </div>
		  </div>
		  
		  <div class="form-group">
		    <label for="prodDetail" class="col-sm-offset-1 col-sm-3 control-label">��ǰ������</label>
		    <div class="col-sm-4">
		      <textarea class="form-control"  value="${vo.prodDetail}" rows="3" id="prodDetail" name="prodDetail" placeholder="������ ��ǰ�� ���� ������ ����"></textarea>
		    </div>
		  </div>
		  
		  <div class="form-group">
		    <label for="password2" class="col-sm-offset-1 col-sm-3 control-label">�������� </label>
		    <div class="col-sm-4">
		      <input type="text" class="form-control" value="${vo.manuDate}" id="manuDate" name="manuDate" placeholder="�Ʒ� Ķ���� Ŭ�� �� ��¥�� ����" readonly>
		      <img src="../images/ct_icon_date.gif" width="15" height="15"/>
		    </div>
		  </div>
		  
		  <div class="form-group">
		    <label for="userName"  value="${vo.price}" class="col-sm-offset-1 col-sm-3 control-label">���� </label>
		    <div class="col-sm-4">
		      <input type="text" class="form-control" id="price" name="price" placeholder="������ ����">
		    </div>
		  </div>
		  
		  <div class="form-group">
		    <label for="files" class="col-sm-offset-1 col-sm-3 control-label">��ǰ�̹���</label>
		    <div class="col-sm-4">
		      <input type="file" multiple="multiple" id="files" name="files" ><br><br>
		      <input type="hidden" name="fileName" value="${vo.fileName}">
		    </div>
		  </div>
		  
		  <div class="form-group">	
		  	<div class="col-sm-offset-3 col-sm-6">
		  	<img alt="��ǰ �̹���" width="500px" height="500px" src="/images/uploadFiles/${vo.fileName}">
		  	</div>	
		  </div>
		  
		  <div class="form-group">
		    <div class="col-sm-offset-4  col-sm-4 text-center">
		      <button type="button" class="btn btn-default"  >�� &nbsp;��</button>
			  <a class="btn btn-default btn" href="#" role="button">��&nbsp;��</a>
		    </div>
		  </div>
		</form>
		<!-- form Start /////////////////////////////////////-->
		
 	</div>
	<!--  ȭ�鱸�� div end /////////////////////////////////////-->
</body>
</html>
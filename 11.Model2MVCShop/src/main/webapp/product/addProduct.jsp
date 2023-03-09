<%@ page contentType="text/html; charset=EUC-KR"
    pageEncoding="EUC-KR"%>
<!DOCTYPE html>
<html>
<head>
<title>��ǰ���</title>
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
        <h1 class="text-center">��ǰ���</h1>
      </div>

</div>

<!--  ȭ�鱸�� div Start /////////////////////////////////////-->
	<div class="container">
	<div class="row">
		<!-- form Start /////////////////////////////////////-->
		<div class="col-sm-offset-3 col-sm-6 panel panel-default">
		  <div class="panel-heading">
		    <h3 class="panel-title text-center">��ǰ��</h3>
		  </div>
		  <div class="panel-body text-center">
		    ${vo.prodName}
		  </div>
		</div>
	</div>
	<div class="row">
		<div class="col-sm-offset-3 col-sm-6 panel panel-default">
		  <div class="panel-heading">
		    <h3 class="panel-title text-center">��ǰ������ </h3>
		  </div>
		  <div class="panel-body text-center">
		    ${vo.prodDetail}
		  </div>
		</div>
	</div>
	<div class="row">
		<div class="col-sm-offset-3 col-sm-6 panel panel-default">
		  <div class="panel-heading">
		    <h3 class="panel-title text-center">��������  </h3>
		  </div>
		  <div class="panel-body text-center">
		    ${vo.manuDate}
		  </div>
		</div>
	</div>
	<div class="row">
		<div class="col-sm-offset-3 col-sm-6 panel panel-default">
		  <div class="panel-heading">
		    <h3 class="panel-title text-center">����</h3>
		  </div>
		  <div class="panel-body text-center">
		    ${vo.price}&nbsp;��
		  </div>
		</div>
	</div>
	<div class="row">
		<div class="panel panel-default">
		  <div class="panel-heading">
		    <h3 class="panel-title text-center">��ǰ�̹���</h3>
		  </div>
		  <div class="panel-body text-center">
		    <img alt="��ǰ �̹���" src="/images/uploadFiles/${vo.fileName}">
		  </div>
		</div>
	</div>
		<!-- form Start /////////////////////////////////////-->
	<div class="form-group">
	    <div class="col-sm-offset-4  col-sm-4 text-center">
	      <button type="button" class="btn btn-default"  >Ȯ &nbsp;��</button>
		  <a class="btn btn-default btn" href="#" role="button">�߰����</a>
	    </div>
	</div>
 	</div>
	<!--  ȭ�鱸�� div end /////////////////////////////////////-->
</body>

</html>
<%@ page contentType="text/html; charset=EUC-KR"
    pageEncoding="EUC-KR"%>
<!DOCTYPE html>
<html>
<head>
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
	
<script type="text/javascript">

$(function(){
	
	$("a[name='listPrch']").on('click',function(){
		
		$(self.location).attr("href","/prch/listPurchase");
		
	})
	
	$("a[name='listProd']").on('click',function(){
		$(self.location).attr("href","/prod/listProduct?menu=search");
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
            <h3 class="text-info" href="#">������ ���� ���Ű� �Ǿ����ϴ�.</h3>
          </div>
          <div id="navbar" class="navbar-collapse collapse">
            <ul class="nav navbar-nav navbar-right">
            <li><a name='listPrch'><strong>���Ÿ��</strong></a></li>
              <li><a name='listProd'><strong>���ư���</strong></a></li>
            </ul>
          </div><!--/.nav-collapse -->
          
        </div><!--/.container-fluid -->
      </nav>
</div>

<div class="container">
	
		<div class="row">
	  		<div class="col-sm-offset-1 col-sm-3"><strong>��ǰ��ȣ </strong></div>
			<div class="col-sm-4">${purchase.purchaseProd.prodNo}</div>
		</div>
		
		<hr/>
		
		<div class="row">
	  		<div class="col-sm-offset-1 col-sm-3"><strong>��ǰ�� </strong></div>
			<div class="col-sm-4">${purchase.purchaseProd.prodName}</div>
		</div>
		
		<hr/>
		
		<div class="row">
	  		<div class="col-sm-offset-1 col-sm-3"><strong>��ǰ������ </strong></div>
			<div class="col-sm-4">${purchase.purchaseProd.prodDetail}</div>
		</div>
		
		<hr/>
		
		<div class="row">
	  		<div class="col-sm-offset-1 col-sm-3"><strong>��������</strong></div>
			<div class="col-sm-4">${purchase.purchaseProd.manuDate}</div>
		</div>
		
		<hr/>
		
		<div class="row">
	  		<div class="col-sm-offset-1 col-sm-3"><strong>����</strong></div>
			<div class="col-sm-4">${purchase.purchaseProd.price}</div>
		</div>
		
		<hr/>
		
		<div class="row">
	  		<div class="col-sm-offset-1 col-sm-3"><strong>�������</strong></div>
			<div class="col-sm-4">${purchase.purchaseProd.prodRegDateString}</div>
		</div>
		
		<hr/>
		<br><br><br><br>
		<hr/>
		<div class="row">
	  		<div class="col-sm-offset-1 col-sm-3"><strong>������ Id </strong></div>
			<div class="col-sm-4">${purchase.buyer.userId}</div>
		</div>
		
		<hr/>
		
		<div class="row">
	  		<div class="col-sm-offset-1 col-sm-3"><strong>���Ź�� </strong></div>
			<div class="col-sm-4">${(purchase.paymentOption eq '1') ? '���ݱ���' : 'ī�屸��'}</div>
		</div>
		
		<hr/>
		
		<div class="row">
	  		<div class="col-sm-offset-1 col-sm-3"><strong>������ �̸�</strong></div>
			<div class="col-sm-4">${purchase.receiverName}</div>
		</div>
		
		<hr/>
		
		<div class="row">
	  		<div class="col-sm-offset-1 col-sm-3"><strong>������ ����ó</strong></div>
			<div class="col-sm-4">${purchase.receiverPhone}</div>
		</div>
		
		<hr/>
		
		<div class="row">
	  		<div class="col-sm-offset-1 col-sm-3"><strong>��� �ּ�</strong></div>
			<div class="col-sm-4">${purchase.divyAddr}</div>
		</div>
		
		<hr/>
		
		<div class="row">
	  		<div class="col-sm-offset-1 col-sm-3"><strong>���ſ�û����</strong></div>
			<div class="col-sm-4">${purchase.divyRequest}</div>
		</div>
		
		<hr/>
		
		<div class="row">
	  		<div class="col-sm-offset-1 col-sm-3"><strong>����������</strong></div>
			<div class="col-sm-4">${purchase.divyDate}</div>
		</div>
		
		<hr/>
		
</div>

</body>
</html>
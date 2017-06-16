<%@ page language="java" contentType="text/html; charset=EUC-KR"
	pageEncoding="EUC-KR"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=EUC-KR">
<link rel="stylesheet" href="/Bears/css/bootstrap.css" />
<title>������ ���� ����</title>
<style type="text/css">
#mainDiv{
	width: 80%;
	height : 80%;
	margin: 0 auto;
}
#innerDiv {
	width : 20%;
	margin : 0 auto;
	vertical-align: middle;
}
#buttonDiv{
	width : 50%;
	margin : 0 auto;
	vertical-align: middle;
	text-align: center;
}
</style>
</head>
<script type="text/javascript">
	//�������̸� ��������
	function checkBrandname(obj){
		if(!obj.value){
			alert('brandename �Է�!');
			obj.value='';
		}else if(obj.value.length>25){
			alert('brandname�� 25������!');
			obj.value='';
		}
	}
	//�귣���ȣ ��������
	function checkBrandno(obj){
		if(!obj.value){
			alert('brandno �Է�!');
			obj.value='';
		}else if(isNaN(obj.value)||obj.value.length>3){
			alert('brandno�� 3�ڸ����ϼ��ڸ�!');
			obj.value='';
		}
	}


	
	//�ڷ�
	function backAdminBrand(){
		document.location.href='/Bears/jsp/admin/AdminBrand.jsp';
	}
	//�߰�
	function brandInsert(){
		var obj = document.brandFrm;
		alert('�귣���߰��� �Ϸ�Ǿ����ϴ�!');
		obj.submit();			
	}
</script>
<body>
<%
	request.setCharacterEncoding("EUC-KR");
%>
	<h2 align="center"> ������ �߰� </h2><br><br>
	<form action="/Bears/jsp/admin/insert/BrandInsertProcess.jsp" name="brandFrm" method="post">
		<div id="mainDiv">
			<div id="innerDiv">
				<h4>�귣���̸�</h4> 
				<input type="text" name="brandname" onblur="checkBrandname(this)" class="form-control" placeholder="brandname" aria-describedby="basic-addon2" >
				<h4>�귣���ȣ</h4> 
				<input type="text" name="brandno" onblur="checkBrandno(this)" class="form-control" placeholder="brandno" aria-describedby="basic-addon2">
				
			</div>
			<br><br><br>
			<div id="buttonDiv">
				<button type="button" class="btn btn-default" onclick="brandInsert()">�߰�</button>
				<button type="button" class="btn btn-default" onclick="backAdminBrand()">�ڷ�</button>
			</div>
		</div>
	</form>
</body>
</html>
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
	function checkStorename(obj){
		if(!obj.value){
			alert('storename �Է�!');
			obj.value='';
		}else if(obj.value.length>25){
			alert('storename�� 25������!');
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
	//��������ġ ��������
	function checkLocation(obj){
		if(!obj.value){
			alert('location �Է�!');
			obj.value='';
		}else if(obj.value.length>100){
			alert('location�� 100�ڸ�����!');
			obj.value='';
		}
	}
	//���������� ��������
	function checkGpa(obj){
		if(obj.value.length>1 || isNaN(obj.value)){
			alert('gpa�� ���ڸ����ڸ�!');
			obj.value='';
		}
	}
	//�����ð� ��������
	function checkHours(obj){
		if(!obj.value){
			alert('hours �Է�!');
			obj.value='';
		}else if(obj.value.length>25){
			alert('hours�� 25�ڸ�����!');
			obj.value='';
		}
	}
	//��ȭ��ȣ ��������
	function checkTel(obj){
		if(!obj.value){
			alert('tel �Է�!');
			obj.value='';
		}else if(obj.value.length>20){
			alert('tel�� 20�ڸ�����!');
			obj.value='';
		}
	}
	//����ּҰ��� ��������
	function checkMinprice(obj){
		if(!obj.value){
			alert('minprice �Է�!');
			obj.value='';
		}else if(obj.value.length>5||isNaN(obj.value)){
			alert('minprice�� 5�ڸ����� ���ڸ�!');
			obj.value='';
		}
	}

	
	//�ڷ�
	function backAdminStore(){
		document.location.href='/Bears/jsp/admin/AdminStore.jsp';
	}
	//�߰�
	function storeInsert(){
		var obj = document.storeFrm;
		alert('�������߰��� �Ϸ�Ǿ����ϴ�!');
		obj.submit();			
	}
</script>
<body>
<%
	request.setCharacterEncoding("EUC-KR");
%>
	<h2 align="center"> ������ �߰� </h2><br><br>
	<form action="/Bears/jsp/admin/insert/StoreInsertProcess.jsp" name="storeFrm" method="post">
		<div id="mainDiv">
			<div id="innerDiv">
				<h4>�������̸�</h4> 
				<input type="text" name="storename" onblur="checkStorename(this)" class="form-control" placeholder="storename" aria-describedby="basic-addon2" >
				<h4>�귣���ȣ</h4> 
				<input type="text" name="brandno" onblur="checkBrandno(this)" class="form-control" placeholder="brandno" aria-describedby="basic-addon2">
				<h4>��������ġ</h4> 
				<input type="text" name="location" onblur="checkLocation(this)" class="form-control" placeholder="location" aria-describedby="basic-addon2">
				<h4>����������</h4> 
				<input type="text" name="gpa" onblur="checkGpa(this)" class="form-control" placeholder="gpa" aria-describedby="basic-addon2">
				<h4>�����ð�</h4> 
				<input type="text" name="hours" onblur="checkHours(this)" class="form-control" placeholder="hours" aria-describedby="basic-addon2">
				<h4>��ȭ��ȣ</h4> 
				<input type="text" name="tel" onblur="checkTel(this)" class="form-control" placeholder="tel" aria-describedby="basic-addon2">
				<h4>����ּҰ���</h4> 
				<input type="text" name="minprice" onblur="checkMinprice(this)" class="form-control" placeholder="minprice" aria-describedby="basic-addon2">
				<h4>����������</h4> 
				<input type="text" name="info" onblur="checkInfo(this)" class="form-control" placeholder="info" aria-describedby="basic-addon2">
			</div>
			<br><br><br>
			<div id="buttonDiv">
				<button type="button" class="btn btn-default" onclick="storeInsert()">�߰�</button>
				<button type="button" class="btn btn-default" onclick="backAdminStore()">�ڷ�</button>
			</div>
		</div>
	</form>
</body>
</html>
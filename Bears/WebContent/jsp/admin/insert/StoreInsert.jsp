<%@ page language="java" contentType="text/html; charset=EUC-KR"
	pageEncoding="EUC-KR"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=EUC-KR">
<link rel="stylesheet" href="/Bears/css/bootstrap.css" />
<title>������ ���� ����</title>
<style type="text/css">
</style>
</head>
<script type="text/javascript">
	//�ڷ�
	function backAdminStore(){
		document.location.href='/Bears/jsp/admin/AdminStore.jsp';
		
	}
	
	//�߰�
	function storeInsert(){
		var obj = document.storeFrm;
		if(!obj.storename.value||!obj.brandno.value||!obj.location.value||!obj.gpa.value||!obj.hours.value||
				!obj.tel.value||!obj.minprice.value||!obj.info.value){
			alert('��� �Է��ϼ���!');
		}else{
			alert('����!');
			//obj.submit();			
		}
	}
</script>
<body>
	<h2 align="center"> ������ �߰� </h2><br><br>
	<form action="/Bears/jsp/admin/AdminStore.jsp" name="storeFrm" >
		<div id="mainDiv">
			<div id="innerDiv">
				<h4>�������̸�</h4> 
				<input type="text" name="storename" class="form-control" placeholder="storename" aria-describedby="basic-addon2">
				<h4>�귣���ȣ</h4> 
				<input type="text" name="brandno" class="form-control" placeholder="brandno" aria-describedby="basic-addon2">
				<h4>��������ġ</h4> 
				<input type="text" name="location" class="form-control" placeholder="location" aria-describedby="basic-addon2">
				<h4>����������</h4> 
				<input type="text" name="gpa" class="form-control" placeholder="gpa" aria-describedby="basic-addon2">
				<h4>�����ð�</h4> 
				<input type="text" name="hours" class="form-control" placeholder="hours" aria-describedby="basic-addon2">
				<h4>��ȭ��ȣ</h4> 
				<input type="text" name="tel" class="form-control" placeholder="tel" aria-describedby="basic-addon2">
				<h4>����ּҰ���</h4> 
				<input type="text" name="minprice" class="form-control" placeholder="minprice" aria-describedby="basic-addon2">
				<h4>����������</h4> 
				<input type="text" name="info" class="form-control" placeholder="info" aria-describedby="basic-addon2">
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
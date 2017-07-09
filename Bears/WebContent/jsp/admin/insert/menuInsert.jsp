<%@page import="food.vo.MenuVo"%>
<%@page import="food.dao.MenuDao"%>
<%@ page language="java" contentType="text/html; charset=EUC-KR"
	pageEncoding="EUC-KR"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=EUC-KR">
<link rel="stylesheet" href="/Bears/css/bootstrap.css" />
<title>�޴� ���� ����</title>
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

	function checkMenuname(obj){
		if(!obj.value){
			alert('menuname �Է�!');
			obj.value='';
		}else if(obj.value.length>25){
			alert('menuname�� 25������!');
			obj.value='';
		}
	}

	function checkBrandno(obj){
		if(!obj.value){
			alert('brandno �Է�!');
			obj.value='';
		}else if(isNaN(obj.value)||obj.value.length>3){
			alert('brandno�� 3�ڸ����ϼ��ڸ�!');
			obj.value='';
		}
	}

	function checkPrice(obj){
		if(!obj.value){
			alert('price �Է�!');
			obj.value='';
		}else if(obj.value.length>7){
			alert('peice�� 7�ڸ�����!');
			obj.value='';
		}
	}

	function checkInfo(obj){
		if(obj.value.length>30){
			alert('info�� 30���ڸ�!');
			obj.value='';
		}
	}
	//�ڷ�
	function backAdminStore(){
		document.location.href='/Bears/jsp/admin/AdminMenu.jsp';
	}
	//�߰�
	function MenuInsert(){
		var obj = document.MenuFrm;
		alert('�޴��߰��� �Ϸ�Ǿ����ϴ�!');
		obj.submit();			
	}
	function getValue(){
			 data=document.getElementById('query').value;
			 alert(data);
	}
</script>
<body>
<%
	MenuVo mv=null;
	request.setCharacterEncoding("EUC-KR");
%>
	<h2 align="center"> �޴� �߰� </h2><br><br>
	<form action="/Bears/jsp/admin/insert/MenuInsertProcess.jsp" name="MenuFrm" method="post" enctype="multipart/form-data">
		<div id="mainDiv">
			<div id="innerDiv">
				<h4>�޴��̸�</h4> 
				<input type="text" name="menuname" onblur="checkMenuname(this)" class="form-control" placeholder="menuname" aria-describedby="basic-addon2" >
				<h4>�귣���ȣ</h4> 
				<input type="text" name="brandno" onblur="checkBrandno(this)" class="form-control" placeholder="brandno" aria-describedby="basic-addon2">
				<h4>����</h4> 
				<input type="text" name="price" onblur="checkPrice(this)" class="form-control" placeholder="price" aria-describedby="basic-addon2">
				<h4>Info</h4> 
				<input type="text" name="info" onblur="checkInfo(this)" class="form-control" placeholder="info" aria-describedby="basic-addon2">
				<h4>Image</h4>
				<input type="file" name="image" class="form-control">
				<%
				%>
			</div>
			<br><br><br>
			<div id="buttonDiv">
				<button type="button" class="btn btn-default" onclick="MenuInsert()">�߰�</button>
				<button type="button" class="btn btn-default" onclick="backAdminMenu()">�ڷ�</button>
			</div>
		</div>
	</form>
</body>
</html>
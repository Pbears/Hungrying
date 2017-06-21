<%@page import="food.dao.MenuDao"%>
<%@page import="food.vo.MenuVo"%>
<%@page import="food.vo.StoreVo"%>
<%@page import="food.dao.StoreDao"%>
<%@ page language="java" contentType="text/html; charset=EUC-KR"
	pageEncoding="EUC-KR"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=EUC-KR">
<link rel="stylesheet" href="/Bears/css/bootstrap.css" />
<title>�޴� �� ����</title>
<style type="text/css">
#mainDiv{
	width: 100%;
	height : 100%;
	margin: 0 auto;
}
#rightDiv, #leftDiv {
	width : 50%;
	margin : 0 auto;
	vertical-align: middle;
}
#leftDiv{
	float:left;
	padding:30px;
	margin: 0 auto;
}
#rightDiv{
	display:inline-block;
	padding:30px;
	margin: 0 auto;
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
	function backAdminMenu(){
		self.close();		
	}
	
	function setPrice() {
		var obj = document.menuInfo.price;
		obj.value = document.menuInfo.price1.value;
	}
	
	function setInfo() {
		var obj = document.menuInfo.info;
		obj.value = document.menuInfo.info1.value;
	}
	
	function updateConfirm() {
		var info = document.menuInfo;
		if(confirm('�����Ͻðڽ��ϱ�?') == true){
			info.submit();	
		}else{
			return 0;
		}
	}
	
</script>
<body>
<%
	request.setCharacterEncoding("EUC-KR");
	String menuname =request.getParameter("menuname");
	MenuVo bean = MenuDao.selectOneMenu(menuname);
%>
	<h2 align="center">�޴� �� ���� </h2><br>
	<div id="mainDiv">
		 <div id="leftDiv">
		 	<h2 align="center"> ������ </h2><br>
		 <form action="/Bears/jsp/admin/update/MenuUpdate.jsp" method="post" name="menuInfo">
			<h4>�޴� �̸�</h4> 
				<input type="text" value="<%=bean.getMenuname() %>" name="menuname1" class="form-control" placeholder="menuname" aria-describedby="basic-addon2" disabled="disabled">
				<input type="hidden" value="<%=bean.getMenuname() %>" name="menuname" class="form-control">
			<h4>�귣���ȣ</h4> 
				<input type="text" value="<%=bean.getBrandno() %>" name="brandno1" class="form-control" placeholder="brandno" aria-describedby="basic-addon2" disabled="disabled">
				<input type="hidden" value="<%=bean.getBrandno() %>" name="brandno" class="form-control">
			<h4>�� ��</h4> 
				<input type="text" value="<%=bean.getPrice() %>" name="price1" class="form-control" placeholder="price" aria-describedby="basic-addon2" onchange="setPrice()">
				<input type="hidden" value="<%=bean.getPrice() %>" name="price" class="form-control">
			<h4>Info</h4> 
				<input type="text" value="<%=bean.getInfo() %>" name="info1" class="form-control" placeholder="Info" aria-describedby="basic-addon2" onchange="setInfo()">
				<input type="hidden" value="<%=bean.getInfo() %>" name="info" class="form-control">
			<br><br>
			<div id="buttonDiv">
				<button type="button" class="btn btn-default" onclick="updateConfirm()">����</button>
				<button type="button" class="btn btn-default" onclick="backAdminMenu()">���</button>
			</div>
			</form>
		</div> 
		<div id="rightDiv">
			<img src="/Bears/upload/<%=bean.getPicture()%>" width="300" height="300" style="vertical-align: middle;">
		</div>
		<br>
	</div>
	
	
</body>
</html>
<%@page import="food.vo.StoreVo"%>
<%@page import="food.dao.StoreDao"%>
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
	function backAdminStore(){
		self.close();		
	}
	
	function setHours() {
		var obj = document.storeInfo.hours;
		obj.value = document.storeInfo.hours1.value;
	}
	
	function setTel() {
		var obj = document.storeInfo.tel;
		obj.value = document.storeInfo.tel1.value;
	}
	
	function setMinPrice() {
		var obj = document.storeInfo.minprice;
		obj.value = document.storeInfo.minprice1.value;
	}
	
	function setInfo() {
		var obj = document.storeInfo.info;
		obj.value = document.storeInfo.info1.value;
	}
	
	function updateConfirm() {
		var info = document.storeInfo;
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
	String storename = java.net.URLDecoder.decode(request.getParameter("storename"), "UTF-8");
	StoreVo bean = StoreDao.selectOneStore(storename);
%>
	<div id="mainDiv">
		<div id="leftDiv">
			<img src="/Bears/img/wait.gif" style="vertical-align: middle;">
		</div>
		 <div id="rightDiv">
		 	<h2 align="center"> ������ </h2><br>
		 <!-- Store�� ���� ���� -->
		 <form action="StoreUpdate.jsp" method="post" name="storeInfo">
			<h4>�������̸�</h4> 
				<input type="text" value="<%=bean.getStorename() %>"class="form-control" placeholder="storename" aria-describedby="basic-addon2" disabled="disabled">
				<input type="hidden" value="<%=bean.getStorename() %>" name="storename" class="form-control">
			<h4>�귣���ȣ</h4> 
				<input type="text" value="<%=bean.getBrandno() %>" class="form-control" placeholder="brandno" aria-describedby="basic-addon2" disabled="disabled">
				<input type="hidden" value="<%=bean.getBrandno() %>" name="brandno" class="form-control">
			<h4>��������ġ</h4> 
				<input type="text" value="<%=bean.getLocation() %>" class="form-control" placeholder="location" aria-describedby="basic-addon2" disabled="disabled">
				<input type="hidden" value="<%=bean.getLocation() %>" name="location" class="form-control">
			<h4>����������</h4> 
				<input type="text" value="<%=bean.getGpa() %>" class="form-control" placeholder="gpa" aria-describedby="basic-addon2" disabled="disabled">
				<input type="hidden" value="<%=bean.getGpa() %>" name="gpa" class="form-control">
			<h4>�����ð�</h4> 
				<input type="text" value="<%=bean.getHours() %>" name="hours1" class="form-control" placeholder="hours" aria-describedby="basic-addon2" onchange="setHours()">
				<input type="hidden" value="<%=bean.getHours() %>" name="hours" class="form-control">
			<h4>��ȭ��ȣ</h4> 
				<input type="text" value="<%=bean.getTel() %>"  name="tel1" class="form-control" placeholder="tel" aria-describedby="basic-addon2" onchange="setTel()">
				<input type="hidden" value="<%=bean.getTel() %>" name="tel" class="form-control">
			<h4>����ּҰ���</h4> 
				<input type="text" value="<%=bean.getMinprice() %>" name=minprice1 class="form-control" placeholder="minprice" aria-describedby="basic-addon2" onchange="setMinPrice()">
				<input type="hidden" value="<%=bean.getMinprice() %>" name="minprice" class="form-control">
			<h4>����������</h4> 
				<input type="text" value="<%=bean.getInfo() %>" name="info1" class="form-control" placeholder="info" aria-describedby="basic-addon2" onchange="setInfo()">
				<input type="hidden" value="<%=bean.getInfo() %>" name="info" class="form-control">
			<div id="buttonDiv">
				<button type="button" class="btn btn-default" onclick="updateConfirm()">�����Ϸ�</button>
				<button type="button" class="btn btn-default" onclick="backAdminStore()">���</button>
			</div>
			</form>
		</div> 
		<br>
	</div>
	
	
</body>
</html>
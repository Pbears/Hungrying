<%@page import="food.vo.OrderVo"%>
<%@page import="food.dao.OrderDao"%>
<%@page import="food.vo.StoreVo"%>
<%@page import="food.dao.StoreDao"%>
<%@ page language="java" contentType="text/html; charset=EUC-KR" pageEncoding="EUC-KR"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=EUC-KR">
<link rel="stylesheet" href="/Bears/css/bootstrap.css" />
<title>�ֹ� �� ����</title>
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
	function backAdminOrder(){
		self.close();		
	}
	
</script>
<body>
<%
	request.setCharacterEncoding("EUC-KR");
	String ordernumber = request.getParameter("ordernumber");
	OrderVo vo = OrderDao.selectOrder(ordernumber);
%>
	<h2 align="center">�ֹ� �� ���� </h2><br>
	<div id="mainDiv">
		 <div id="leftDiv">
		 <!-- Order�� ���� ���� -->
		 <form action="/Bears/jsp/admin/update/StoreUpdate.jsp" method="post" name="storeInfo">
			<h4>�ֹ���ȣ</h4> 
				<input type="text" value="<%=vo.getOrdernumber() %>"class="form-control" placeholder="storename" aria-describedby="basic-addon2" disabled="disabled">
			<h4>�ֹ���ID</h4> 
				<input type="text" value="<%=vo.getMemberid()%>" class="form-control" placeholder="brandno" aria-describedby="basic-addon2" disabled="disabled">
			<h4>�ֹ����̸�</h4> 
				<input type="text" value="<%=vo.getMembername() %>" class="form-control" placeholder="location" aria-describedby="basic-addon2" disabled="disabled">
			<h4>�ֹ��ڹ�ȭ��ȣ</h4> 
				<input type="text" value="<%=vo.getMembertel()%>" class="form-control" placeholder="gpa" aria-describedby="basic-addon2" disabled="disabled">
			<h4>�ֹ����ּ�</h4> 
				<input type="text" value="<%=vo.getMemberaddress()%>" name="hours1" class="form-control" placeholder="hours" aria-describedby="basic-addon2" disabled="disabled">
			<h4>����</h4> 
				<input type="text" value="<%=vo.getPrice()%>"  name="tel1" class="form-control" placeholder="tel" aria-describedby="basic-addon2" disabled="disabled">
			<h4>�ֹ���û����</h4> 
				<input type="text" value="<%=vo.getOrderinfo() %>" name=minprice1 class="form-control" placeholder="minprice" aria-describedby="basic-addon2" disabled="disabled">
			</form>
		</div> 
		<div id="rightDiv">
			<h4>�޴��̸�</h4> 
				<input type="text" value="<%=vo.getMenuname()%>" name="info1" class="form-control" placeholder="info" aria-describedby="basic-addon2" disabled="disabled">
			<h4>����</h4> 
				<input type="text" value="<%=vo.getAmount() %>" name="info1" class="form-control" placeholder="info" aria-describedby="basic-addon2" disabled="disabled">
			<h4>�������̸�</h4> 
				<input type="text" value="<%=vo.getStorename()%>" name="info1" class="form-control" placeholder="info" aria-describedby="basic-addon2" disabled="disabled">
			<h4>�������ּ�</h4> 
				<input type="text" value="<%=vo.getStoreaddress()%>" name="info1" class="form-control" placeholder="info" aria-describedby="basic-addon2" disabled="disabled">
			<h4>��������ȭ��ȣ</h4> 
				<input type="text" value="<%=vo.getStoretel()%>" name="info1" class="form-control" placeholder="info" aria-describedby="basic-addon2" disabled="disabled">
			<h4>�ֹ��ð�</h4> 
				<input type="text" value="<%=vo.getOrdertime()%>" name="info1" class="form-control" placeholder="info" aria-describedby="basic-addon2" disabled="disabled">
			<h4>�ֹ�����</h4> 
				<input type="text" value="<%=vo.getState()%>" name="info1" class="form-control" placeholder="info" aria-describedby="basic-addon2" disabled="disabled">
		</div>
		<div id="buttonDiv">
				<button type="button" class="btn btn-default" onclick="backAdminOrder()">���</button>
			</div>
		<br>
	</div>
	
	
</body>
</html>
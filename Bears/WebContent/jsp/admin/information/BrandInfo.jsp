<%@page import="food.dao.BrandDao"%>
<%@page import="food.vo.BrandVo"%>
<%@page import="food.vo.StoreVo"%>
<%@page import="food.dao.StoreDao"%>
<%@ page language="java" contentType="text/html; charset=EUC-KR" pageEncoding="EUC-KR"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=EUC-KR">
<link rel="stylesheet" href="/Bears/css/bootstrap.css" />
<title>������ �� ����</title>
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
	
	function setBrandname() {
		var obj = document.brandInfo.brandname;
		obj.value = document.brandInfo.brandname1.value;
	}
	
		
	function updateConfirm() {
		var info = document.brandInfo;
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
	String brandname = request.getParameter("brandname");
	BrandVo bean = BrandDao.selectOneBrand(brandname);
%>
	<h2 align="center">�귣�� �� ���� </h2><br>
	<div id="mainDiv">
		 <div id="leftDiv">
		 	<h2 align="center"> ������ </h2><br>
		 <!-- Store�� ���� ���� -->
		 <form action="/Bears/jsp/admin/update/BrandUpdate.jsp" method="post" name="brandInfo">
			<h4>�귣���ȣ</h4> 
				<input type="text" value="<%=bean.getBrandno() %>" class="form-control" placeholder="brandno" aria-describedby="basic-addon2" disabled="disabled">
				<input type="hidden" value="<%=bean.getBrandno() %>" name="brandno" class="form-control">
			<h4>�귣���̸�</h4> 
				<input type="text" value="<%=bean.getBrandname()%>"name="brandname1" class="form-control" placeholder="brandname" aria-describedby="basic-addon2">
				<input type="hidden" value="<%=bean.getBrandname()%>" name="brandname" class="form-control" onchange="setBrandname()">
			<br><br>
			<div id="buttonDiv">
				<button type="button" class="btn btn-default" onclick="updateConfirm()">����</button>
				<button type="button" class="btn btn-default" onclick="backAdminStore()">���</button>
			</div>
			</form>
		</div> 
		<div id="rightDiv">
			<img src="/Bears/img/wait.gif" style="vertical-align: middle;">
		</div>
		<br>
	</div>
	
	
</body>
</html>
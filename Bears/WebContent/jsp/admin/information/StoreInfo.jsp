<%@page import="food.vo.StoreVo"%>
<%@page import="food.dao.StoreDao"%>
<%@ page language="java" contentType="text/html; charset=EUC-KR"
	pageEncoding="EUC-KR"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=EUC-KR">
<link rel="stylesheet" href="/Bears/css/bootstrap.css" />
<title>음식점 세부 정보</title>
<style type="text/css">
#mainDiv{
	width: 80%;
	height : 80%;
	margin: 0 auto;
}
#innerDiv {
	width : 40%;
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
	function backAdminStore(){
		self.close();		
	}
</script>
<body>
<%
	request.setCharacterEncoding("EUC-KR");
	String storename = java.net.URLDecoder.decode(request.getParameter("storename"), "UTF-8");
	StoreVo bean = StoreDao.selectOneStore(storename);
%>
	<h2 align="center"> 상세정보 </h2><br>
	
	<div id="mainDiv">
		 <div id="innerDiv">
			<h4>음식점이름</h4> 
			<input type="text" value="<%=bean.getStorename() %>" class="form-control" placeholder="storename" aria-describedby="basic-addon2">
			<h4>브랜드번호</h4> 
			<input type="text" value="<%=bean.getBrandno() %>" class="form-control" placeholder="brandno" aria-describedby="basic-addon2">
			<h4>음식점위치</h4> 
			<input type="text" value="<%=bean.getLocation() %>" class="form-control" placeholder="location" aria-describedby="basic-addon2">
			<h4>음식점평점</h4> 
			<input type="text" value="<%=bean.getGpa() %>" class="form-control" placeholder="gpa" aria-describedby="basic-addon2">
			<h4>영업시간</h4> 
			<input type="text" value="<%=bean.getHours() %>" class="form-control" placeholder="hours" aria-describedby="basic-addon2">
			<h4>전화번호</h4> 
			<input type="text" value="<%=bean.getTel() %>" class="form-control" placeholder="tel" aria-describedby="basic-addon2">
			<h4>배달최소가격</h4> 
			<input type="text" value="<%=bean.getMinprice() %>" class="form-control" placeholder="minprice" aria-describedby="basic-addon2">
			<h4>음식점정보</h4> 
			<input type="text" value="<%=bean.getInfo() %>" class="form-control" placeholder="info" aria-describedby="basic-addon2">
		</div> 
		<br>
		<div id="buttonDiv">
		<!-- 
		
						여기에 수정을 완성하라 백곰!
						 
		-->
			<button type="button" class="btn btn-default">수정완료</button>
			<button type="button" class="btn btn-default" onclick="backAdminStore()">취소</button>
		</div>
	</div>
	
	
</body>
</html>
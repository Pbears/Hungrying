<%@page import="food.dao.MemberDao"%>
<%@page import="food.vo.MemberVo"%>
<%@page import="food.vo.StoreVo"%>
<%@page import="food.dao.StoreDao"%>
<%@ page language="java" contentType="text/html; charset=EUC-KR"
	pageEncoding="EUC-KR"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=EUC-KR">
<link rel="stylesheet" href="/Bears/css/bootstrap.css" />
<title>회원 상세 정보</title>
<style type="text/css">
#mainDiv{
	width: 80%;
	height : 80%;
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
		if(confirm('수정하시겠습니까?') == true){
			info.submit();	
		}else{
			return 0;
		}
	}
</script>
<body>
<%
	request.setCharacterEncoding("EUC-KR");
	String membername = java.net.URLDecoder.decode(request.getParameter("membername"), "UTF-8");
	MemberVo bean = (MemberVo)MemberDao.selectOneMember(membername);
%>
	<h2 align="center"> 회원상세정보 </h2><br>
	
	 <div id="mainDiv">
		 <div id="leftDiv">
		 <form action="StoreUpdate.jsp" method="post" name="storeInfo">
			<h4>아이디</h4> 
				<input type="text" value="<%=bean.getId() %>"class="form-control" placeholder="storename" aria-describedby="basic-addon2" disabled="disabled">
				<input type="hidden" value="<%=bean.getId() %>" name="storename" class="form-control">
			<h4>이름</h4> 
				<input type="text" value="<%=bean.getName() %>" class="form-control" placeholder="brandno" aria-describedby="basic-addon2" disabled="disabled">
				<input type="hidden" value="<%=bean.getName() %>" name="brandno" class="form-control">
			<h4>성별</h4> 
				<input type="text" value="<%=bean.getGender() %>" class="form-control" placeholder="location" aria-describedby="basic-addon2" disabled="disabled">
				<input type="hidden" value="<%=bean.getGender() %>" name="location" class="form-control">
			<h4>생년월일</h4> 
				<input type="text" value="<%=bean.getBirth() %>" class="form-control" placeholder="gpa" aria-describedby="basic-addon2" disabled="disabled">
				<input type="hidden" value="<%=bean.getBirth() %>" name="gpa" class="form-control">
			<h4>주소</h4> 
				<input type="text" value="<%=bean.getAddress() %>" name="hours1" class="form-control" placeholder="hours" aria-describedby="basic-addon2" onchange="setHours()">
				<input type="hidden" value="<%=bean.getAddress() %>" name="hours" class="form-control">
			<h4>핸드폰번호</h4> 
				<input type="text" value="<%=bean.getTel() %>"  name="tel1" class="form-control" placeholder="tel" aria-describedby="basic-addon2" onchange="setTel()">
				<input type="hidden" value="<%=bean.getTel() %>" name="tel" class="form-control">
			</form>
		</div> 
		<br>
		<div id="rightDiv">
			<img src="/Bears/img/wait.gif" style="vertical-align: middle;">
		</div>
	</div> 
	<div id="buttonDiv">
		<button type="button" class="btn btn-default" onclick="updateConfirm()">수정</button>
		<button type="button" class="btn btn-default" onclick="backAdminMenu()">취소</button>
	</div>
	
	
</body>
</html>
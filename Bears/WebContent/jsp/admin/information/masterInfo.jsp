<%@page import="food.vo.MasterVo"%>
<%@page import="food.dao.MasterDao"%>
<%@page import="food.vo.OrderVo"%>
<%@page import="java.util.List"%>
<%@page import="food.dao.OrderDao"%>
<%@page import="food.dao.MemberDao"%>
<%@page import="food.vo.MemberVo"%>
<%@page import="food.vo.StoreVo"%>
<%@page import="food.dao.StoreDao"%>
<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%
	request.setCharacterEncoding("EUC-KR");
%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=EUC-KR">
<link rel="stylesheet" href="/Bears/css/bootstrap.css" />
<title>회원 정보</title>
<style type="text/css">
 #mainDiv {
	width: 90%;
	height: 80%;
	margin: 0 auto; 
	text-align:center; 
}

#rightDiv, #leftDiv {
	width: 48%;
	height: 500px;
	margin: 0 auto;
	vertical-align: middle; 
	display:inline-block; 
}

#leftDiv {
	float: left; 
	padding: 30 px;
}

#rightDiv {
	float: right; 
	display: inline-block; 
}

#buttonDiv {
	position:absolute;
    bottom:0;
    width:100%;
    height:150px;  
    text-align: center;
}
</style>
</head>
<script type="text/javascript">
	function backMaster() {
		self.close();
	}

	function setId() {
		var obj = document.masterInfo.id;
		obj.value = document.masterInfo.id1.value;
	}
	
	function setName() {
		var obj = document.masterInfo.name;
		obj.value = document.masterInfo.name1.value;
	}

	function setBirth() {
		var obj = document.masterInfo.birth;
		obj.value = document.masterInfo.birth1.value;
	}
	
	function setStoreName() {
		var obj = document.masterInfo.storename;
		obj.value = document.masterInfo.storename1.value;
	}

	function setAddress() {
		var obj = document.masterInfo.address;
		obj.value = document.masterInfo.address1.value;
	}
	
	function setTel() {
		var obj = document.masterInfo.tel;
		obj.value = document.masterInfo.tel1.value;
	}

	function updateConfirm() {
		var info = document.masterInfo;
		if (confirm('수정하시겠습니까?') == true) {
			info.submit();
		} else {
			return 0;
		}
	}
</script>
<body>
	<%
		String storename = request.getParameter("storename");
		MasterVo bean = (MasterVo) MasterDao.selectOneMaster(storename);
		List<OrderVo> list = OrderDao.selectMemberOrder(storename);
	%>
	<h1 align="center">사장님 정보</h1>
	<br>
	<div id="mainDiv">
			<div id="leftDiv" >
				<h3 align="center">사장님 상세정보</h3><br>
					<form action="/Bears/jsp/admin/update/MasterUpdate.jsp" method="get" name="masterInfo">
					
						<h4>아이디</h4>
						<input type="text" value="<%=bean.getId()%>" class="form-control"
							placeholder="id" aria-describedby="basic-addon2" disabled="disabled"> 
							<input type="hidden" value="<%=bean.getId()%>" name="id" class="form-control">
							
						<h4>이름</h4>
							<input type="text" value="<%=bean.getName()%>"
								class="form-control" placeholder="name"
								aria-describedby="basic-addon2" name="name1" onchange="setName()"> 
							<input type="hidden" value="<%=bean.getName()%>" name="name" class="form-control">
							
						<h4>생년월일</h4>
							<input type="text" value="<%=bean.getBirth()%>"
								class="form-control" placeholder="birth"
								aria-describedby="basic-addon2" name="birth1" onchange="setBirth()"> 
							<input type="hidden" value="<%=bean.getBirth()%>" name="birth" class="form-control">
							
						<h4>음식점 이름</h4>
						<input type="text" value="<%=bean.getStorename()%>"
							class="form-control" placeholder="storename"
							aria-describedby="basic-addon2" name="storename1" onchange="setStoreName()"> 
							<input type="hidden" value="<%=bean.getStorename()%>" name="storename" class="form-control">
							
						<h4>주소</h4>
							<input type="text" value="<%=bean.getAddress()%>"
								class="form-control" placeholder="address"
								aria-describedby="basic-addon2" name="address1" onchange="setAddress()"> 
							<input type="hidden" value="<%=bean.getAddress()%>" name="address" class="form-control">
							
						<h4>전화번호</h4>
							<input type="text" value="<%=bean.getTel()%>"
								class="form-control" placeholder="tel"
								aria-describedby="basic-addon2"  name="tel1" onchange="setTel()"> 
							<input type="hidden" value="<%=bean.getTel()%>" name="tel" class="form-control">
					</form>
			</div>
			<div id="rightDiv">
				<h3 align="center">매장 정보</h3><br>
					<table class="table">
						<th>주문일자</th>
						<th>주문번호</th>
						<th>음식점명</th>
						<th>주문금액</th>
						<th>진행상태</th>
				<%	
						for(OrderVo vo : list){
				%>
 						<tr>
 							<td><%=vo.getOrdertime()%></td>
 							<td><%=vo.getOrdernumber()%></td>
 							<td><%=vo.getStorename()%></td>
 							<td><%=vo.getPrice()%></td>
 							<td><%=vo.getState()%></td>
 						</tr> 
 				<%
				}
				%>
					</table>
			</div>
	<br><br><br><br><br><br><br><br>
</div>

	<div id="buttonDiv" >
		<button type="button" class="btn btn-default" onclick="updateConfirm()">수정</button>
		<button type="button" class="btn btn-default" onclick="backMaster()">확인</button>
	</div>
</body>
</html>

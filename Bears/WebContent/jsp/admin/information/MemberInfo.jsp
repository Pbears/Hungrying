<%@page import="food.vo.OrderVo"%>
<%@page import="java.util.List"%>
<%@page import="food.dao.OrderDao"%>
<%@page import="food.dao.MemberDao"%>
<%@page import="food.vo.MemberVo"%>
<%@page import="food.vo.StoreVo"%>
<%@page import="food.dao.StoreDao"%>
<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
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
	function backAdminMenu() {
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
		if (confirm('수정하시겠습니까?') == true) {
			info.submit();
		} else {
			return 0;
		}
	}
</script>
<body>
	<%
		request.setCharacterEncoding("EUC-KR");
		String memberid = request.getParameter("memberid");
		MemberVo bean = (MemberVo) MemberDao.selectOneMember(memberid);
		List<OrderVo> list = OrderDao.selectMemberOrder(memberid);
	%>
	<h1 align="center">회원정보</h1>
	<br>
	<div id="mainDiv">
			<div id="leftDiv" >
				<h3 align="center">회원상세정보</h3><br>
					<form action="StoreUpdate.jsp" method="post" name="storeInfo">
						<h4>아이디</h4>
						<input type="text" value="<%=bean.getId()%>" class="form-control"
							placeholder="storename" aria-describedby="basic-addon2"
							disabled="disabled"> <input type="hidden"
							value="<%=bean.getId()%>" name="storename" class="form-control">
						<h4>이름</h4>
						<input type="text" value="<%=bean.getName()%>"
							class="form-control" placeholder="brandno"
							aria-describedby="basic-addon2" disabled="disabled"> <input
							type="hidden" value="<%=bean.getName()%>" name="brandno"
							class="form-control">
						<h4>성별</h4>
						<input type="text" value="<%=bean.getGender()%>"
							class="form-control" placeholder="location"
							aria-describedby="basic-addon2" disabled="disabled"> <input
							type="hidden" value="<%=bean.getGender()%>" name="location"
							class="form-control">
						<h4>생년월일</h4>
						<input type="text" value="<%=bean.getBirth()%>"
							class="form-control" placeholder="gpa"
							aria-describedby="basic-addon2" disabled="disabled"> <input
							type="hidden" value="<%=bean.getBirth()%>" name="gpa"
							class="form-control">
						<h4>주소</h4>
						<input type="text" value="<%=bean.getAddress()%>" name="hours1"
							class="form-control" placeholder="hours"
							aria-describedby="basic-addon2" onchange="setHours()"> <input
							type="hidden" value="<%=bean.getAddress()%>" name="hours"
							class="form-control">
						<h4>핸드폰번호</h4>
						<input type="text" value="<%=bean.getTel()%>" name="tel1"
							class="form-control" placeholder="tel"
							aria-describedby="basic-addon2" onchange="setTel()"> <input
							type="hidden" value="<%=bean.getTel()%>" name="tel"
							class="form-control">
					</form>
			</div>
			<div id="rightDiv">
				<h3 align="center">회원주문정보</h3><br>
					<table class="table">
						<th style="text-align: center;">주문일자</th>
						<th style="text-align: center;">주문번호</th>
						<th style="text-align: center;">음식점명</th>
						<th style="text-align: center;">주문금액</th>
						<th style="text-align: center;">진행상태</th>
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
		<!-- <button type="button" class="btn btn-default" onclick="updateConfirm()">수정</button> -->
		<button type="button" class="btn btn-default" onclick="backAdminMenu()">확인</button>
	</div>
</body>
</html>

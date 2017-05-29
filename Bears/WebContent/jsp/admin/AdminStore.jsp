<%@page import="java.util.HashMap"%>
<%@page import="food.dao.StoreDao"%>
<%@page import="food.vo.StoreVo"%>
<%@page import="java.util.List"%>
<%@ page language="java" contentType="text/html; charset=EUC-KR"
	pageEncoding="EUC-KR"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=EUC-KR">
<link rel="stylesheet" href="/Bears/jsp/css/bootstrap.css" />
<title>관리자-음식점</title>
<style>
tr:NTH-CHILD(even) {
	background-color: #f2f2f2;
}
</style>
<script>
	Date.prototype.getKorDay = function() {
		var result = null;
		switch (this.getDay()) {
		case 0:
			result = "sun";
			break;
		case 1:
			result = "mon";
			break;
		case 2:
			result = "tue";
			break;
		case 3:
			result = "wed";
			break;
		case 4:
			result = "thr";
			break;
		case 5:
			result = "fri";
			break;
		default:
			result = "sat";
		}
		return result;
	}
	function sendOut() {
		document.location.href = 'AdminLogout.jsp';
	}

	function datePro() {
		var clock = "";
		var time = "";
		var date = new Date();
		clock = date.getFullYear() + "/" + (parseInt(date.getMonth()) + 1)
				+ '/' + date.getDate() + '/' + date.getKorDay();
		time = date.getHours() + ':' + date.getMinutes() + ':'
				+ date.getSeconds();
		document.getElementById("clock").innerHTML = "<font color=white> "
				+ clock + "</font>";
		document.getElementById("time").innerHTML = "<font color=white> "
				+ time + "</font>";
		var intervalID = function() {
			setInterval('datePro()', 1000);
		}
		intervalID();
	}

	function sendCheck() {
		var obj = document.ast; //form까지의 주소
		if (obj.query.name == 'empty' || !obj.data.value) {
			alert('Not Search!');
			obj.query.selectedIndex = 0;

			obj.data.value = '';
			obj.data.focus();
		} else {
			obj.submit();
		}
	}
	function selectStore(obj) {

	}
</script>
</head>
<body onload="datePro()">
	<%
		request.setCharacterEncoding("EUC-KR");
		List<StoreVo> list = null;

		HashMap<String, Object> map = new HashMap<String, Object>();

		String query = request.getParameter("query");
		String data = request.getParameter("data");

		if (query != null && data != null) {
			map.put("query", query);
			map.put("data", data);
			list = StoreDao.searchStore(map);
		} else {
			list = StoreDao.searchStore(null);
		}
	%>
	<!-- Top 메뉴 -->
	<nav class="navbar navbar-fixed-top navbar-inverse">
	<div class="container" align="right"
		style="padding-right: 10px; margin-right: 10px;">
		<span id="clock"></span> <span id="time"></span>
		<p class="navbar-text"
			style="position: absolute; right: 0px; top: 0px; margin-bottom: 5px; margin-top: 20px;">관리자님
			환영합니다.</p>
	</div>
	</nav>

	<!-- 네이게이션바 -->
	<div id="top-menu">
		<ul class="nav nav-pills">
			<li role="presentation" id="home"><a
				href="/Bears/jsp/admin/AdminMain.jsp"">홈 </a></li>
			<li role="presentation" id="brand"><a href="#">브랜드</a></li>
			<li role="presentation" id="store"><a
				href="/Bears/jsp/admin/AdminStore.jsp">음식점</a></li>
			<li role="presentation" id="menu"><a href="#">메뉴</a></li>
			<li role="presentation" id="order"><a href="#">주문</a></li>
			<li role="presentation" id="member"><a href="#">회원</a></li>
			<li role="presentation" id="master"><a href="#">사장</a></li>
		</ul>
	</div>

	<!-- 검색바 -->
	<div id="searcher" class="row">
		<div class="input-group">

			<form action="AdminStore.jsp" name="ast" method="post">
				<table class="bbsWrite mgb35" align="center">
					<colgroup>
						<col width="30" />
						<col width="400" />
						<col width="50" />
					</colgroup>
					<tbody>
						<tr>
							<td height="50">
								<select name="query" size="1" style="height: 34px;">
									<option value="empty" selected="selected">선택하세요</option>
									<option value="storename">음식점명</option>
									<option value="brandno">브랜드번호</option>
									<option value="location">위치</option>
								</select>
							</td>
							<td>
								<input type="text" class="form-control"	placeholder="Search for..." name="data">
							</td>
							<td>
								<span class="input-group-btn">
									<button class="btn btn-default" type="button">
										<a href="javascript:sendCheck()"> Search</a>
									</button>
								</span>
							</td>
							<div style=" postion:relative; left: 100px;">
								<td>
									<button type="button" class="btn btn-default">추가</button>
								</td>
								<td>
									<button type="button" class="btn btn-default">삭제</button>
								</td>
							</div>
						</tr>
					</tbody>
				</table>
			</form>
		</div>
		<!-- /input-group -->
	</div>

	<!-- /.row -->



	<div id="data_table">
		<table class="bbsList" style="border-collapse: collapse;"
			border="1px solid black">
			<colgroup>
				<col width="50" />
				<col width="200" />
				<col width="150" />
				<col width="60" />
				<col width="350" />
				<col width="150" />
				<col width="250" />
				<col width="180" />
				<col width="350" />
			</colgroup>
			<tr>
				<th scope="col" style="text-align: center;"></th>
				<th scope="col" style="text-align: center;">음식점명</th>
				<th scope="col" style="text-align: center;">브랜드번호</th>
				<th scope="col" style="text-align: center; padding-left: 5px;">평점</th>
				<th scope="col" style="text-align: center;">위치</th>
				<th scope="col" style="text-align: center;">영업시간</th>
				<th scope="col" style="text-align: center;">전화번호</th>
				<th scope="col" style="text-align: center;">배달최저가격</th>
				<th scope="col" style="text-align: center;">소개</th>
			</tr>
			<tbody>
				<%
					for (int i = 0; i < list.size(); i++) {
						StoreVo vo = list.get(i);
				%>
				<tr>
					<div id="select">
						<td><input type="checkbox" aria-label="..."
							onclick="selectStore(this)"></td>
						<td style="padding-bottom: 10px;"><%=vo.getStorename()%></td>
						<td><%=vo.getBrandno()%></td>
						<td><%=vo.getGpa()%></td>
						<td style="padding-left: 5px; padding-right: 5px;"><%=vo.getLocation()%></td>
						<td><%=vo.getHours()%></td>
						<td><%=vo.getTel()%></td>
						<td><%=vo.getMinprice()%></td>
						<td style="padding-top: 10px; padding-bottom: 10px;"><%=vo.getInfo()%></td>
					</div>
				</tr>
				<%
					}
				%>
			</tbody>
		</table>
	</div>

	<!-- 세부페이징 -->
	<nav>
	<ul class="pager">
		<li><a href="#">Previous</a></li>
		<li><a href="#">Next</a></li>
	</ul>
	</nav>

	<!-- 페이징 -->
	<div style="text-align: center;">
		<nav>
		<ul class="pagination">
			<li><a href="#" aria-label="Previous"> <span
					aria-hidden="true">&laquo;</span>
			</a></li>
			<li><a href="#">1</a></li>
			<li><a href="#">2</a></li>
			<li><a href="#">3</a></li>
			<li><a href="#">4</a></li>
			<li><a href="#">5</a></li>
			<li><a href="#" aria-label="Next"> <span aria-hidden="true">&raquo;</span>
			</a></li>
		</ul>
		</nav>
	</div>
</body>
</html>
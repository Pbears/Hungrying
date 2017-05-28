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
<title>������-������</title>
<style>

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
		var obj = document.frm; //form������ �ּ�
		if (obj.query.name == 'empty' || !obj.data.value) {
			alert('Not Search!');
			obj.query.selectedIndex = 0;
			obj.data.value = '';
			obj.data.focus();
		} else {
			obj.submit();
		}
	}
</script>
</head>
<body onload="datePro()">
	<%
		List<StoreVo> list = StoreDao.selectStore();
	%>
	<!-- Top �޴� -->
	<nav class="navbar navbar-fixed-top navbar-inverse">
	<div class="container">
		<span id="clock"></span> <span id="time"></span>
		<p class="navbar-text">�����ڴ� ȯ���մϴ�.</p>
	</div>
	</nav>

	<!-- ���̰��̼ǹ� -->
	<div id="top-menu">
		<ul class="nav nav-pills">
			<li role="presentation" id="home"><a href="/Bears/jsp/admin/AdminMain.jsp"">Ȩ </a></li>
			<li role="presentation" id="brand"><a href="#">�귣��</a></li>
			<li role="presentation" id="store"><a href="/Bears/jsp/admin/AdminStore.jsp">������</a></li>
			<li role="presentation" id="menu"><a href="#">�޴�</a></li>
			<li role="presentation" id="order"><a href="#">�ֹ�</a></li>
			<li role="presentation" id="member"><a href="#">ȸ��</a></li>
			<li role="presentation" id="master"><a href="#">����</a></li>
		</ul>
	</div>

	<!-- �˻��� -->
	<div id="searcher" class="row">
		<div class="input-group">
			<input type="text" class="form-control" placeholder="Search for..."><span
				class="input-group-btn">
				<button class="btn btn-default" type="button">Search</button>
			</span>
		</div>
		<!-- /input-group -->
	</div>
	<!-- /.row -->


	<div id="data_table">
		<table class="bbsList">
			<colgroup>
				<col width="150" />
				<col width="150" />
				<col width="100" />
				<col width="150" />
				<col width="150" />
				<col width="150" />
				<col width="150" />
				<col width="200" />
			</colgroup>
			<tr>
				<th scope="col">��������</th>
				<th scope="col">�귣���ȣ</th>
				<th scope="col">����</th>
				<th scope="col">��ġ</th>
				<th scope="col">�����ð�</th>
				<th scope="col">��ȭ��ȣ</th>
				<th scope="col">�����������</th>
				<th scope="col">�Ұ�</th>
			</tr>
			<tbody>
				<%
					for (int i = 0; i < list.size(); i++) {
						StoreVo vo = list.get(i);
				%>
				<tr>
					<td><%=vo.getStorename()%></td>
					<td><%=vo.getBrandno()%></td>
					<td><%=vo.getGpa()%></td>
					<td><%=vo.getLocation()%></td>
					<td><%=vo.getHours()%></td>
					<td><%=vo.getTel()%></td>
					<td><%=vo.getMinprice()%></td>
					<td><%=vo.getInfo()%></td>
				</tr>
				<%
					}
				%>
			</tbody>
		</table>
	</div>

	<!-- ��������¡ -->
	<nav>
	<ul class="pager">
		<li><a href="#">Previous</a></li>
		<li><a href="#">Next</a></li>
	</ul>
	</nav>

	<!-- ����¡ -->
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
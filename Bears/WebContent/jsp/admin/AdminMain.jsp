<%@page import="food.vo.AdminVo"%>
<%@page import="java.util.HashMap"%>
<%@page import="java.util.List"%>
<%@ page language="java" contentType="text/html; charset=EUC-KR"
	pageEncoding="EUC-KR"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">
<html xmlns="http://www.w3.org/1999/xhtml">
<head>
<title>관리자-메인</title>
<meta http-equiv="Content-Type" content="text/html; charset=utf-8" />
<meta http-equiv="X-UA-Compatible" content="IE=7" />
<meta http-equiv="imagetoolbar" content="no" />
<link href="/Bears/css/contents.css" rel="stylesheet" type="text/css" />
<link rel="stylesheet" href="/Bears/jsp/css/bootstrap.css" />

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
		var obj = document.frm; //form까지의 주소
		if (obj.query.name == 'empty' || !obj.data.value) {
			alert('Not Search!');
			obj.query.selectedIndex = 0;
			obj.data.value = '';
			obj.data.focus();
		} else {
			obj.submit();
		}
	}
	function menuClick(obj) {
		alert(obj.id);
		if (obj.id == 'store') {
			$(document).ready(function() {
				$("#board").load("/Bears/jsp/admin/AdminStore.jsp");
			});
		}
		if (obj.id == 'menu') {
			$(document).ready(function() {
				$("#board").load("/Bears/jsp/admin/AdminMenu.jsp");
			});
		}
	}
</script>
</head>
<body onload="datePro()">
	<!-- Top 메뉴 -->
	<nav class="navbar navbar-fixed-top navbar-inverse">
	<div class="container" align="right" style="padding-right: 10px;
								margin-right: 10px;">
		<span id="clock"></span> <span id="time"></span>
		<p class="navbar-text" style="
					position: absolute;
					right: 0px; 
					top: 0px;
					margin-bottom: 5px;
					margin-top: 20px;">관리자님 환영합니다.</p>
	</div>
	</nav>

	<!-- 네이게이션바 -->
	<div id="top-menu">
		<ul class="nav nav-pills">
			<li role="presentation" id="home"><a href="/Bears/jsp/admin/AdminMain.jsp"">홈 </a></li>
			<li role="presentation" id="brand"><a href="#">브랜드</a></li>
			<li role="presentation" id="store"><a href="/Bears/jsp/admin/AdminStore.jsp">음식점</a></li>
			<li role="presentation" id="menu"><a href="#">메뉴</a></li>
			<li role="presentation" id="order"><a href="#">주문</a></li>
			<li role="presentation" id="member"><a href="#">회원</a></li>
			<li role="presentation" id="master"><a href="#">사장</a></li>
		</ul>
	</div>
</body>
</html>
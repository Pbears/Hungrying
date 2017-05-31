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
<link rel="stylesheet" href="/Bears/css/bootstrap.css" />
<script src="/Bears/js/canvasjs.min.js"></script>
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
	
		
		window.onload = function () {
			datePro();
			var chart = new CanvasJS.Chart("chartContainer", {
				title: {
					text: "Stripline on  Axis X"
				},
				axisX:{
					stripLines:[
					{
						value:1940,
						color: "red"
					}
					]
				},
				data: [
				{
					type: "line",
					dataPoints: [
						{ x: 1910, y: 5 },
						{ x: 1920, y: 9 },
						{ x: 1930, y: 17},
						{ x: 1940, y: 32},
						{ x: 1950, y: 22},
						{ x: 1960, y: 14},
						{ x: 1970, y: 25},
						{ x: 1980, y: 18},
						{ x: 1990, y: 20}
					]
				}
				]
			});
			chart.render();
		  }

</script>
</head>
<body>
	<!-- Top 메뉴 -->
	<nav class="navbar navbar-fixed-top navbar-inverse">
	<div class="container" align="right" style="padding-right: 10px;
								margin-right: 10px;">
		<span id="clock"></span> <span id="time" style="margin-right:10px;"></span>
		<p class="navbar-text" style="
					position: absolute;
					right: 0px; 
					top: 0px;
					margin-bottom: 5px;
					margin-top: 26px;
					margin-right:100px;">"<%=session.getAttribute("name") %>"님 환영합니다.</p>
		<button type="button" class="btn btn-default" style="margin-top:10px;" onclick="sendOut()">Logout</button>
	</div>
	</nav>

	<!-- 네이게이션바 -->
	<div id="top-menu">
		<ul class="nav nav-pills">
			<li role="presentation" id="home"><a href="/Bears/jsp/admin/AdminMain.jsp"">홈 </a></li>
			<li role="presentation" id="brand"><a href="/Bears/jsp/admin/AdminBrand.jsp">브랜드</a></li>
			<li role="presentation" id="store"><a href="/Bears/jsp/admin/AdminStore.jsp">음식점</a></li>
			<li role="presentation" id="menu"><a href="/Bears/jsp/admin/AdminMenu.jsp">메뉴</a></li>
			<li role="presentation" id="order"><a href="/Bears/jsp/admin/AdminOrder.jsp">주문</a></li>
			<li role="presentation" id="member"><a href="/Bears/jsp/admin/AdminMember.jsp">회원</a></li>
			<li role="presentation" id="master"><a href="/Bears/jsp/admin/AdminMaster.jsp">사장</a></li>
		</ul>
	</div>
	
	<!-- 그래프 -->
	<div id="chartContainer" style="height: 400px; width: 300px;"></div>
</body>
</html>
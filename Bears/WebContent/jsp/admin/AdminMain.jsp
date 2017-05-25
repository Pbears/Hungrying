<%@page import="food.dao.MemberDao"%>
<%@page import="food.vo.AdminVo"%>
<%@page import="java.util.HashMap"%>
<%@page import="java.util.List"%>
<%@ page language="java" contentType="text/html; charset=EUC-KR"
	pageEncoding="EUC-KR"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">
<html xmlns="http://www.w3.org/1999/xhtml">
<head>
<title>관리자</title>
<meta http-equiv="Content-Type" content="text/html; charset=utf-8" />
<meta http-equiv="X-UA-Compatible" content="IE=7" />
<meta http-equiv="imagetoolbar" content="no" />
<link href="/Bears/css/contents.css" rel="stylesheet" type="text/css" />
<link rel="stylesheet" href="/Bears/jsp/css/bootstrap.css"/>
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
		clock = date.getFullYear() + "/" + (parseInt(date.getMonth()) + 1) + '/' + date.getDate() + '/' + date.getKorDay();
		time = date.getHours() + ':' + date.getMinutes() + ':' + date.getSeconds();
		document.getElementById("clock").innerHTML = "<font color=white> " + clock + "</font>";
		document.getElementById("time").innerHTML = "<font color=white> " + time + "</font>";
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
	function menuClick(obj){
		alert(obj.id);

	}

</script>
</head>
<body onload="datePro()">
	<div id="wrapper">
		<div id="header">
			<div class="topInfoWrap">
				<div class="topInfoArea clfix">
					<div class="loginWrap">
						<span class="fir"> </span> 
						<span id="clock"></span> 
						<span id="time"></span> 
						<span><%=session.getAttribute("name") %>님<em> 
						</em> 좋은 하루 되세요</span> <a href="AdminLogout.jsp" class="btnLogout"> <img
							src="/Bears/img/common/btn_logout.gif" alt="로그아웃" /></a>
					</div>
				</div>
			</div>
<ul class="nav nav-pills" id="menu" >
  <li role="presentation" id="home" onclick="menuClick(this)" data-toggle="pill"><a href="#">home</a></li>
  <li role="presentation" id="profile" onclick="menuClick(this)" data-toggle="pill"><a href="#">profile</a></li>
  <li role="presentation" id="messages" onclick="menuClick(this)" data-toggle="pill"><a href="#">messages</a></li>
</ul>

		</div>
	</div>
	<script type="text/javascript" src="/Bears/jsp/js/bootstrap.js"></script>
</body>
</html>
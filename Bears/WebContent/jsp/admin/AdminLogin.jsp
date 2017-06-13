<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<link rel="stylesheet" href="/Bears/css/bootstrap.css" />
<title>Insert title here</title>
<script>
	function loginCheck() {
		var obj = document.login;
		if (!obj.id.value || !obj.pw.value) {
			alert('ID or PW CHECK!');
			obj.id.value = '';
			obj.pw.value = '';
			obj.id.focus();
		} else {
			obj.submit();
		}
	}
</script>
<style>  
body {
	width: 100%;
	background-image: url('/Bears/img/background/login.jpg');
	opacity: 1;
	text-align: center;
}

#mainDiv {
	display: inline-block;
	vertical-align: middle;
	padding: 300px;
	margin: 0 auto;
}

#inDiv {
	background-color: rgba(255, 255, 255, 0.5);
	display: inline-block;
	vertical-align: middle;
	padding: 50px;
	margin: 0 auto;
}
</style>
</head>
<body>
	<form action="/Bears/jsp/admin/AdminLoginProcess.jsp" method="post" name="login">
		<div id="mainDiv" class="input-group">
			<div id="inDiv" class="input-group">
				<input type="text" name="id" id="id" class="form-control" placeholder="User ID"> 
				<input type="password" name="pw" id="pw" class="form-control" placeholder="User PW"> 
				<input type="button" class="form-control" value="Login" onclick="loginCheck()">
			</div>
		</div>
	</form>
</body>
</html>
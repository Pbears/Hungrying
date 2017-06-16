<%@page import="food.vo.MenuVo"%>
<%@page import="food.dao.MenuDao"%>
<%@ page language="java" contentType="text/html; charset=EUC-KR"
	pageEncoding="EUC-KR"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=EUC-KR">
<link rel="stylesheet" href="/Bears/css/bootstrap.css" />
<title>메뉴 세부 정보</title>
<style type="text/css">
#mainDiv{
	width: 80%;
	height : 80%;
	margin: 0 auto;
}
#innerDiv {
	width : 20%;
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

	function checkMenuname(obj){
		if(!obj.value){
			alert('menuname 입력!');
			obj.value='';
		}else if(obj.value.length>25){
			alert('menuname은 25자이하!');
			obj.value='';
		}
	}

	function checkBrandno(obj){
		if(!obj.value){
			alert('brandno 입력!');
			obj.value='';
		}else if(isNaN(obj.value)||obj.value.length>3){
			alert('brandno는 3자리이하숫자만!');
			obj.value='';
		}
	}

	function checkPrice(obj){
		if(!obj.value){
			alert('price 입력!');
			obj.value='';
		}else if(obj.value.length>7){
			alert('peice는 7자리이하!');
			obj.value='';
		}
	}

	function checkInfo(obj){
		if(obj.value.length>30){
			alert('info는 30글자만!');
			obj.value='';
		}
	}
	//뒤로
	function backAdminStore(){
		document.location.href='/Bears/jsp/admin/AdminMenu.jsp';
	}
	//추가
	function MenuInsert(){
		var obj = document.MenuFrm;
		alert('메뉴추가가 완료되었습니다!');
		obj.submit();			
	}
	function getValue(){
			 data=document.getElementById('query').value;
			 alert(data);
	}
</script>
<body>
<%
	MenuVo mv=null;
	request.setCharacterEncoding("EUC-KR");
%>
	<h2 align="center"> 메뉴 추가 </h2><br><br>
	<form action="/Bears/jsp/admin/insert/MenuInsertProcess.jsp" name="MenuFrm" method="post">
		<div id="mainDiv">
			<div id="innerDiv">
				<h4>메뉴이름</h4> 
				<input type="text" name="menuname" onblur="checkMenuname(this)" class="form-control" placeholder="menuname" aria-describedby="basic-addon2" >
				<h4>브랜드번호</h4> 
				<input type="text" name="brandno" onblur="checkBrandno(this)" class="form-control" placeholder="brandno" aria-describedby="basic-addon2">
				<h4>가격</h4> 
				<input type="text" name="price" onblur="checkPrice(this)" class="form-control" placeholder="price" aria-describedby="basic-addon2">
				<h4>Info</h4> 
				<input type="text" name="Info" onblur="checkInfo(this)" class="form-control" placeholder="info" aria-describedby="basic-addon2">
				<h4>Image</h4>
				<input type="file" name="image" class="form-control">
				<%
				%>
			</div>
			<br><br><br>
			<div id="buttonDiv">
				<button type="button" class="btn btn-default" onclick="MenuInsert()">추가</button>
				<button type="button" class="btn btn-default" onclick="backAdminMenu()">뒤로</button>
			</div>
		</div>
	</form>
</body>
</html>
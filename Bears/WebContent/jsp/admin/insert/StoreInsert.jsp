<%@ page language="java" contentType="text/html; charset=EUC-KR"
	pageEncoding="EUC-KR"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=EUC-KR">
<link rel="stylesheet" href="/Bears/css/bootstrap.css" />
<title>음식점 세부 정보</title>
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
	//음식점이름 제약조건
	function checkStorename(obj){
		if(!obj.value){
			alert('storename 입력!');
			obj.value='';
		}else if(obj.value.length>25){
			alert('storename은 25자이하!');
			obj.value='';
		}
	}
	//브랜드번호 제약조건
	function checkBrandno(obj){
		if(!obj.value){
			alert('brandno 입력!');
			obj.value='';
		}else if(isNaN(obj.value)||obj.value.length>3){
			alert('brandno는 3자리이하숫자만!');
			obj.value='';
		}
	}
	//음식점위치 제약조건
	function checkLocation(obj){
		if(!obj.value){
			alert('location 입력!');
			obj.value='';
		}else if(obj.value.length>100){
			alert('location은 100자리이하!');
			obj.value='';
		}
	}
	//음식점평점 제약조건
	function checkGpa(obj){
		if(obj.value.length>1 || isNaN(obj.value)){
			alert('gpa은 한자리숫자만!');
			obj.value='';
		}
	}
	//영업시간 제약조건
	function checkHours(obj){
		if(!obj.value){
			alert('hours 입력!');
			obj.value='';
		}else if(obj.value.length>25){
			alert('hours는 25자리이하!');
			obj.value='';
		}
	}
	//전화번호 제약조건
	function checkTel(obj){
		if(!obj.value){
			alert('tel 입력!');
			obj.value='';
		}else if(obj.value.length>20){
			alert('tel는 20자리이하!');
			obj.value='';
		}
	}
	//배달최소가격 제약조건
	function checkMinprice(obj){
		if(!obj.value){
			alert('minprice 입력!');
			obj.value='';
		}else if(obj.value.length>5||isNaN(obj.value)){
			alert('minprice는 5자리이하 숫자만!');
			obj.value='';
		}
	}

	
	//뒤로
	function backAdminStore(){
		document.location.href='/Bears/jsp/admin/AdminStore.jsp';
	}
	//추가
	function storeInsert(){
		var obj = document.storeFrm;
		alert('음식점추가가 완료되었습니다!');
		obj.submit();			
	}
</script>
<body>
<%
	request.setCharacterEncoding("EUC-KR");
%>
	<h2 align="center"> 음식점 추가 </h2><br><br>
	<form action="/Bears/jsp/admin/insert/StoreInsertProcess.jsp" name="storeFrm" method="post">
		<div id="mainDiv">
			<div id="innerDiv">
				<h4>음식점이름</h4> 
				<input type="text" name="storename" onblur="checkStorename(this)" class="form-control" placeholder="storename" aria-describedby="basic-addon2" >
				<h4>브랜드번호</h4> 
				<input type="text" name="brandno" onblur="checkBrandno(this)" class="form-control" placeholder="brandno" aria-describedby="basic-addon2">
				<h4>음식점위치</h4> 
				<input type="text" name="location" onblur="checkLocation(this)" class="form-control" placeholder="location" aria-describedby="basic-addon2">
				<h4>음식점평점</h4> 
				<input type="text" name="gpa" onblur="checkGpa(this)" class="form-control" placeholder="gpa" aria-describedby="basic-addon2">
				<h4>영업시간</h4> 
				<input type="text" name="hours" onblur="checkHours(this)" class="form-control" placeholder="hours" aria-describedby="basic-addon2">
				<h4>전화번호</h4> 
				<input type="text" name="tel" onblur="checkTel(this)" class="form-control" placeholder="tel" aria-describedby="basic-addon2">
				<h4>배달최소가격</h4> 
				<input type="text" name="minprice" onblur="checkMinprice(this)" class="form-control" placeholder="minprice" aria-describedby="basic-addon2">
				<h4>음식점정보</h4> 
				<input type="text" name="info" onblur="checkInfo(this)" class="form-control" placeholder="info" aria-describedby="basic-addon2">
			</div>
			<br><br><br>
			<div id="buttonDiv">
				<button type="button" class="btn btn-default" onclick="storeInsert()">추가</button>
				<button type="button" class="btn btn-default" onclick="backAdminStore()">뒤로</button>
			</div>
		</div>
	</form>
</body>
</html>
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
	function checkBrandname(obj){
		if(!obj.value){
			alert('brandename 입력!');
			obj.value='';
		}else if(obj.value.length>25){
			alert('brandname은 25자이하!');
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


	
	//뒤로
	function backAdminBrand(){
		document.location.href='/Bears/jsp/admin/AdminBrand.jsp';
	}
	//추가
	function brandInsert(){
		var obj = document.brandFrm;
		alert('브랜드추가가 완료되었습니다!');
		obj.submit();			
	}
</script>
<body>
<%
	request.setCharacterEncoding("EUC-KR");
%>
	<h2 align="center"> 음식점 추가 </h2><br><br>
	<form action="/Bears/jsp/admin/insert/BrandInsertProcess.jsp" name="brandFrm" method="post">
		<div id="mainDiv">
			<div id="innerDiv">
				<h4>브랜드이름</h4> 
				<input type="text" name="brandname" onblur="checkBrandname(this)" class="form-control" placeholder="brandname" aria-describedby="basic-addon2" >
				<h4>브랜드번호</h4> 
				<input type="text" name="brandno" onblur="checkBrandno(this)" class="form-control" placeholder="brandno" aria-describedby="basic-addon2">
				
			</div>
			<br><br><br>
			<div id="buttonDiv">
				<button type="button" class="btn btn-default" onclick="brandInsert()">추가</button>
				<button type="button" class="btn btn-default" onclick="backAdminBrand()">뒤로</button>
			</div>
		</div>
	</form>
</body>
</html>
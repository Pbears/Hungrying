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
<body>
	<h2 align="center"> 음식점 추가 </h2><br><br>
	
	<div id="mainDiv">
		<div id="innerDiv">
			<h4>음식점이름</h4> <input type="text" class="form-control"
			placeholder="storename" aria-describedby="basic-addon2">
			<h4>브랜드번호</h4> <input type="text" class="form-control"
			placeholder="brandno" aria-describedby="basic-addon2">
			<h4>음식점위치</h4> <input type="text" class="form-control"
			placeholder="location" aria-describedby="basic-addon2">
			<h4>음식점평점</h4> <input type="text" class="form-control"
			placeholder="gpa" aria-describedby="basic-addon2">
			<h4>영업시간</h4> <input type="text" class="form-control"
			placeholder="hours" aria-describedby="basic-addon2">
			<h4>전화번호</h4> <input type="text" class="form-control"
			placeholder="tel" aria-describedby="basic-addon2">
			<h4>배달최소가격</h4> <input type="text" class="form-control"
			placeholder="minprice" aria-describedby="basic-addon2">
			<h4>음식점정보</h4> <input type="text" class="form-control"
			placeholder="info" aria-describedby="basic-addon2">
		</div>
		<br><br><br>
		<div id="buttonDiv">
			<button type="button" class="btn btn-default">추가</button>
			<button type="button" class="btn btn-default">뒤로</button>
		</div>
	</div>
	
	
</body>
</html>
<%@page import="food.dao.BrandDao"%>
<%@page import="food.vo.BrandVo"%>
<%@ page language="java" contentType="text/html; charset=EUC-KR"
    pageEncoding="EUC-KR"%>
    <%
   	 request.setCharacterEncoding("euc-kr");
    %>
 <jsp:useBean id="vo" scope="page" class="food.vo.BrandVo"></jsp:useBean>
 <jsp:setProperty property="*" name="vo" />
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=EUC-KR">
<title>Insert title here</title>
<script type="text/javascript">
	opener.document.location.reload();	//AdminBrand.jsp를 새로고침
	self.close(); 									//info.jsp 닫기
</script>
</head>
<body>
	<%
		BrandDao.updateBrand(vo); //해당 정보 UPDATE
	%>
</body>
</html>
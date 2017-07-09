<%@page import="food.dao.AdminDao"%>
<%@ page language="java" contentType="text/html; charset=EUC-KR"
    pageEncoding="EUC-KR"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=EUC-KR">
<title>Insert title here</title>
</head>
<body>
<%
	String id=request.getParameter("id");
	String pw=request.getParameter("pw");
	if(AdminDao.idCheck(id).equals(pw)){
		session.setAttribute("name",AdminDao.getName(id));
		session.setAttribute("id", id);
		session.setAttribute("pw", pw);
		session.setMaxInactiveInterval(60);
		response.sendRedirect("AdminMain.jsp");
	}else{
		// 경고창을 띄우세요 ~ ㅋㅋㅋㅋㅋ
		response.sendRedirect("AdminLogin.jsp");
	}
%>
</body>
</html>
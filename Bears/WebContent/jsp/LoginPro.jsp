<%@page import="food.dao.MemberDao"%>
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
	String id=request.getParameter("user_id");
	String pw=request.getParameter("user_passwd");
	if(MemberDao.idCheck(id).equals(pw)){
		session.setAttribute("name",MemberDao.getName(id));
		session.setAttribute("id", id);
		session.setAttribute("pw", pw);
		session.setMaxInactiveInterval(60);
		response.sendRedirect("editList.jsp");
	}else{
		response.sendRedirect("adminLogin.jsp");
	}
	

%>
</body>
</html>
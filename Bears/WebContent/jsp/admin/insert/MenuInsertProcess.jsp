<%@page import="food.dao.MenuDao"%>
<%@page import="food.dao.StoreDao"%>
<%@ page language="java" contentType="text/html; charset=EUC-KR"
    pageEncoding="EUC-KR"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=EUC-KR">
<title>Insert title here</title>
<%
   request.setCharacterEncoding("EUC-KR");
%>
</head>
<jsp:useBean id="bean" class="food.vo.MenuVo" scope="page"></jsp:useBean>
<jsp:setProperty property="*" name="bean"/>
<body>
<%
	MenuDao.insertMenu(bean);
	response.sendRedirect("/Bears/jsp/admin/AdminMenu.jsp");
%>
</body>
</html>
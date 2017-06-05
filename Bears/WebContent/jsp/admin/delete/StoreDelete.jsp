<%@page import="food.dao.StoreDao"%>
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
     request.setCharacterEncoding("EUC-KR");
     String state=request.getParameter("state");
     out.println(state);
     if(state!=null && state.length()>0){
    	 String []res=request.getParameterValues("cb");    	 
    	 for(String s : res){
    		out.println(s);
    		StoreDao.deleteStore(s);
    	 }
     }
      else{
    	 String no =request.getParameter("no");
    	 StoreDao.deleteStore(no);
     }
     response.sendRedirect("/Bears/jsp/admin/AdminStore.jsp");
  %>
</body>
</html>
<%@page import="food.dao.BrandDao"%>
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
    		BrandDao.deleteBrand(s);
    	 }
     }
      else{
    	 String no =request.getParameter("no");
    	 BrandDao.deleteBrand(no);
     }
     response.sendRedirect("/Bears/jsp/admin/AdminBrand.jsp");
  %>
</body>
</html>
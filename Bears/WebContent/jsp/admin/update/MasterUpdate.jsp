<%@page import="food.vo.MasterVo"%>
<%@page import="food.dao.MasterDao"%>
<%@page import="food.dao.StoreDao"%>
<%@page import="food.vo.StoreVo"%>
<%@ page language="java" contentType="text/html; charset=EUC-KR"
    pageEncoding="EUC-KR"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=EUC-KR">
<title>Insert title here</title>
<script type="text/javascript">
	opener.document.location.reload();	//AdminStore.jsp를 새로고침
	self.close(); 									//info.jsp 닫기
</script>
</head>
<body>
	<%
		MasterVo vo = new MasterVo();
	
		String id = request.getParameter("id");
		String name = request.getParameter("name");
		String birth = request.getParameter("birth");
		String storename = request.getParameter("storename");
		String address = request.getParameter("address");
		String tel = request.getParameter("tel");
		
		vo.setId(id);
		vo.setName(name);
		vo.setBirth(birth);
		vo.setStorename(storename);
		vo.setAddress(address);
		vo.setTel(tel);
		
		MasterDao.updateMaster(vo); //해당 정보 UPDATE
	%>
</body>
</html>
<%@page import="java.io.File"%>
<%@page import="org.apache.commons.fileupload.FileItem"%>
<%@page import="java.util.List"%>
<%@page import="org.apache.commons.fileupload.DiskFileUpload"%>
<%@page import="org.apache.commons.fileupload.FileUpload"%>
<%@page import="food.vo.MenuVo"%>
<%@page import="food.dao.MenuDao"%>
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
		String pathUpload = "C:\\Users\\sist7-22\\git\\Hungrying\\Bears\\WebContent\\upload";
		MenuVo bean = new MenuVo();
		try {
			if (FileUpload.isMultipartContent(request)) {
				DiskFileUpload fileUpload = new DiskFileUpload();
				fileUpload.setSizeMax(1048576 * 5);
				List<FileItem> list = fileUpload.parseRequest(request);
				String fileName = "";

				for (FileItem file : list) {
					String name = file.getFieldName();
					if (name.equals("menuname")) {
						bean.setMenuname(file.getString("EUC-KR"));
					}
					if (name.equals("brandno")) {
						bean.setBrandno(Integer.parseInt(file.getString("EUC-KR")));
					}
					if (name.equals("price")) {
						bean.setPrice(Integer.parseInt(file.getString("EUC-KR")));
					}
					if (name.equals("info")) {
						bean.setInfo(file.getString("EUC-KR"));
					}
					if (!file.isFormField()) {
						File f = new File(pathUpload + file.getName());
						bean.setPicture(file.getName());
						file.write(f);
					}

				} //for
				MenuDao.insertMenu(bean);
			} //if
		} catch (Exception e) {
			e.printStackTrace();

		}
		response.sendRedirect("/Bears/jsp/admin/AdminMenu.jsp");
	%>
	
</body>
</html>
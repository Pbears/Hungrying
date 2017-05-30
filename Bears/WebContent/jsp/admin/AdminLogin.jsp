<%@ page language="java" contentType="text/html; charset=EUC-KR"
    pageEncoding="EUC-KR"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">
<html xmlns="http://www.w3.org/1999/xhtml">
<head>
<title>관리자</title>
<meta http-equiv="Content-Type" content="text/html; charset=utf-8" />
<meta http-equiv="X-UA-Compatible" content="IE=7" />
<meta http-equiv="imagetoolbar" content="no" />
<meta name="copyright" content="Copyright 2009 @ high1 all rights reserved" />
<link href="/Bears/css/contents.css" rel="stylesheet" type="text/css" />
<script>
	// 로그인체크
	function loginCheck(){
		var obj = document.login;
		if(!obj.user_id.value||!obj.user_passwd.value){
			alert('ID or PW CHECK!');
			obj.user_id.value='';
			obj.user_passwd.value='';
			obj.user_id.focus();
		}else{
			obj.submit();
		}
	} 
	
	 function checkCook(id){
   	  if(id.length>0){
   		  document.getElementById("checker").checked=true;
   	  }else{
   		  document.getElementById("checker").checked=false;
   	  }
     }
</script>
	<%
	    Cookie[]cookies=request.getCookies();
	    String id="";
	    if(cookies!=null && cookies.length>0){
	    	for(int i=0;i<cookies.length;i++){
	    		if(cookies[i].getName().equals("id")){
	    			id=cookies[i].getValue();
	    		}
	    	}
	    }
	%>
</head>
<body onload="checkCook('<%=id%>')">
<form name="login" method="post" action="/Bears/jsp/admin/AdminLoginProcess.jsp">
 <div id="loginWrapper">
  <div class="loginForm">
   <fieldset>
    <legend>관리자 시스템 로그인</legend>
    <dl>
     <dt><img src="/Bears/img/common/th_id.gif" alt="아이디" /></dt>
     <dd><input type="text" name="id" class="text" id="id" value="<%=id %>" /></dd>
     <dt><img src="/Bears/img/common/th_pw.gif" alt="비밀번호" /></dt>
     <dd><input type="password" name="pw" class="text" id="pw" /></dd>
    </dl>
    <div class="btn">
	    <input id="btnSubmit" type="image" src="/Bears/img/button/btn_login.gif" alt="LOGIN" title="LOGIN" onclick="loginCheck()">
    </div>
    
    <div class="saveId"><input type="checkbox" id="checker" name="checker"/> 
     <img src="/Bears/img/common/save_id.gif" alt="아이디 저장" />
    </div>
   </fieldset>
  </div>
 </div>
</form>
</body>
</html>
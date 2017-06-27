<%@page import="java.net.URLEncoder"%>
<%@page import="food.dao.MenuDao"%>
<%@page import="food.vo.MenuVo"%>
<%@page import="java.util.HashMap"%>
<%@page import="food.dao.StoreDao"%>
<%@page import="food.vo.StoreVo"%>
<%@page import="java.util.List"%>
<%@ page language="java" contentType="text/html; charset=EUC-KR" pageEncoding="EUC-KR"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=EUC-KR">
<link rel="stylesheet" href="/Bears/css/bootstrap.css" />
<title>관리자-메뉴</title>
<style>
tr:NTH-CHILD(even) {
    background-color: #f2f2f2;
}
#div2 {
    white-space: nowrap; 
    width: 700px; 
    overflow: hidden;
    text-overflow: ellipsis; 
}
</style>
<script>
    var nodeList = document.getElementsByName("cb");
    Date.prototype.getKorDay = function() {
        var result = null;
        switch (this.getDay()) {
        case 0:
            result = "sun";
            break;
        case 1:
            result = "mon";
            break;
        case 2:
            result = "tue";
            break;
        case 3:
            result = "wed";
            break;
        case 4:
            result = "thr";
            break;
        case 5:
            result = "fri";
            break;
        default:
            result = "sat";
        }
        return result;
    }
    function sendOut() {
        document.location.href = 'AdminLogout.jsp';
    }

    function datePro() {
        var clock = "";
        var time = "";
        var date = new Date();
        clock = date.getFullYear() + "/" + (parseInt(date.getMonth()) + 1)
                + '/' + date.getDate() + '/' + date.getKorDay();
        time = date.getHours() + ':' + date.getMinutes() + ':'
                + date.getSeconds();
        document.getElementById("clock").innerHTML = "<font color=white> "
                + clock + "</font>";
        document.getElementById("time").innerHTML = "<font color=white> "
                + time + "</font>";
        var intervalID = function() {
            setInterval('datePro()', 1000);
        }
        intervalID();
    }

    function sendCheck() {
        var obj = document.ast; //form까지의 주소
        if (obj.query.name == 'empty' || !obj.data.value) {
            alert('Not Search!');
            obj.query.selectedIndex = 0;

            obj.data.value = '';
            obj.data.focus();
        } else {
            obj.submit();
        }
    }

    function MenuInsert(){
        document.location.href='/Bears/jsp/admin/insert/MenuInsert.jsp';
    }

    function MenuInfo(menuname){
        window.open("/Bears/jsp/admin/information/MenuInfo.jsp?menuname="+menuname,"stin","left=600,top=50,width=800,height=850");
    }
    function allStore(obj) {
        selectCb(obj.checked);
    }
    function selectCb(flag) {
        for (var i = 0; i < nodeList.length; i++) {
            nodeList[i].checked = flag ? true : false;
        }
    }
    function oneCheck(pt, no) {
        pt.value = pt.checked ? no : 0;

        var all = document.getElementById('allCheck');
        var test = false;
        for (var i = 0; i < nodeList.length; i++) {
            if (!nodeList[i].checked) {
                test = true;
            }
        }
        if (test)
            all.checked = false;
        else
            all.checked = true;
    }
    function deleteAll() {
        var cnt = 0;
        for (var i = 0; i < nodeList.length; i++) {
            if (nodeList[i].checked) {
                cnt++;
            }
        }
        if (cnt == 0) {
            alert('하나라도 CHECK');
            return false;
        }
        document.listFrm.submit();
    }
</script>
</head>
<body onload="datePro()">
    <%
        request.setCharacterEncoding("EUC-KR");
        List<MenuVo> list = null;

        HashMap<String, Object> map = new HashMap<String, Object>();

        String query = request.getParameter("query");
        String data = request.getParameter("data");

        int pageScale = 10;

        map.put("Q", query);
        map.put("D", data);
        int totalRow = MenuDao.getTotalRow(map);

        int currentPage = 0;

        try {
            currentPage = Integer.parseInt(request.getParameter("page"));
        } catch (Exception e) {
            currentPage = 1;
        }

        int totalPage = totalRow % pageScale == 0 ? totalRow / pageScale : totalRow / pageScale + 1;
        if (totalRow == 0)
            totalPage = 1;
        int start = 1 + (currentPage - 1) * pageScale;
        int end = pageScale + (currentPage - 1) * pageScale;

        int currentBlock = currentPage % pageScale == 0 ? (currentPage / pageScale) : (currentPage / pageScale) + 1;
        int startPage = 1 + (currentBlock - 1) * pageScale;
        int endPage = pageScale + (currentBlock - 1) * pageScale;
        if (totalPage <= endPage)
            endPage = totalPage;

        map.put("start", start);
        map.put("end", end);

         if (query != null && data != null) {
            map.put("query", query);
            map.put("data", data);
            list = MenuDao.searchMenu(map);
        } else {
            list = MenuDao.searchMenu(map);
        }
    %>
    <!-- Top 메뉴 -->
    <nav class="navbar navbar-fixed-top navbar-inverse">
    <div class="container" align="right"
        style="padding-right: 10px; margin-right: 10px;">
        <img src="/Bears/logo/logoLong.png"
            style="width: 200px; height: 50px; margin-right: 600px;" alt="배고팡" />
        <span id="clock"></span> <span id="time" style="margin-right: 10px;"></span>
        <p class="navbar-text"
            style="position: absolute; right: 0px; top: 0px; margin-bottom: 5px; margin-top: 26px; margin-right: 100px;">
            "<%=session.getAttribute("name")%>"님 환영합니다.
        </p>
        <button type="button" class="btn btn-default"
            style="margin-top: 10px;" onclick="sendOut()">Logout</button>
    </div>
    </nav>

<!-- 네이게이션바 -->
	<div id="top-menu">
		<ul class="nav nav-pills">
			<li role="presentation" id="home"><a href="/Bears/jsp/admin/AdminMain.jsp">홈 </a></li>
			<li role="presentation" id="brand"><a href="/Bears/jsp/admin/AdminBrand.jsp">브랜드</a></li>
			<li role="presentation" id="store"><a href="/Bears/jsp/admin/AdminStore.jsp">음식점</a></li>
			<li role="presentation" id="menu" class="active"><a href="/Bears/jsp/admin/AdminMenu.jsp">메뉴</a></li>
			<li role="presentation" id="order"><a href="/Bears/jsp/admin/AdminOrder.jsp">주문</a></li>
			<li role="presentation" id="member"><a href="/Bears/jsp/admin/AdminMember.jsp">회원</a></li>
			<li role="presentation" id="master"><a href="/Bears/jsp/admin/AdminMaster.jsp">사장</a></li>
		</ul>
	</div>
    <!-- 검색바 -->
    <div id="searcher" class="row">
        <div class="input-group">
            <form action="AdminMenu.jsp" name="ast" method="post">
                <table class="bbsWrite mgb35" align="center">
                    <colgroup>
                        <col width="30" />
                        <col width="400" />
                        <col width="50" />
                    </colgroup>
                    <tbody>
                        <tr>
                            <td height="50"><select name="query" size="1"
                                style="height: 34px;">
                                    <option value="empty" selected="selected">선택하세요</option>
                                    <option value="menuname">메뉴명</option>
                                    <option value="brandno">브랜드번호</option>
                                    <option value="price">가격</option>
                            </select></td>
                            <td><input type="text" class="form-control"
                                placeholder="Search for..." name="data"></td>
                            <td><span class="input-group-btn">
                                    <button class="btn btn-default" type="button">
                                        <a href="javascript:sendCheck()"> Search</a>
                                    </button>
                            </span></td>
                            <div style="postion: relative; left: 100px;">
                                <td><a href="AdminMenu.jsp?page=1"><button
                                            type="button" class="btn btn-default">새로고침</button></a></td>
                                <td>
                                    <button type="button" class="btn btn-default"
                                        onclick="MenuInsert()">추가</button>
                                </td>
                                <td>
                                    <button type="button" class="btn btn-default"
                                        onclick="deleteAll()">삭제</button>
                                </td>
                            </div>
                        </tr>
                    </tbody>
                </table>
            </form>
        </div>
        <!-- /input-group -->
    </div>

    <!-- /.row -->

    <div id="data_table">
    <form action="/Bears/jsp/admin/delete/MenuDelete.jsp?state=all" method="post" name="listFrm">
        <table class="bbsList" style="border-collapse: collapse;"
            border="1px solid black">
            <colgroup>
                <col width="50" />
                <col width="200" />
                <col width="150" />
                <col width="60" />
                <col width="300" />
            </colgroup>
            <tr>
                <th scope="col" style="text-align: center;"><input type="checkbox" id="allCheck" name="allCheck" onclick="allStore(this)"></th>
                <th scope="col" style="text-align: center;">메뉴이름</th>
                <th scope="col" style="text-align: center;">브랜드번호</th>
                <th scope="col" style="text-align: center; padding-left: 5px;">가격</th>
                <th scope="col" style="text-align: center;">소개</th>
            </tr>
            <tbody>
                <%
                    for (int i = 0; i < list.size(); i++) {
                        MenuVo vo = list.get(i);
                %>
                <tr >
                    <div id="select">
                        <td>
                            <input type="checkbox" name="cb" id="cb" value="<%=vo.getMenuname() %>" onclick="oneCheck(this,'<%=vo.getMenuname()%>')">
                        </td>
                        <td style="padding-bottom: 10px;">
                        <a href="javascript:MenuInfo('<%=vo.getMenuname()%>')"><%=vo.getMenuname()%></a>
                        </td>
                        <td><%=vo.getBrandno()%></td>
                        <td><%=vo.getPrice()%></td>
                        <td><div id="div2" style="text-align: center;"><%=vo.getInfo()%></div></td>
                    </div>
                <%
                    }
                %>
            </tbody>
        </table>
        </form>
    </div>

 <!-- 페이지이동페이징 -->
	<div class="paging" style="text-align: center;">
		<ul class="pagination">
			<ul class="pager">
   			<li>
				<a href="AdminMenu.jsp?page=1" aria-label="Previous">
					<span aria-hidden="true">&laquo;</span>
				</a>
			</li>
			<li>
			<li>
			
			<%
				if (currentBlock > 1) {
					if (currentPage != startPage) {
			%>
					<a href="AdminMenu.jsp?page=<%=startPage - 1%>&query=<%=query != null ? query : 0%>&data=<%=data != null ? data : 0%>">
						Previous
					</a>
			<%
					}else{
			%>
						<a href="#">Previous</a>
			<% 
					}
				}else {
					if (currentPage != startPage) {
			%>
						<a href="AdminMenu.jsp?page=<%=currentPage - 1%>&query=<%=query != null ? query : 0%>&data=<%=data != null ? data : 0%>">
							Previous
						</a>
			<%
					}else{
			%>
						<a href="#">Previous</a>
			<%
					}
				}
			%>
			</li>
		<span> 
			<%
				
 				if(data != null){
					data =  URLEncoder.encode(request.getParameter("data"), "EUC-KR");	
				} 
		
 				for (int i = startPage; i <= endPage; i++) {
 					if (i == currentPage) {
 			%> 
 					<li>
 						<a href="#"><strong><%=i %></strong></a>
 					</li> 
 			<%
 					} else {
 			%> 
 					<li>
 						<a href="AdminMenu.jsp?page=<%=i%>&query=<%=query!=null?query:0%>&data=<%=data!=null?data:0%>">
 							<%=i %>
						</a>
					</li>
			<%
 					}
 				}
 			%>
		</span>
		<li>
		<%
			if (totalPage > endPage) {
				if (currentPage != endPage) {
		%>
					<a href="AdminMenu.jsp?page=<%=currentPage + 1%>&query=<%=query != null ? query : 0%>&data=<%=data != null ? data : 0%>">
						Next
					</a>
		<%
				} else {
		%>
					<a href="#">Next</a>
		<%
				}
			}else{
				if (currentPage != endPage) {
		%>
					<a href="AdminMenu.jsp?page=<%=currentPage + 1%>&query=<%=query != null ? query : 0%>&data=<%=data != null ? data : 0%>">
						Next
					</a>
		<%
				}else{
		%>
					<a href="#">Next</a>
		<%
				}
			}
		%>
		</li>
		
		<li>
			<a href="AdminMenu.jsp?page=<%=totalPage%>&query=<%=query != null ? query : 0%>&data=<%=data != null ? data : 0%>" aria-label="Next">
				<span aria-hidden="true">&raquo;</span>
			</a>
		</li>
		</ul>
	</div>
</body>
</html>

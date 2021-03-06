<%@page import="java.net.URLDecoder"%>
<%@page import="java.net.URLEncoder"%>
<%@page import="food.dao.MasterDao"%>
<%@page import="food.vo.MasterVo"%>
<%@page import="java.util.HashMap"%>
<%@page import="java.util.List"%>
<%@ page language="java" contentType="text/html; charset=EUC-KR"
	pageEncoding="EUC-KR"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=EUC-KR">
<link rel="stylesheet" href="/Bears/css/bootstrap.css" />
<title>관리자-사장님</title>
<style>
tr:NTH-CHILD(even) {
	background-color: #f2f2f2;
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
		if (obj.query.value == 'empty' || !obj.data.value) {
			alert('Not Search!');
			obj.query.selectedIndex = 0;
			obj.data.value = '';
			obj.data.focus();
		} else {
			obj.submit();
		}
	}

	function masterInsert() {
		document.location.href = '/Bears/jsp/admin/insert/MasterInsert.jsp';
	}

	function masterInfo(storename) {
		window.open("/Bears/jsp/admin/information/MasterInfo.jsp?storename="
				+storename, "stin",
				"left=150,top=50,width=1600,height=850");
	}
	function allMaster(obj) {
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
		confirm("삭제하시겠습니까?");
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
		List<MasterVo> list = null;
		String query = request.getParameter("query");
		String data = request.getParameter("data");
		
		HashMap<String, Object> map = new HashMap<String, Object>();
		int pageScale = 10;
		map.put("Q", query);
		map.put("D", data);
		int totalRow = MasterDao.getTotalRow(map);

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
		//out.print(query+"   "+data ); //출력확인
		int currentBlock = currentPage % pageScale == 0 ? (currentPage / pageScale) : (currentPage / pageScale + 1);
		int startPage = 1 + (currentBlock - 1) * pageScale;
		int endPage = pageScale + (currentBlock - 1) * pageScale;
		//   out.println(startPage+" "+endPage+ " "+currentBlock+" "+totalPage);
		if (totalPage <= endPage)
			endPage = totalPage;
		map.put("start", start);
		map.put("end", end);

		if (query != null && data != null) {
			map.put("query", query);
			map.put("data", data);
			list = MasterDao.searchMaster(map);
		} else {
			list = MasterDao.searchMaster(map);
		}
	%>
	<!-- Top 메뉴 -->
<jsp:include page="include/top.jsp" />

	<!-- 검색바 -->
	<div id="searcher" class="row">
		<div class="input-group">
			<form action="AdminMaster.jsp" name="ast" method="post">
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
									<option value="storename">음식점명</option>
									<option value="id">아이디</option>
									<option value="name">이름</option>
									<option value="address">주소</option>
							</select></td>
							<td><input type="text" class="form-control"
								placeholder="Search for..." name="data"></td>
							<td><span class="input-group-btn">
									<button class="btn btn-default" type="button">
										<a href="javascript:sendCheck()"> Search</a>
									</button>
							</span></td>
							<div style="postion: relative; left: 100px;">
								<td><a href="AdminMaster.jsp?page=1"><button
											type="button" class="btn btn-default">새로고침</button></a></td>
								<td>
									<button type="button" class="btn btn-default"
										onclick="StoreInsert()">추가</button>
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
		<form action="/Bears/jsp/admin/delete/MasterDelete.jsp?state=all"
			method="post" name="listFrm">
			<table class="bbsList" style="border-collapse: collapse;"
				border="1px solid black">
				<colgroup>
					<col width="60" />
					<col width="180" />
					<col width="100" />
					<col width="120" />
					<col width="100" />
					<col width="350" />
					<col width="100" />
				</colgroup>
				<tr>
					<th scope="col" style="text-align: center;"><input
						type="checkbox" id="allCheck" name="allCheck"
						onclick="allMaster(this)"></th>
					<th scope="col" style="text-align: center;">움식점명</th>
					<th scope="col" style="text-align: center;">이름</th>
					<th scope="col" style="text-align: center;">아이디</th>
					<th scope="col" style="text-align: center;">생년월일</th>
					<th scope="col" style="text-align: center;">주소</th>
					<th scope="col" style="text-align: center;">전화번호</th>
				</tr>
				<tbody>
					<%
						for (int i = 0; i < list.size(); i++) {
							MasterVo vo = list.get(i);
					%>
					<tr>
						<div id="select">
							<td>
								<input type="checkbox" name="cb" id="cb" value="<%=vo.getStorename()%>
									"onclick="oneCheck(this,'<%=vo.getStorename()%>')">
							</td>
							<td style="padding:10px;">
								<a href="javascript:masterInfo('<%=vo.getStorename()%>')">
									<%=vo.getStorename()%>
								</a>
							</td>
							<td><%=vo.getName()%></td>
							<td><%=vo.getId()%></td>
							<td><%=vo.getBirth()%></td>
							<td><%=vo.getAddress()%></td>
							<td><%=vo.getTel()%></td>
						</div>
					</tr>
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
				<a href="AdminMaster.jsp?page=1" aria-label="Previous">
					<span aria-hidden="true">&laquo;</span>
				</a>
			</li>
			<li>
			<li>
			
			<%
				if (currentBlock > 1) {
					if (currentPage != startPage) {
			%>
					<a href="AdminMaster.jsp?page=<%=startPage - 1%>&query=<%=query != null ? query : 0%>&data=<%=data != null ? data : 0%>">
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
						<a href="AdminMaster.jsp?page=<%=currentPage - 1%>&query=<%=query != null ? query : 0%>&data=<%=data != null ? data : 0%>">
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
 						<a href="AdminMaster.jsp?page=<%=i%>&query=<%=query!=null?query:0%>&data=<%=data!=null?data:0%>">
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
					<a href="AdminMaster.jsp?page=<%=currentPage + 1%>&query=<%=query != null ? query : 0%>&data=<%=data != null ? data : 0%>">
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
					<a href="AdminMaster.jsp?page=<%=currentPage + 1%>&query=<%=query != null ? query : 0%>&data=<%=data != null ? data : 0%>">
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
			<a href="AdminMaster.jsp?page=<%=totalPage%>&query=<%=query != null ? query : 0%>&data=<%=data != null ? data : 0%>" aria-label="Next">
				<span aria-hidden="true">&raquo;</span>
			</a>
		</li>
		</ul>
	</div>
</body>
</html>
<%@page import="java.util.HashMap"%>
<%@page import="java.util.List"%>
<%@page import="food.dao.BrandDao"%>
<%@page import="food.vo.BrandVo"%>
<%@page import="food.vo.StoreVo"%>
<%@ page language="java" contentType="text/html; charset=EUC-KR" pageEncoding="EUC-KR"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=EUC-KR">
<link rel="stylesheet" href="/Bears/css/bootstrap.css" />
<title>음식점 상세 정보</title>
<style type="text/css">
#mainDiv{
   width: 100%;
   height : 100%;
   margin: 0 auto;
}
#rightDiv, #leftDiv {
   width : 50%;
   margin : 0 auto;
   vertical-align: middle;
}
#leftDiv{
   float:left;
   padding:30px;
   margin: 0 auto;
}
#rightDiv{
   display:inline-block;
   padding:30px;
   margin: 0 auto;
}
#buttonDiv{
   width : 50%;
   margin : 0 auto;
   vertical-align: middle;
   text-align: center;
}
</style>
</head>
<script type="text/javascript">
   function backAdminStore(){
      self.close();      
   }
   
   function setBrandname() {
      var obj = document.brandInfo.brandname;
      obj.value = document.brandInfo.brandname1.value;
   }
   
      
   function updateConfirm() {
      var info = document.brandInfo;
      if(confirm('수정하시겠습니까?') == true){
         info.submit();   
      }else{
         return 0;
      }
   }
   
   //브랜드별 점포 게시판
   
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

	

	function storeInfo(storename) {
		window.open("/Bears/jsp/admin/information/StoreInfo.jsp?storename="
				+storename, "_blank",
				"left=150,top=80,width=1600,height=850");
	}
	
	
   
</script>
<body onload="datePro()">
<%
   request.setCharacterEncoding("EUC-KR");
   String brandname = request.getParameter("brandname");
   BrandVo bean=BrandDao.selectOneBrand(brandname);
   
   
   
   //브랜드별 점포 게시판
   
   
   
   List<StoreVo> list = null;
		String query = request.getParameter("query");
		String data = request.getParameter("data");
		HashMap<String, Object> map = new HashMap<String, Object>();
		int pageScale = 5;
		map.put("Q", query);
		map.put("D", data);
		map.put("brandname",brandname);
		map.put("brandno", bean.getBrandno());
		int totalRow = BrandDao.subGetTotalRow(map);

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
			list = BrandDao.searchStore(map);
		} else {
			list = BrandDao.searchStore(map);
		}
   
   
   
   
   
   
%>
   <h2 align="center">브랜드 상세 정보 </h2><br>
   <div id="mainDiv">
       <div id="leftDiv">
          <h2 align="center"> 상세정보 </h2><br>
       <!-- 브랜드에 대한 정보 -->
       <form action="/Bears/jsp/admin/update/BrandUpdate.jsp" method="post" name="brandInfo">
         <h4>브랜드번호</h4> 
            <input type="text" value="<%=bean.getBrandno() %>" class="form-control" placeholder="brandno" aria-describedby="basic-addon2" disabled="disabled">
            <input type="hidden" value="<%=bean.getBrandno() %>" name="brandno" class="form-control">
         <h4>브랜드이름</h4> 
            <input type="text" value="<%=bean.getBrandname()%>"name="brandname1" class="form-control" placeholder="brandname" aria-describedby="basic-addon2" onchange="setBrandname()">
            <input type="hidden" value="<%=bean.getBrandname()%>" name="brandname" class="form-control" >
         <br><br>
         <div id="buttonDiv">
            <button type="button" class="btn btn-default" onclick="updateConfirm()">수정</button>
            <button type="button" class="btn btn-default" onclick="backAdminStore()">취소</button>
         </div>
         </form>
      </div> 
      <div id="rightDiv">
      
      <!-- 브랜드별 Store에 대한 정보 -->
         <div id="searcher" class="row">
		<div class="input-group">
			<form action="BrandInfo.jsp?brandname=<%=request.getParameter("brandname")%>" name="ast" method="post">
				<table class="bbsWrite mgb35" align="center">
					<colgroup>
						<col width="30" />
						<col width="400" />
						<col width="50" />
					</colgroup>
					<tbody>
						<tr>
							<td height="50">
							<select name="query" size="1" style="height: 34px;">
									<option value="empty" selected="selected">선택하세요</option>
									<option value="storename">음식점명</option>
									<option value="location">위치</option>
							</select></td>
							<td><input type="text" class="form-control" placeholder="Search for..." name="data"></td>
							<td><span class="input-group-btn">
									<button class="btn btn-default" type="button">
										<a href="javascript:sendCheck()"> Search</a>
									</button>
							</span></td>
							<div style="postion: relative; left: 100px;">
								<td><a href="BrandInfo.jsp?page=1"><button
											type="button" class="btn btn-default">새로고침</button></a></td>
								
								
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
		<form action="/Bears/jsp/admin/delete/StoreDelete.jsp?state=all" method="post" name="listFrm">
			<table class="bbsList" style="border-collapse: collapse;"
				border="1px solid black">
				<colgroup>
					
					<col width="200" />
					<col width="150" />
					<col width="60" />
					<col width="350" />
					<col width="150" />
					<col width="250" />
					<col width="180" />
				</colgroup>
				<tr>
					
					<th scope="col" style="text-align: center;">음식점명</th>
					<th scope="col" style="text-align: center;">브랜드번호</th>
					<th scope="col" style="text-align: center; padding-left: 5px;">평점</th>
					<th scope="col" style="text-align: center;">위치</th>
					<th scope="col" style="text-align: center;">영업시간</th>
					<th scope="col" style="text-align: center;">전화번호</th>
					<th scope="col" style="text-align: center;">배달최저가격</th>
				</tr>
				<tbody>
					<%
						for (int i = 0; i < list.size(); i++) {
							StoreVo vo = list.get(i);
					%>
					<tr>
						<div id="select">
							<td style="padding-bottom: 10px;">
							<a href="javascript:storeInfo('<%=vo.getStorename()%>')"><%=vo.getStorename()%></a></td>
							<td><%=vo.getBrandno()%></td>
							<td><%=vo.getGpa()%></td>
							<td style="padding-left: 5px; padding-right: 5px;"><%=vo.getLocation()%></td>
							<td><%=vo.getHours()%></td>
							<td><%=vo.getTel()%></td>
							<td><%=vo.getMinprice()%></td>
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
				<a href="BrandInfo.jsp?brandname=<%=request.getParameter("brandname")%>&page=1" aria-label="Previous">
					<span aria-hidden="true">&laquo;</span>
				</a>
			</li>
			<li>
			<li>
			
			<%
				if (currentBlock > 1) {
					if (currentPage != startPage) {
			%>
					<a href="BrandInfo.jsp?brandname=<%=request.getParameter("brandname")%>&page=<%=startPage - 1%>&query=<%=query != null ? query : 0%>&data=<%=data != null ? data : 0%>">
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
						<a href="BrandInfo.jsp?brandname=<%=request.getParameter("brandname")%>&page=<%=currentPage - 1%>&query=<%=query != null ? query : 0%>&data=<%=data != null ? data : 0%>">
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
 						<a href="BrandInfo.jsp?brandname=<%=request.getParameter("brandname")%>&page=<%=i%>&query=<%=query != null ? query : 0%>&data=<%=data != null ? data : 0%>">
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
					<a href="BrandInfo.jsp?brandname=<%=request.getParameter("brandname")%>&page=<%=currentPage + 1%>&query=<%=query != null ? query : 0%>&data=<%=data != null ? data : 0%>">
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
					<a href="BrandInfo.jsp?brandname=<%=request.getParameter("brandname")%>&page=<%=currentPage + 1%>&query=<%=query != null ? query : 0%>&data=<%=data != null ? data : 0%>">
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
			<a href="editList.jsp?brandname=<%=request.getParameter("brandname")%>&page=<%=totalPage%>&query=<%=query != null ? query : 0%>&data=<%=data != null ? data : 0%>" aria-label="Next">
				<span aria-hidden="true">&raquo;</span>
			</a>
		</li>
		</ul>         
         
         
         
         
      </div>
      <br>
   </div>
</body>
</html>
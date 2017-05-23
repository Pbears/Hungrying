<%@page import="food.dao.MemberDao"%>
<%@page import="food.vo.AdminVo"%>
<%@page import="java.util.HashMap"%>
<%@page import="java.util.List"%>
<%@ page language="java" contentType="text/html; charset=EUC-KR"
	pageEncoding="EUC-KR"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">
<html xmlns="http://www.w3.org/1999/xhtml">
<head>
<title>관리자</title>
<meta http-equiv="Content-Type" content="text/html; charset=utf-8" />
<meta http-equiv="X-UA-Compatible" content="IE=7" />
<meta http-equiv="imagetoolbar" content="no" />
<link href="/Bears/css/contents.css" rel="stylesheet" type="text/css" />
<script>
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
		clock = date.getFullYear() + "/" + (parseInt(date.getMonth()) + 1) + '/' + date.getDate() + '/' + date.getKorDay();
		time = date.getHours() + ':' + date.getMinutes() + ':' + date.getSeconds();
		document.getElementById("clock").innerHTML = "<font color=white> " + clock + "</font>";
		document.getElementById("time").innerHTML = "<font color=white> " + time + "</font>";
		var intervalID = function() {
			setInterval('datePro()', 1000);
		}
		intervalID();
	}

	function sendCheck() {
		var obj = document.frm; //form까지의 주소
		if (obj.query.name == 'empty' || !obj.data.value) {
			alert('Not Search!');
			obj.query.selectedIndex = 0;
			obj.data.value = '';
			obj.data.focus();
		} else {
			obj.submit();

		}

	}
</script>
</head>
<body onload="datePro()">
	<div id="wrapper">
		<div id="header">
			<div class="topInfoWrap">
				<div class="topInfoArea clfix">
					<div class="loginWrap">
						<span class="fir"> </span> 
						<span id="clock"></span> 
						<span id="time"></span> 
						<span><%=session.getAttribute("name") %>님<em> 
						</em> 좋은 하루 되세요</span> <a href="AdminLogout.jsp" class="btnLogout"> <img
							src="/Bears/img/common/btn_logout.gif" alt="로그아웃" /></a>
					</div>
				</div>
			</div>
			<div class="gnbSubWrap"></div>
		</div>
		<div id="container">
			<div id="contentsWrap" class="contentsWrap">
				<div class="contents">
					<h1 class="title">게시판 리스트</h1>
					<div class="btnSet clfix mgb15">
						<span class="fr"> <span class="button"><a
								href="editList.jsp">새로고침</a></span> <span class="button"><a
								href="javascript:sendCheck()">검색</a></span> <span class="button"><a
								href="edit.jsp">글쓰기</a></span>
						</span>
					</div>
					<form action="editList.jsp" name="frm">
						<table class="bbsWrite mgb35">
							<caption></caption>
							<colgroup>
								<col width="30" />
								<col width="150" />
								<col width="150" />
								<col width="150" />
								<col width="150" />
							</colgroup>
							<tbody>
								<tr>
									<th>검색</th>
									<td><select name="query">
											<option value="empty" selected="selected">선택하세요</option>
											<option value="writer">작성자</option>
											<option value="title">제목</option>
											<option value="contents">내용</option>
											<option value="id">내가쓴글</option>
									</select> <input type="text" name="data" class="inputText" size="30" /></td>
								</tr>
							</tbody>
						</table>
					</form>



					<table class="bbsList">

						<colgroup>
							<col width="30" />
							<col width="150" />
							<col width="150" />
							<col width="150" />
							<col width="150" />
							<col width="150" />
							<col width="150" />
						</colgroup>
						<thead>
							<tr>
								<th scope="col" class="fir">NO</th>
								<th scope="col">IMAGE</th>
								<th scope="col">WRITHER</th>
								<th scope="col">TITLE</th>
								<th scope="col">HIT</th>
								<th scope="col">REGDATE</th>
							</tr>
						</thead>
					
						<tr>
							<td></td>
							<td>
								<img ></img>
								
							</td>
							<td></td>
							<td></td>
							<td></td>
							<td></td>
						</tr>
					
						<tbody>

						</tbody>

					</table>

					<div class="paging">
						<a href="#"><img src="/Bears/img/button/btn_first.gif" alt="처음페이지" /></a>
						<a href="#"><img src="/Bears/img/button/btn_prev.gif" alt="이전" /></a>

						<span> <a href="#">1</a> <a href="#">2</a> <a href="#">3</a>
							<strong>4</strong> <a href="#">5</a> <a href="#">6</a> <a
							href="#">7</a> <a href="#">8</a> <a href="#">9</a>
						</span> <a href="#"><img src="/Bears/img/button/btn_next.gif" alt="다음" /></a>
						<a href="#"><img src="/Bears/img/button/btn_last.gif" alt="마지막페이지" /></a>

					</div>
				</div>
			</div>
		</div>
	</div>
</body>
</html>
<%@page import="food.vo.AdminVo"%>
<%@page import="java.util.HashMap"%>
<%@page import="java.util.List"%>
<%@ page language="java" contentType="text/html; charset=EUC-KR"
	pageEncoding="EUC-KR"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">
<html xmlns="http://www.w3.org/1999/xhtml">
<head>
<title>관리자-메인</title>
<meta http-equiv="Content-Type" content="text/html; charset=utf-8" />
<meta http-equiv="X-UA-Compatible" content="IE=7" />
<meta http-equiv="imagetoolbar" content="no" />
<link rel="stylesheet" href="/Bears/css/bootstrap.css" />
<style>

   /*월별 주문 건수 */
   #chartContainer{
      top: 120px;
      left: 350px;
      height: 350px; 
      width: 500px; 
      display: inline-block; 
      position: fixed;
   }
   
   /*올해 매출 추이 */
   #chartContainer2{
      top: 120px;
      left: 1100px;
      height: 350px; 
      width: 500px; 
      display: inline-block; 
      position: fixed;
   }
   
   /*일별 방문자 수 */
   #chartContainer3{
      top: 550px;
      left: 350px;
      height: 350px; 
      width: 500px; 
      display: inline-block; 
      position: fixed;
   }
   
   /*대표 음식별 년도별 주문 량*/
   #chartContainer4{
      top: 550px;
      left: 1100px;
      height: 350px; 
      width: 500px; 
      display: inline-block; 
      position: fixed;
   }
   
</style>
<script src="/Bears/js/canvasjs.min.js"></script>
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
	
	/* 그래프 */
	window.onload = function () {
	      
	      datePro();
	      
	      function renderMyChart(theDIVid, myData) {
	         var chart = new CanvasJS.Chart(theDIVid, {
	            data: [
	            {
	               type: "column",
	               dataPoints: myData
	            }
	            ]
	         });
	         chart.render();
	      }
	      
	      var dataPoints = [{ x: 10, y: 10 },{ x: 20, y: 15 },{ x: 30, y: 25 },{ x: 40, y: 30 },{ x: 50, y: 28 }];
	      
	      renderMyChart(chartContainer, dataPoints);
	      renderMyChart(chartContainer2, dataPoints);
	      renderMyChart(chartContainer3, dataPoints);
	      renderMyChart(chartContainer4, dataPoints);
	      
	      var chart = new CanvasJS.Chart("chartContainer", {
	         theme: "theme2",
	         title: {
	            text: "월별 주문 건수"
	         },
	         animationEnabled: true,
	         axisX: {
	            valueFormatString: "MMM",
	            interval: 1,
	            intervalType: "month"

	         },
	         axisY: {
	            includeZero: false

	         },
	         data: [{
	            type: "line",
	            //lineThickness: 3,
	            dataPoints: [
	            { x: new Date(2012, 00, 1), y: 450 },
	            { x: new Date(2012, 01, 1), y: 414 },
	            { x: new Date(2012, 02, 1), y: 520, indexLabel: "최고치", markerColor: "red", markerType: "triangle" },
	            { x: new Date(2012, 03, 1), y: 460 },
	            { x: new Date(2012, 04, 1), y: 450 },
	            { x: new Date(2012, 05, 1), y: 500 },
	            { x: new Date(2012, 06, 1), y: 480 },
	            { x: new Date(2012, 07, 1), y: 480 },
	            { x: new Date(2012, 08, 1), y: 410, indexLabel: "최저치", markerColor: "DarkSlateGrey", markerType: "cross" },
	            { x: new Date(2012, 09, 1), y: 500 },
	            { x: new Date(2012, 10, 1), y: 480 },
	            { x: new Date(2012, 11, 1), y: 510 }
	            ]
	         }
	         ]
	      });

	      chart.render();

	      var chart = new CanvasJS.Chart("chartContainer2", {
	         title: {
	            text: "올해 매출 추이"
	         },
	         theme: "theme2",
	         animationEnabled: true,
	         axisX: {
	            valueFormatString: "MMM"
	         },
	         axisY: {
	            valueFormatString: "#0억"
	         },
	         data: [{
	            type: "line",
	            dataPoints: [
	            { x: new Date(2012, 01, 1), y: 71, indexLabel: "흑자", markerType: "triangle", markerColor: "#6B8E23", markerSize: 12 },
	            { x: new Date(2012, 02, 1), y: 55, indexLabel: "적자", markerType: "cross", markerColor: "tomato", markerSize: 12 },
	            { x: new Date(2012, 03, 1), y: 50, indexLabel: "적자", markerType: "cross", markerColor: "tomato", markerSize: 12 },
	            { x: new Date(2012, 04, 1), y: 65, indexLabel: "흑자", markerType: "triangle", markerColor: "#6B8E23", markerSize: 12 },
	            { x: new Date(2012, 05, 1), y: 85, indexLabel: "흑자", markerType: "triangle", markerColor: "#6B8E23", markerSize: 12 },
	            { x: new Date(2012, 06, 1), y: 68, indexLabel: "적자", markerType: "cross", markerColor: "tomato", markerSize: 12 },
	            { x: new Date(2012, 07, 1), y: 28, indexLabel: "적자", markerType: "cross", markerColor: "tomato", markerSize: 12 },
	            { x: new Date(2012, 08, 1), y: 34, indexLabel: "흑자", markerType: "triangle", markerColor: "#6B8E23", markerSize: 12 },
	            { x: new Date(2012, 09, 1), y: 24, indexLabel: "적자", markerType: "cross", markerColor: "tomato", markerSize: 12 }
	            ]
	         }
	         ]
	      });

	      chart.render();

	      var chart = new CanvasJS.Chart("chartContainer3", {
	         title: {
	            text: "일별 방문자 수",
	         },
	         theme: "theme2",
	         animationEnabled: true,
	         axisX: {

	            gridColor: "Silver",
	            tickColor: "silver",
	            valueFormatString: "DD/MMM"

	         },
	         toolTip: {
	            shared: true
	         },
	         theme: "theme2",
	         axisY: {
	            gridColor: "Silver",
	            tickColor: "silver"
	         },
	         legend: {
	            verticalAlign: "bottom",
	            horizontalAlign: "center"
	         },
	         data: [{
	            type: "line",
	            showInLegend: true,
	            lineThickness: 2,
	            name: "실제 방문자 수",
	            markerType: "square",
	            color: "#F08080",
	            dataPoints: [
	            { x: new Date(2010, 0, 3), y: 650 },
	            { x: new Date(2010, 0, 5), y: 700 },
	            { x: new Date(2010, 0, 7), y: 710 },
	            { x: new Date(2010, 0, 9), y: 658 },
	            { x: new Date(2010, 0, 11), y: 734 },
	            { x: new Date(2010, 0, 13), y: 963 },
	            { x: new Date(2010, 0, 15), y: 847 },
	            { x: new Date(2010, 0, 17), y: 853 },
	            { x: new Date(2010, 0, 19), y: 869 },
	            { x: new Date(2010, 0, 21), y: 943 },
	            { x: new Date(2010, 0, 23), y: 970 }
	            ]
	         },
	         {
	            type: "line",
	            showInLegend: true,
	            name: "고정 방문자 수",
	            color: "#20B2AA",
	            lineThickness: 2,

	            dataPoints: [
	            { x: new Date(2010, 0, 3), y: 510 },
	            { x: new Date(2010, 0, 5), y: 560 },
	            { x: new Date(2010, 0, 7), y: 540 },
	            { x: new Date(2010, 0, 9), y: 558 },
	            { x: new Date(2010, 0, 11), y: 544 },
	            { x: new Date(2010, 0, 13), y: 693 },
	            { x: new Date(2010, 0, 15), y: 657 },
	            { x: new Date(2010, 0, 17), y: 663 },
	            { x: new Date(2010, 0, 19), y: 639 },
	            { x: new Date(2010, 0, 21), y: 673 },
	            { x: new Date(2010, 0, 23), y: 660 }
	            ]
	         }
	         ],
	      });

	      chart.render();

	      var chart = new CanvasJS.Chart("chartContainer4", {
	         zoomEnabled: false,
	         animationEnabled: true,
	         title: {
	            text: "대표 음식별 년도별 주문 량"
	         },
	         axisY2: {
	            valueFormatString: "0.0 (만)건",

	            maximum: 1.2,
	            interval: 0.2,
	            interlacedColor: "#F5F5F5",
	            gridColor: "#D7D7D7",
	            tickColor: "#D7D7D7"
	         },
	         theme: "theme2",
	         toolTip: {
	            shared: true
	         },
	         legend: {
	            verticalAlign: "bottom",
	            horizontalAlign: "center",
	            fontSize: 15,
	            fontFamily: "Lucida Sans Unicode"
	         },
	         data: [{
	            type: "line",
	            lineThickness: 3,
	            axisYType: "secondary",
	            showInLegend: true,
	            name: "치킨",
	            dataPoints: [
	            { x: new Date(2001, 0), y: 0 },
	            { x: new Date(2002, 0), y: 0.001 },
	            { x: new Date(2003, 0), y: 0.01 },
	            { x: new Date(2004, 0), y: 0.05 },
	            { x: new Date(2005, 0), y: 0.1 },
	            { x: new Date(2006, 0), y: 0.15 },
	            { x: new Date(2007, 0), y: 0.22 },
	            { x: new Date(2008, 0), y: 0.38 },
	            { x: new Date(2009, 0), y: 0.56 },
	            { x: new Date(2010, 0), y: 0.77 },
	            { x: new Date(2011, 0), y: 0.91 },
	            { x: new Date(2012, 0), y: 0.94 }
	            ]
	         },
	         {
	            type: "line",
	            lineThickness: 3,
	            showInLegend: true,
	            name: "피자",
	            axisYType: "secondary",
	            dataPoints: [
	            { x: new Date(2001, 00), y: 0.18 },
	            { x: new Date(2002, 00), y: 0.2 },
	            { x: new Date(2003, 0), y: 0.25 },
	            { x: new Date(2004, 0), y: 0.35 },
	            { x: new Date(2005, 0), y: 0.42 },
	            { x: new Date(2006, 0), y: 0.5 },
	            { x: new Date(2007, 0), y: 0.58 },
	            { x: new Date(2008, 0), y: 0.67 },
	            { x: new Date(2009, 0), y: 0.78 },
	            { x: new Date(2010, 0), y: 0.88 },
	            { x: new Date(2011, 0), y: 0.98 },
	            { x: new Date(2012, 0), y: 1.04 }
	            ]
	         },
	         {
	            type: "line",
	            lineThickness: 3,
	            showInLegend: true,
	            name: "떡볶이",
	            axisYType: "secondary",
	            dataPoints: [
	            { x: new Date(2001, 00), y: 0.16 },
	            { x: new Date(2002, 0), y: 0.17 },
	            { x: new Date(2003, 0), y: 0.18 },
	            { x: new Date(2004, 0), y: 0.19 },
	            { x: new Date(2005, 0), y: 0.20 },
	            { x: new Date(2006, 0), y: 0.23 },
	            { x: new Date(2007, 0), y: 0.261 },
	            { x: new Date(2008, 0), y: 0.289 },
	            { x: new Date(2009, 0), y: 0.3 },
	            { x: new Date(2010, 0), y: 0.31 },
	            { x: new Date(2011, 0), y: 0.32 },
	            { x: new Date(2012, 0), y: 0.33 }
	            ]
	         }
	         ],
	         legend: {
	            cursor: "pointer",
	            itemclick: function (e) {
	               if (typeof (e.dataSeries.visible) === "undefined" || e.dataSeries.visible) {
	                  e.dataSeries.visible = false;
	               }
	               else {
	                  e.dataSeries.visible = true;
	               }
	               chart.render();
	            }
	         }
	      });

	      chart.render();
	   }

</script>
</head>
<body>
	<!-- Top 메뉴 -->
<jsp:include page="include/top.jsp" />
	
	<!-- 그래프 -->
	<div id="chartContainer"></div>
	<div id="chartContainer2"></div>
	<div id="chartContainer3"></div>
	<div id="chartContainer4"></div>
</body>
</html>
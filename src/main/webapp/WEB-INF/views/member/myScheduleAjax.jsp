<%@page import="com.tlab.mvc.member.model.service.MemberService"%>
<%@page import="com.tlab.mvc.member.model.vo.Member"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%
String msg = (String) session.getAttribute("msg");
if (msg != null)
	session.removeAttribute("msg");
Member loginMember = (Member) session.getAttribute("loginMember");
//쿠키처리
Cookie[] cookies = request.getCookies();
String saveMemberId = null;
if (cookies != null) {
	for (Cookie cookie : cookies) {
		String name = cookie.getName();
		String value = cookie.getValue();
		System.out.println(name + " = " + value);
		if ("saveId".equals(name)) {
	saveMemberId = value;
		}
	}
}
System.out.println("saveMemberId@header.jsp = " + saveMemberId);
%>

<!DOCTYPE html>
<html>
<head>
<title>mySchedule</title>
<meta charset="UTF-8">
<meta name="viewport" content="width=device-width, initial-scale=1">
<link rel="stylesheet"
	href="//code.jquery.com/ui/1.13.0/themes/base/jquery-ui.css">
<!-- <link rel="stylesheet" href="/css/mySchedule.css"> -->
<style>
* {
	box-sizing: border-box;
}

.p-explain {
	color: #6b645e;
	font-family: 'BBTreeGL';
}

@font-face {
	font-family: 'BBTreeGL';
	src:
		url('https://cdn.jsdelivr.net/gh/projectnoonnu/noonfonts_nine_@1.1/BBTreeGL.woff')
		format('woff');
	font-weight: normal;
	font-style: normal;
}

h2, h5 {
	color: #625E5D;
	font-family: 'BBTreeGL';
}
/* Style the body */
body {
	font-family: Arial;
	margin: 0;
}
/* schedule container box */
.column {
	width: 170px;
	float: left;
	padding-bottom: 100px;
}

.portlet {
	margin: 0 1em 1em 0;
	padding: 0.3em;
}

.portlet-header {
	padding: 0.2em 0.3em;
	margin-bottom: 0.5em;
	position: relative;
}

.portlet-toggle {
	position: absolute;
	top: 50%;
	right: 0;
	margin-top: -8px;
}

.portlet-content {
	padding: 0.4em;
	padding-left: 0.6em;
}

.portlet-placeholder {
	border: 1px dotted black;
	margin: 0 1em 1em 0;
	height: 50px;
}

.day1, .day2, .day3 {
	padding-left: 20px;
	width: 200px;
}
/* Header/logo Title */
.header {
	padding: 60px;
	text-align: center;
	background: #F8F3F2;
	color: #D1CBCA;
}

/* Style the top navigation bar */
.navbar {
	display: flex;
	background-color: rgb(253, 253, 253);
	justify-content: flex-end;
	align-items: center;
}

/* Style the navigation bar links */
.navbar a {
	color: black;
	padding: 14px 20px;
	text-decoration: none;
	text-align: center;
}
/*sub-link decoration*/
.sub-link1 {
	text-decoration: none;
	color: #D1CBCA;
	font-family: sans-serif;
	font-size: 40px;
	font-weight: 800;
}

h3 {
	text-decoration: none;
	color: #D1CBCA;
	font-family: sans-serif;
}

.sub-link2 {
	text-decoration: none;
	color: #A18F7F;
}

.sub-explain {
	font-family: 'Brush Script MT', cursive;
	font-size: 30px;
	letter-spacing: 2px;
}

/*main-container*/
.w3-container:after, .w3-container:before, .w3-panel:after, .w3-panel:before,
	.w3-row:after, .w3-row:before, .w3-row-padding:after, .w3-row-padding:before,
	.w3-cell-row:before, .w3-cell-row:after, .w3-clear:after, .w3-clear:before,
	.w3-bar:before, .w3-bar:after {
	content: "";
	display: table;
	clear: both;
}

.w3-container, .w3-panel {
	padding: 0.01em 16px;
	width: 400px;
}

.w3-col, .w3-half, .w3-third, .w3-twothird, .w3-threequarter,
	.w3-quarter {
	float: left;
	width: 400px;
	width: 100%;
}

.w3-col.m4, .w3-third {
	/* width: 25%; */
	width: 25%;
}

.w3-row-padding>.w3-third {
	padding: 0 8px;
}

.w3-margin-bottom {
	margin-bottom: 16px !important;
}

.w3-row-padding, .w3-row-padding>.w3-half, .w3-row-padding>.w3-third,
	.w3-row-padding>.w3-twothird, .w3-row-padding>.w3-threequarter,
	.w3-row-padding>.w3-quarter, .w3-row-padding>.w3-col {
	padding: 0 8px;
}
/*img controll*/
img {
	border-style: none;
}

img {
	vertical-align: middle;
}

.w3-hover-opacity {
	height: 300px;
	border-radius: 1px;
	box-shadow: 0 8px 16px 0 rgba(0, 0, 0, 0.2), 0 6px 20px 0
		rgba(0, 0, 0, 0.19);
}

.w3-opacity, .w3-hover-opacity:hover {
	opacity: 0.6;
}

.w3-opacity-off, .w3-hover-opacity-off:hover {
	opacity: 1;
}

/*Page Bar*/
.w3-bar .w3-bar-item {
	padding: 8px 16px;
	float: left;
	width: auto;
	border: none;
	display: block;
	outline: 0;
}

.more {
	text-align: right;
}

/* Change color on hover */
.navbar a:hover {
	background-color: #ddd;
	color: black;
}

/* Column container */
.row {
	display: flex;
	flex-wrap: wrap;
}

/* Create two unequal columns that sits next to each other */
/* Sidebar/left column */
.side {
	flex: 2%;
	background-color: #f1f1f1;
	padding: 20px;
}

/* Main column */
.main {
	flex: 70%;
	background-color: white;
	padding: 20px;
}

/* sideBarTag, just for this example */
.sideBarTag {
	background-color: white;
	width: 12vw;
	padding: 20px;
	vertical-align: middle;
}

.box {
	width: 150px;
	height: 150px;
	border-radius: 70%;
	overflow: hidden;
}

.sideBarTag {
	box-shadow: 0 8px 16px 0 rgba(0, 0, 0, 0.2), 0 6px 20px 0
		rgba(0, 0, 0, 0.19);
}

.sideBarTag:hover {
	background-color: #c7c7c7;
	box-shadow: 0 8px 16px 0 rgba(0, 0, 0, 0.2), 0 6px 20px 0
		rgba(0, 0, 0, 0.19);
}

.side-button {
	display: inline-block;
	border-radius: 4px;
	background-color: #c7c7c7;
	border: none;
	color: #FFFFFF;
	text-align: center;
	font-size: 28px;
	padding: 20px;
	width: 240px;
	transition: all 0.5s;
	cursor: pointer;
	margin: 5px;
}

.side-button span {
	cursor: pointer;
	display: inline-block;
	position: relative;
	transition: 0.5s;
}

.side-button span:after {
	content: '\00bb';
	position: absolute;
	opacity: 0;
	top: 0;
	right: -20px;
	transition: 0.5s;
}

.side-button:hover span {
	padding-right: 25px;
}

.side-button:hover span:after {
	opacity: 1;
	right: 0;
}

.profile-img {
	width: 150px;
	height: 150px;
	border-radius: 70%;
	overflow: hidden;
	margin-left: auto;
	margin-right: auto;
	background-color: #FFFFFF;
}

.profile {
	width: 100%;
	height: 100%;
	object-fit: cover;
	vertical-align: middle;
}

/* Responsive layout - when the screen is less than 700px wide, make the two columns stack on top of each other instead of next to each other */
@media screen and (max-width: 700px) {
	.row, .navbar {
		flex-direction: column;
	}
}
</style>
<script src="https://code.jquery.com/jquery-3.6.0.js"></script>
<script src="https://code.jquery.com/ui/1.13.0/jquery-ui.js"></script>
<script>
	$(function() {
		$(".column").sortable({
			connectWith : ".column",
			handle : ".portlet-header",
			cancel : ".portlet-toggle",
			placeholder : "portlet-placeholder ui-corner-all"
		});

		$(".portlet")
				.addClass(
						"ui-widget ui-widget-content ui-helper-clearfix ui-corner-all")
				.find(".portlet-header")
				.addClass("ui-widget-header ui-corner-all")
				.prepend(
						"<span class='ui-icon ui-icon-minusthick portlet-toggle'></span>");

		$(".portlet-toggle").on("click", function() {
			var icon = $(this);
			icon.toggleClass("ui-icon-minusthick ui-icon-plusthick");
			icon.closest(".portlet").find(".portlet-content").toggle();
		});
	});
</script>

</head>
<body>

	<!-- Note -->


	<!-- Header -->
	<div class="header">
		<h1>
			<a class="sub-link1"
				href="<%=request.getContextPath()%>/member/myPage">My DashBoard</a>
		</h1>
		<p class="sub-explain">
			enjoy your <b>Journey</b> with us
		</p>
	</div>

	<!-- Navigation Bar -->

	<div class="navbar">
		<a href="<%=request.getContextPath()%>/" class="p-explain"><b>홈으로</b></a>
		<%-- <a href="<%= request.getContextPath()%>/member/myCartList" class="p-explain">카트보기</a> --%>
		<a href="#" class="p-explain"><b>카트보기</b></a>
		<%--  <a href="<%= request.getContextPath()%>/member/myInfo" class="p-explain">내정보</a> --%>
		<a href="<%=request.getContextPath()%>/member/myInfo"
			class="p-explain"><b>내정보</b></a>
		<%-- <a href="<%= request.getContextPath()%>/member/myScheduleList" class="p-explain">일정</a> --%>
		<a href="<%=request.getContextPath()%>/member/mySchedule"
			class="p-explain"><b>일정</b></a>
	</div>

	<!-- The flexible grid (content) -->
	<div class="row">
		<div class="side">
			<h2 align="center">
				<a class="sub-link2" href="<%=request.getContextPath()%>/">TravelLab</a>
			</h2>
			<div class="profile-img" align="center">
				<img class="profile"
					src="https://api.cdn.visitjeju.net/photomng/thumbnailpath/202110/21/40916b0e-7ce7-4c3f-8ad1-59aeef46d4c6.png" />
			</div>

			<h3 align="center">Profile</h3>
			<p align="center" class="p-explain"><%=loginMember.getMemberName()%>님
			</p>
			<p align="center" class="p-explain">안녕하세요</p>
			<!-- <p>그린델왈드의 숨겨진 모래시계</p> -->
			<button class="side-button" style="vertical-align: middle"
				onclick="location.href='<%=request.getContextPath()%>/member/mySchedule';">
				<span>Schedule</span>
			</button>
			<button class="side-button" style="vertical-align: middle"
				onclick="location.href='<%=request.getContextPath()%>/member/myWishList';">
				<span>WishList</span>
			</button>
			<button class="side-button" style="vertical-align: middle">
				<span>Scrap List</span>
			</button>
			<button class="side-button" style="vertical-align: middle"
				onclick="location.href='<%=request.getContextPath()%>/member/myInfo';">
				<span>Infomation</span>
			</button>
			<button class="side-button" style="vertical-align: middle">
				<span>Lab</span>
			</button>
			<!-- <button class="sideBarTag" style="height:60px;">My Routine</button><br>
    <button class="sideBarTag" style="height:60px;">My Scrap Board</button><br>
    <button class="sideBarTag" style="height:60px;">Update Infomation</button><br>
    <button class="sideBarTag" style="height:60px;">Lab</button><br>
    <button class="sideBarTag" style="height:60px;">My Interest</button> -->
		</div>
		<div class="main">
			<div class="column day1" name="dayList1" id="dayList1">
				<h2>01.11</h2>
				<div class="portlet ">
					<%-- <div class="portlet-header"><%=map.getKey%></div> --%>
					<div class="portlet-header">
						<p class="p-explain">성산일출봉</p>
					</div>
					<div class="portlet-content">
						<%-- <input type="text" value="<%=map.getValue("성산일출봉")%>"> --%>
						<p class="p-explain">5:00am</p>
						<span class="p-explain"> <br> 제주도 일출맞이 <br>
						</span>
					</div>
				</div>

				<div class="portlet">
					<div class="portlet-header">
						<p class="p-explain">오설록 티뮤지엄</p>
					</div>
					<div class="portlet-content">
						<p class="p-explain">10:30am 🍃</p>
						<span class="p-explain"> <br> 힐링시작
						</span>
					</div>
				</div>

				<div class="portlet">
					<div class="portlet-header">
						<p class="p-explain">올래국수</p>
					</div>
					<div class="portlet-content">
						<p class="p-explain">1:00pm</p>
						<span class="p-explain"> <br> 맛집 탐방시작 1/4
						</span>
					</div>
				</div>


				<div class="portlet">
					<div class="portlet-header">
						<p class="p-explain">몽상드애월</p>
					</div>
					<div class="portlet-content">
						<p class="p-explain">4:00pm 🍮</p>
						<span class="p-explain"> <br> 카페 on 제주 <br>
						</span>
					</div>
				</div>

			</div>

			<div class="column day2" name="dayList2" id="dayList2">
				<h2>01.12</h2>
				<div class="portlet">
					<div class="portlet-header">
						<p class="p-explain">사려니숲길</p>
					</div>
					<div class="portlet-content">
						<p class="p-explain">11:00am</p>
						<span class="p-explain"><br>힐링숲</span>
					</div>
				</div>

				<div class="portlet">
					<div class="portlet-header">
						<p class="p-explain">우진해장국</p>
					</div>
					<div class="portlet-content">
						<p class="p-explain">1:30pm 🥧</p>
						<span class="p-explain"> <br> 해장줄서기 2/4 <br></span>
					</div>
				</div>

				<div class="portlet">
					<div class="portlet-header">
						<p class="p-explain">세화해변</p>
					</div>
					<div class="portlet-content">
						<p class="p-explain">2:30pm</p>
						<span class="p-explain"> <br> 인생샷 <br></span>
					</div>
				</div>

				<div class="portlet">
					<div class="portlet-header">
						<p class="p-explain">리치망고</p>
					</div>
					<div class="portlet-content">
						<p class="p-explain">-:-pm 🍷</p>
						<span class="p-explain"> <br> 맹고주스 3/4<br></span>
					</div>
				</div>
				<div class="portlet">
					<div class="portlet-header">
						<p class="p-explain">레일바이크</p>
					</div>
					<div class="portlet-content">
						<p class="p-explain">4:00pm</p>
						<span class="p-explain"> <br> 힐링기차<br></span>
					</div>
				</div>


			</div>

			<div class="column day3" name="dayList3" id="dayList3">
				<h2>01.13</h2>
				<div class="portlet">
					<div class="portlet-header">
						<p class="p-explain">주상절리대</p>
					</div>
					<div class="portlet-content">
						<p class="p-explain">10:00am</p>
						<span class="p-explain"> <br> 화산지형<br></span>
					</div>
				</div>

				<div class="portlet">
					<div class="portlet-header">
						<p class="p-explain">제주패러글라이딩</p>
					</div>
					<div class="portlet-content">
						<p class="p-explain">11:00am 🐤</p>
						<span class="p-explain"> <br> 액티비티 <br></span>
					</div>
				</div>
				<div class="portlet">
					<div class="portlet-header">
						<p class="p-explain">만복이네김밥집</p>
					</div>
					<div class="portlet-content">
						<p class="p-explain">12:30pm</p>
						<span class="p-explain"> <br> 맛집! 4/4 <br></span>
					</div>
				</div>

				<div class="portlet">
					<div class="portlet-header">
						<p class="p-explain">서귀포 잠수함</p>
					</div>
					<div class="portlet-content">
						<p class="p-explain">2:00pm</p>
						<span class="p-explain"> <br> 바다속체험 <br></span>
					</div>
				</div>
				<div class="portlet">
					<div class="portlet-header">
						<p class="p-explain">협재해수욕장</p>
					</div>
					<div class="portlet-content">
						<p class="p-explain">4:00pm</p>
						<span class="p-explain"> <br> 안녕제주 <br></span>
					</div>
				</div>
			</div>
		</div>
	</div>
	<script>
	const day1List = $(".day1").find(".portlet-header p").text();
	console.log(day1List);
		
	$('.portlet-header').mouseup((e)=> {	
		let $dayList1 = $(".day1").find(".portlet-header p.p-explain");
		console.log($dayList1); 
		
		$dayList1.each ((i,element)=>{
			var $element = $(element).text();
			/* console.log($element); */
		}); 
		
		let $dayList2 = $(".day2").find(".portlet-header p");
		console.log($dayList2);
		$dayList2.each ((i,element)=>{
			var $element = $(element).text();
			/* console.log($element); */
		}); 
		
		let $dayList3 = $(".day3").find(".portlet-header p");
		console.log($dayList3);
		$dayList3.each ((i,element)=>{
			var $element = $(element).text();
			/* console.log($element); */
		});
		
		const $memberId = "<%=loginMember.getMemberId()%>";
		console.log($memberId);
	});	
		 <%-- $.ajax ({
			url :"<%=request.getContextPath()%>/schedule/myScheduleUpdate",
			type:"post",
			data:{
					memberId: memberId
					day1: dayList1,
					day2: dayList2,
					day3: dayList3
				}
			dataType:'json',
			success(data){
				console.log(data);
			}
			error: () => {
				return false;
			}		
		});  --%>	
		</script>
</body>

</html>



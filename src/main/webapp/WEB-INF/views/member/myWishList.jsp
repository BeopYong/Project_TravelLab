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
<html lang="en">
<head>
<meta charset="utf-8" />
<meta http-equiv="X-UA-Compatible" content="IE=edge">
<meta name="viewport"
	content="width=device-width, initial-scale=1.0, maximum-scale=1.0">

<link rel="stylesheet" type="text/css"
	href="<%=request.getContextPath()%>/css/myPage.css" />
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
	width: 300px;
	/* width: 100%; */
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

<title>MyPage</title>
<meta name="author" content="jimmer" />
<script src="<%=request.getContextPath()%>/js/jquery-3.6.0.js"></script>
<script>
$(() => {

<%if (msg != null) {%>	

	alert("<%=msg%>");
	
<%}%> 
</script>
</head>

<div class="header">
	<h1>
		<a class="sub-link1"
			href="<%=request.getContextPath()%>/member/myPage">My DashBoard</a>
	</h1>
	<p class="sub-explain">
		enjoy your <b>Journey</b> with us
	</p>
</div>
<div class="navbar">
	<a href="<%=request.getContextPath()%>/" class="p-explain"><b>홈으로</b></a>
	<%-- <a href="<%= request.getContextPath()%>/member/myCartList" class="p-explain">카트보기</a> --%>
	<a href="#" class="p-explain"><b>카트보기</b></a>
	<%--  <a href="<%= request.getContextPath()%>/member/myInfo" class="p-explain">내정보</a> --%>
	<a href="<%=request.getContextPath()%>/member/myInfo" class="p-explain"><b>내정보</b></a>
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
		<p align="center" class="p-explain">
			<b><%=loginMember.getMemberName()%>님</b>
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
		<h2>여행지 찜목록</h2>
		<h5>최근추가날짜, Dec 7, 2021</h5>
		<br>
		<!-- First Photo Grid-->
		<div class="w3-row-padding">
			<div class="w3-third w3-container w3-margin-bottom">
				<img
					src="https://api.cdn.visitjeju.net/photomng/thumbnailpath/202110/20/99fd2f85-ed17-4184-966d-f81cd5eabf31.jpg"
					alt="협재해수욕장" style="width: 100%;" class="w3-hover-opacity">
				<div class="w3-container w3-white">
					<p class="p-explain">
						<b>협재해수욕장</b>
					</p>
					<p class="p-explain">
						에머랄드 빛 바다를 품은 올레 14코스 <br> <br> #협재 #비양도 #올레14코스
					</p>
				</div>
			</div>
			<div class="w3-third w3-container">
				<img
					src="https://api.cdn.visitjeju.net/photomng/thumbnailpath/201804/30/28506c6b-cbb7-476a-a0f1-94fa3dfc78be.jpg"
					alt="노루생태관찰원" style="width: 100%;" class="w3-hover-opacity">
				<div class="w3-container w3-white">
					<p class="p-explain">
						<b>세화해변</b>
					</p>
					<p class="p-explain">
						인생 사진찍기로 유명한 해변 <br> <br>#힐링 #포토스팟 #올레20코스
					</p>
				</div>
			</div>
			<div class="w3-third w3-container">
				<img
					src="https://api.cdn.visitjeju.net/photomng/thumbnailpath/201908/29/5e753684-1bfd-4a01-bd60-61d10df8b14b.jpg"
					alt="섭지코지" style="width: 100%;" class="w3-hover-opacity">
				<div class="w3-container w3-white">
					<p class="p-explain">
						<b>섭지코지</b>
					</p>
					<p class="p-explain">
						성산일출봉을 배경으로 한 해안풍경 <br> <br>#일출 #선돌바위 #제주조랑말
					</p>
				</div>
			</div>

			<div class="w3-third w3-container w3-margin-bottom">
				<img
					src="https://api.cdn.visitjeju.net/photomng/thumbnailpath/201804/30/c9c42359-f82f-43a4-919e-03ecd197a2eb.jpg"
					alt="사려니숲길" style="width: 100%;" class="w3-hover-opacity">
				<div class="w3-container w3-white">
					<p class="p-explain">
						<b>사려니숲길</b>
					</p>
					<p class="p-explain">
						제주 숨은 비경 31<br> <br>#삼나무 #사려니오름 #붉은오름
					</p>
				</div>
			</div>
		</div>
		<div class="more" class="p-explain">
			<a href="">더보기</a>
		</div>

		<!-- Second Photo Grid-->
		<div class="w3-row-padding">
			<h2>맛집 찜목록</h2>
			<h5>최근 추가날짜 Sep 2, 2021</h5>
			<div class="w3-third w3-container w3-margin-bottom">
				<img
					src="https://api.cdn.visitjeju.net/photomng/thumbnailpath/201804/30/d2d25247-94ef-483d-85dc-abf7cc8f0693.jpg"
					alt="국수바다 본점" style="width: 100%;" class="w3-hover-opacity">
				<div class="w3-container w3-white">
					<p class="p-explain">
						<b>국수의전설</b>
					</p>
					<p class="p-explain">
						서귀포시 신효동 위치한 국수 전문점 <br> <br>#전설칼국수 #보말칼국수 #문어비빔국수
					</p>
				</div>
			</div>
			<div class="w3-third w3-container w3-margin-bottom">
				<img
					src="https://api.cdn.visitjeju.net/photomng/thumbnailpath/202111/05/162cf069-1d8b-460b-ae84-d639a78e8de0.jpg"
					alt="협재해녀의 집" style="width: 100%;" class="w3-hover-opacity">
				<div class="w3-container w3-white">
					<p class="p-explain">
						<b>협재해녀의 집</b>
					</p>
					<p class="p-explain">
						해녀가 직접 잡아온 해산물로 요리하는집<br> <br>#해물라면 #해산물 조림 #해산물 구이
						#해물뚝배기
					</p>
				</div>
			</div>
			<div class="w3-third w3-container w3-margin-bottom">
				<img
					src="https://api.cdn.visitjeju.net/photomng/thumbnailpath/201804/30/58008d96-a5b2-4bd0-a392-0e753b33267b.gif"
					alt="명진전복" style="width: 100%;" class="w3-hover-opacity">
				<div class="w3-container w3-white">
					<p class="p-explain">
						<b>명진전복</b>
					</p>
					<p class="p-explain">
						Korea Jeju Top10선정 맛집 <br> <br>#제주 #전복돌솥밥 #전복구이 #전복죽 #전복
						끝판왕
					</p>
				</div>
			</div>
			<div class="w3-third w3-container w3-margin-bottom">
				<img
					src="https://api.cdn.visitjeju.net/photomng/thumbnailpath/201804/30/f00e4b0c-7820-4c23-8921-b946eaca8bfb.jpg"
					alt="애월더선셋" style="width: 100%" class="w3-hover-opacity">
				<div class="w3-container w3-white">
					<p class="p-explain">
						<b>애월더선셋</b>
					</p>
					<p class="p-explain">
						애월해안 한담산책로 위 전망좋은 카페 <br>
						<br>#카페 #커피 #브런치
					</p>
				</div>
			</div>
			<div class="more" class="p-explain">
				<a href="">더보기</a>
			</div>
		</div>


		<!-- Third Photo Grid-->
		<div class="w3-row-padding">
			<h2>액티비티 찜목록</h2>
			<h5>최근 추가날짜 Sep 4, 2021</h5>
			<div class="w3-third w3-container w3-margin-bottom">
				<img
					src="https://api.cdn.visitjeju.net/photomng/thumbnailpath/202004/22/4a1d9403-b21a-4d98-8a79-dec44bc891f4.jpg"
					alt="요트투어" style="width: 100%;" class="w3-hover-opacity">
				<div class="w3-container w3-white">
					<p class="p-explain">
						<b>퍼시픽요트투어</b>
					</p>
					<p class="p-explain">
						돌고래와 함께하는 <br> <br>#요트투어 #보말칼국수 #문어비빔국수
					</p>
				</div>
			</div>
			<div class="w3-third w3-container w3-margin-bottom">
				<img
					src="https://api.cdn.visitjeju.net/photomng/thumbnailpath/201804/30/9ec88164-7890-43e2-a1d2-e9bbbd6ccf43.jpg"
					alt="아날로그 감귤밭" style="width: 100%;" class="w3-hover-opacity">
				<div class="w3-container w3-white">
					<p class="p-explain">
						<b>아날로그 감귤밭 </b>
					</p>
					<p class="p-explain">
						아날로그 감귤밭<br> <br>#체험관광 #감귤농장
					</p>
				</div>
			</div>
			<div class="w3-third w3-container w3-margin-bottom">
				<img
					src="https://api.cdn.visitjeju.net/photomng/thumbnailpath/202111/04/dbc89eb5-76d3-492c-b2ce-0d75eb36dd09.jpg"
					alt="레일바이크" style="width: 100%;" class="w3-hover-opacity">
				<div class="w3-container w3-white">
					<p class="p-explain">
						<b>레일바이크</b>
					</p>
					<p class="p-explain">
						전기레일바이크 힐링투어 <br> <br>#포토존 #액티비티
					</p>
				</div>
			</div>
			<div class="w3-third w3-container w3-margin-bottom">
				<img
					src="https://api.cdn.visitjeju.net/photomng/thumbnailpath/201804/30/1068e7da-0b15-46ed-94bb-aeed023d73f9.jpg"
					alt="우도잠수함" style="width: 100%;" class="w3-hover-opacity">
				<div class="w3-container w3-white">
					<p class="p-explain">
						<b>우도잠수함</b>
					</p>
					<p class="p-explain">
						제주바닷속 탐험 <br> <br> #우도 #잠수함 #액티비티
					</p>
				</div>
			</div>
			<div class="more" class="p-explain">
				<a href="">더보기</a>
			</div>
		</div>

	</div>
	</body>
</html>
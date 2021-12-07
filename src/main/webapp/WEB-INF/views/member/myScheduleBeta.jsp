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
<link rel="stylesheet"
	href="//code.jquery.com/ui/1.13.0/themes/base/jquery-ui.css">
<%-- <link rel="stylesheet" type="text/css" 
	href="<%=request.getContextPath()%>/css/mySchedule.css"/> --%>
<style>
  body {
    min-width: 520px;
  }
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

  @font-face {
    font-family: 'BBTreeGL';
    src: url('https://cdn.jsdelivr.net/gh/projectnoonnu/noonfonts_nine_@1.1/BBTreeGL.woff') format('woff');
    font-weight: normal;
    font-style: normal;
}
html {
    font-family: 'BBTreeGL'
}
.p-explain {
    font-family: 'BBTreeGL';
    margin-bottom:2px;
    margin-top: 5px;
}
  </style>
  <script src="https://code.jquery.com/jquery-3.6.0.js"></script>
  <script src="https://code.jquery.com/ui/1.13.0/jquery-ui.js"></script>
  <script>
  $( function() {
    $( ".column" ).sortable({
      connectWith: ".column",
      handle: ".portlet-header",
      cancel: ".portlet-toggle",
      placeholder: "portlet-placeholder ui-corner-all"
    });
 
    $( ".portlet" )
      .addClass( "ui-widget ui-widget-content ui-helper-clearfix ui-corner-all" )
      .find( ".portlet-header" )
        .addClass( "ui-widget-header ui-corner-all" )
        .prepend( "<span class='ui-icon ui-icon-minusthick portlet-toggle'></span>");
 
    $( ".portlet-toggle" ).on( "click", function() {
      var icon = $( this );
      icon.toggleClass( "ui-icon-minusthick ui-icon-plusthick" );
      icon.closest( ".portlet" ).find( ".portlet-content" ).toggle();
    });
  } );
  </script>	
<title>MySchedule</title>
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
	<a href="#"><b>카트보기</b></a>
	<%--  <a href="<%= request.getContextPath()%>/member/myInfo" class="p-explain">내정보</a> --%>
	<a href="<%=request.getContextPath()%>/member/myInfo"
		class="p-explain"><b>내정보</b></a>
	<%-- <a href="<%= request.getContextPath()%>/member/myScheduleList" class="p-explain">일정</a> --%>
	<a href="#"><b>일정</b></a>
</div>

<!-- The flexible grid (content) -->
<div class="row">
	<div class="side">
		<h2 align="center">
			<a class="sub-link2" href="<%=request.getContextPath()%>/">TravelLab</a>
		</h2>
		<div class="profile-img" align="center">
			<img class="profile"
				src="https://uc3474b5f2efa50ce5bc40635c2e.previews.dropboxusercontent.com/p/thumb/ABWhhtXoYkZhe_KZFq8u8eZ9c5tYbKs41FFy53UZVXyZY6A3oIdgSbYzRRh7KXBTqAMTrZscteSmJN6HUUYZaqHKWw4MWKNsnkfBsQPts_x1l4kIA2xa7xKE9exsrWcqwcJB5BTUqkEQAB73p8TCzcc062tBhMk0QjfCgn41UADbLpnktQrgHX9tiaeFhzST3A8wbaR913fe4hmJBOrqXk_HAQ3OORiSlh_A-wKUOmNXTJ6YzrKfHcrR6Vhhp2TN1ZONkz_SROni2VigD-pZOj27QSqerEKaa2HdkOYGS-C0KfWXNAJrJMaJPzM-9TFoRm4Yb6lgBSl7Dd-5gjK4WWTSspqaJ9puEehu-Gr8WAoJLKHYEp8xV0fhWe52Ei45CSA/p.png" />
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
		<div class="column day1" name="dayList1" id="dayList1">
			<h2>01.11</h2>
			<div class="portlet ">
				<%-- <div class="portlet-header"><%=map.getKey%></div>  --%>
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

		<div class="column day2 " name="dayList2" id="dayList2">
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
					<span class="p-explain"> <br> 화산지형 <br></span>
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
	</body>
</html>
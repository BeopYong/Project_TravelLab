<%@page import="com.tlab.mvc.member.model.service.MemberService"%>
<%@page import="com.tlab.mvc.member.model.vo.Member"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%
	String msg = (String) session.getAttribute("msg");
	if(msg != null) session.removeAttribute("msg");
	Member loginMember = (Member) session.getAttribute("loginMember");
	//쿠키처리
	Cookie[] cookies = request.getCookies();
	String saveMemberId = null;
	if(cookies != null){
		for(Cookie cookie : cookies){
			String name = cookie.getName();
			String value = cookie.getValue();
			System.out.println(name + " = " + value);
			if("saveId".equals(name)){
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
  <meta name="viewport" content="width=device-width, initial-scale=1.0, maximum-scale=1.0">
  <link rel="stylesheet" type="text/css" href="<%=request.getContextPath() %>/css/myPage.css"/>
  <title>MyPage</title>
  <meta name="author" content="jimmer"/>
  <script src="<%=request.getContextPath() %>/js/jquery-3.6.0.js"></script>
<script>
$(() => {

<% if(msg != null){ %>	

	alert("<%= msg %>");
	
<% } %> 
</script>
</head>

<div class="header">
  <h1><a class ="sub-link1" href="<%= request.getContextPath()%>/member/myPage">My DashBoard</a> </h1>
  <p class="sub-explain">enjoy your <b>Journey</b> with us</p>
</div>
<div class="navbar">
  <a href="<%= request.getContextPath()%>/" class="p-explain">홈으로</a>
  <%-- <a href="<%= request.getContextPath()%>/member/myCartList" class="p-explain">카트보기</a> --%>
  <a href="#" class="p-explain">카트보기</a>
 <%--  <a href="<%= request.getContextPath()%>/member/myInfo" class="p-explain">내정보</a> --%>
  <a href="<%= request.getContextPath()%>/member/myInfo" class="p-explain">내정보</a>
  <%-- <a href="<%= request.getContextPath()%>/member/myScheduleList" class="p-explain">일정</a> --%>
  <a href="<%=request.getContextPath()%>/member/mySchedule" class="p-explain">일정</a>
</div>

<!-- The flexible grid (content) -->
<div class="row">
  <div class="side">
    <h2 align="center"><a class="sub-link2" href="<%= request.getContextPath()%>/">TravelLab</a></h2>
    <div class="profile-img" align="center">
        <img class="profile"  src="https://uc3474b5f2efa50ce5bc40635c2e.previews.dropboxusercontent.com/p/thumb/ABWhhtXoYkZhe_KZFq8u8eZ9c5tYbKs41FFy53UZVXyZY6A3oIdgSbYzRRh7KXBTqAMTrZscteSmJN6HUUYZaqHKWw4MWKNsnkfBsQPts_x1l4kIA2xa7xKE9exsrWcqwcJB5BTUqkEQAB73p8TCzcc062tBhMk0QjfCgn41UADbLpnktQrgHX9tiaeFhzST3A8wbaR913fe4hmJBOrqXk_HAQ3OORiSlh_A-wKUOmNXTJ6YzrKfHcrR6Vhhp2TN1ZONkz_SROni2VigD-pZOj27QSqerEKaa2HdkOYGS-C0KfWXNAJrJMaJPzM-9TFoRm4Yb6lgBSl7Dd-5gjK4WWTSspqaJ9puEehu-Gr8WAoJLKHYEp8xV0fhWe52Ei45CSA/p.png"  />
    </div>
    
    <h3 align="center">Profile</h3>
    <p align="center" class="p-explain"><b><%=loginMember.getMemberName()%>님</b></p>
    <p align="center" class="p-explain">안녕하세요</p>
    <!-- <p>그린델왈드의 숨겨진 모래시계</p> -->
    <button class="side-button" style="vertical-align:middle"><span>Schedule</span></button>
    <button class="side-button" style="vertical-align:middle"><span>WishList</span></button>
    <button class="side-button" style="vertical-align:middle"><span>Scrap List</span></button>
    <button class="side-button" style="vertical-align:middle" onclick="location.href='<%= request.getContextPath()%>/member/myInfo';"><span>Infomation</span></button>
    <button class="side-button" style="vertical-align:middle"><span>Lab</span></button>
    <!-- <button class="sideBarTag" style="height:60px;">My Routine</button><br>
    <button class="sideBarTag" style="height:60px;">My Scrap Board</button><br>
    <button class="sideBarTag" style="height:60px;">Update Infomation</button><br>
    <button class="sideBarTag" style="height:60px;">Lab</button><br>
    <button class="sideBarTag" style="height:60px;">My Interest</button> -->
  </div>
  <div class="main">
    <h2>여행지찜목록</h2>
    <h5>최근추가날짜, Dec 7, 2021</h5>
    <br>
    <!-- First Photo Grid-->
  <div class="w3-row-padding">
    <div class="w3-third w3-container w3-margin-bottom">
      <img src="https://api.cdn.visitjeju.net/photomng/thumbnailpath/202110/20/99fd2f85-ed17-4184-966d-f81cd5eabf31.jpg" alt="협재해수욕장" style="width:100%;" class="w3-hover-opacity">
      <div class="w3-container w3-white">
        <p class="p-explain"><b>협재해수욕장</b></p>
        <p class="p-explain">에머랄드 빛 바다를 품은 올레 14코스 <br><br> #협재 #비양도 #올레14코스 </p>
      </div>
    </div>
    <div class="w3-third w3-container">
      <img src="https://api.cdn.visitjeju.net/photomng/thumbnailpath/201804/30/28506c6b-cbb7-476a-a0f1-94fa3dfc78be.jpg" alt="노루생태관찰원" style="width:100%;" class="w3-hover-opacity">
      <div class="w3-container w3-white">
        <p class="p-explain"><b>세화해변</b></p>
        <p class="p-explain">인생 사진찍기로 유명한 해변 <br><br>#힐링 #포토스팟 #올레20코스</p>
      </div>
    </div>
    <div class="w3-third w3-container">
      <img src="https://api.cdn.visitjeju.net/photomng/thumbnailpath/201908/29/5e753684-1bfd-4a01-bd60-61d10df8b14b.jpg" alt="섭지코지" style="width:100%;" class="w3-hover-opacity">
      <div class="w3-container w3-white">
        <p class="p-explain"><b>섭지코지</b></p>
        <p class="p-explain">성산일출봉을 배경으로 한 해안풍경 <br><br>#일출 #선돌바위 #제주조랑말</p>
      </div>
    </div>
    
    <div class="w3-third w3-container w3-margin-bottom">
      <img src="https://api.cdn.visitjeju.net/photomng/thumbnailpath/201804/30/c9c42359-f82f-43a4-919e-03ecd197a2eb.jpg" alt="사려니숲길" style="width:100%;" class="w3-hover-opacity">
      <div class="w3-container w3-white">
        <p class="p-explain"><b>사려니숲길</b></p>
        <p class="p-explain">제주 숨은 비경 31<br><br>#삼나무 #사려니오름 #붉은오름 </p>
      </div>
    </div> 
  </div>
  <div class="more" class="p-explain"><a href="" >더보기</a></div>
  
  <!-- Second Photo Grid-->
<div class="w3-row-padding">
    <h2>맛집찜목록</h2>
    <h5>최근 추가날짜 Sep 2, 2021</h5>
    <div class="w3-third w3-container w3-margin-bottom">
      <img src="https://api.cdn.visitjeju.net/photomng/thumbnailpath/201804/30/d2d25247-94ef-483d-85dc-abf7cc8f0693.jpg" alt="국수바다 본점" style="width:100%;" class="w3-hover-opacity">
      <div class="w3-container w3-white">
        <p class="p-explain"><b>국수의전설</b></p>
        <p class="p-explain">서귀포시 신효동 위치한 국수 전문점 <br><br>#전설칼국수 #보말칼국수 #문어비빔국수</p>
      </div>
    </div>
    <div class="w3-third w3-container w3-margin-bottom">
      <img src="https://api.cdn.visitjeju.net/photomng/thumbnailpath/202111/05/162cf069-1d8b-460b-ae84-d639a78e8de0.jpg" alt="협재해녀의 집" style="width:100%;" class="w3-hover-opacity">
      <div class="w3-container w3-white">
        <p class="p-explain"><b>협재해녀의 집</b></p>
        <p class="p-explain">해녀가 직접 잡아온 해산물로 요리하는집<br><br>#해물라면 #해산물 조림 #해산물 구이 #해물뚝배기</p>
      </div>
    </div>
    <div class="w3-third w3-container w3-margin-bottom">
      <img src="https://api.cdn.visitjeju.net/photomng/thumbnailpath/201804/30/58008d96-a5b2-4bd0-a392-0e753b33267b.gif" alt="명진전복"  style="width:100%;" class="w3-hover-opacity">
      <div class="w3-container w3-white">
        <p class="p-explain"><b>명진전복</b></p>
        <p class="p-explain">Korea Jeju Top10선정 맛집 <br><br>#제주 #전복돌솥밥 #전복구이 #전복죽 #전복 끝판왕</p>
      </div>
    </div>
    <div class="w3-third w3-container w3-margin-bottom">
      <img src="https://api.cdn.visitjeju.net/photomng/thumbnailpath/201804/30/f00e4b0c-7820-4c23-8921-b946eaca8bfb.jpg" alt="애월더선셋"  style="width:100%;" class="w3-hover-opacity">
      <div class="w3-container w3-white">
        <p class="p-explain"><b>애월더선셋</b></p>
        <p class="p-explain">애월해안 한담산책로 위 전망좋은 카페 <br><br>#카페 #커피 #브런치 </p>
      </div>
    </div>
    <div class="more" class="p-explain"><a href="" >더보기</a></div>
  </div> 
</div>
</body>
</html>
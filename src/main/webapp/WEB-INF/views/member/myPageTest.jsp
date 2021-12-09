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
<meta name="viewport"
	content="width=device-width, initial-scale=1.0, maximum-scale=1.0">
<title>MyPage</title>
<meta name="author" content="jimmer" />
<link rel="stylesheet"
	href="https://fonts.googleapis.com/css?family=Open+Sans:300italic,400italic,600italic,700italic,800italic,400,300,600,700,800" />
<script src="<%=request.getContextPath() %>/js/jquery-3.6.0.js"></script>
<script>
$(() => {

<% if(msg != null){ %>	

	alert("<%= msg %>");
	
<% } %> 
</script>
</head>
</head>
<body>
	<h1>Flex 메뉴</h1>

	<div class="flex-container" width="1200px" style="">
		<div
			onclick="location.href='<%= request.getContextPath()%>/member/myInfo';"
			value="정보수정">정보수정</div>
		<div
			onclick="location.href='<%= request.getContextPath()%>/member/profileView';">프로필수정</div>
		<div
			onclick="location.href='<%= request.getContextPath()%>/member/updatePassword';">비밀번호
			변경</div>
		<div
			onclick="location.href='<%= request.getContextPath()%>/member/memberDelete';">탈퇴</div>
		<div
			onclick="location.href='<%= request.getContextPath()%>/member/magazineScrapList';">스크랩보기</div>
		<div
			onclick="location.href='<%= request.getContextPath()%>/schedule/myScheduleList';">내일정</div>
	</div>

	<p>Try to resize the browser window.</p>
	<p>A container with "flex-wrap: nowrap;" will never wrap its items.</p>
	<p>
		<strong>Note:</strong> Flexbox is not supported in Internet Explorer
		10 or earlier versions.
	</p>

</body>
</html>
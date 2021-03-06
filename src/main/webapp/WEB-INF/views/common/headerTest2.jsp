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
<html>
<head>
<meta charset="UTF-8">
<title>당신의 여행을 응원합니다</title>
<link rel="stylesheet"
	href="<%=request.getContextPath() %>/css/style.css" />
<link rel="stylesheet"
	href="<%=request.getContextPath() %>/css/product.css" />
<script src="<%= request.getContextPath() %>/js/jquery-3.6.0.js"></script>
<script>
$(() => {

<% if(msg != null){ %>	

	alert("<%= msg %>");
	
<% } %>

<%-- 로그인하지 않은 경우만 출력 --%>
<% if(loginMember == null){ %>

	/**
	 * 로그인폼 유효성 검사
	 */
	$(loginFrm).submit((e) => {
		const $memberId = $(memberId);
		const $password = $(password);
		
		if(!/^\w{4,}$/.test($memberId.val())){
			alert("유효한 아이디를 입력하세요.");
			$memberId.select();
			return false;
		}
		if(!/^.{4,}$/.test($password.val())){
			alert("유효한 비밀번호를 입력하세요.");
			$password.select();
			return false;
		}
	});
	
<% } %>

});
</script>
</head>
<body>
	<div id="container">
		<header>
			<h1>Travel Lab</h1>
			<div class="login-container">
				<% if(loginMember == null){ %>
				<!-- 로그인폼 시작 -->
				<form id="loginFrm"
					action="<%= request.getContextPath() %>/member/login" method="POST">
					<table>
						<tr>
							<td><input type="text" name="memberId" id="memberId"
								placeholder="아이디" tabindex="1"
								value="<%= saveMemberId != null ? saveMemberId : "" %>"></td>
							<td><input type="submit" value="로그인" tabindex="3"></td>
						</tr>
						<tr>
							<td><input type="password" name="password" id="password"
								placeholder="비밀번호" tabindex="2"></td>
							<td></td>
						</tr>
						<tr>
							<td colspan="2"><input type="checkbox" name="saveId"
								id="saveId" <%= saveMemberId != null ? "checked" : "" %> /> <label
								for="saveId">아이디저장</label>&nbsp;&nbsp; <input type="button"
								value="회원가입"
								onclick="location.href='<%= request.getContextPath() %>/member/memberEnroll';">
							</td>
						</tr>
					</table>
				</form>
				<!-- 로그인폼 끝-->
				<% } else { %>
				<table id="login">
					<tr>
						<td><%= loginMember.getMemberName() %>님, 안녕하세요.</td>
					</tr>
					<tr>
						<td><input type="button" value="내정보보기"
							onclick="location.href='<%= request.getContextPath() %>/member/myPage';">
							<input type="button" value="로그아웃"
							onclick="location.href='<%= request.getContextPath() %>/member/memberLogout';">
						</td>
					</tr>
				</table>
				<% } %>
			</div>

			<!-- 메인메뉴 시작 -->
			<nav>
				<ul class="main-nav">
					<li class="home"><a href="<%= request.getContextPath() %>">Home</a></li>
					<li class="notice"><a href="#">공지사항</a></li>
					<li class="board"><a
						href="<%= request.getContextPath() %>/board/boardList">게시판</a></li>
					<li class="photo"><a
						href="<%= request.getContextPath() %>/product/productList">사진게시판</a></li>
					<li class="magazine"><a
						href="<%= request.getContextPath() %>/magazine/magazineList">매거진</a></li>
					<li class="cs"><a
						href="<%= request.getContextPath() %>/cs/csList">고객센터</a></li>
					<% if(loginMember != null && MemberService.ADMIN_ROLE.equals(loginMember.getMemberRole())){ %>
					<li class="admin"><a
						href="<%= request.getContextPath() %>/admin/memberList">회원관리</a></li>
					<li class="admin"><a
						href="<%= request.getContextPath() %>/admin/productList">상품관리</a></li>
					<% } %>
					<%-- <% if(loginMember != null && MemberService.ADMIN_ROLE.equals(loginMember.getMemberRole())){ %>						
						<li class="admin"><a href="<%= request.getContextPath() %>/admin/memberList">회원관리</a></li>
<% } %>  --%>

				</ul>
			</nav>
			<!-- 메인메뉴 끝-->

		</header>

		<section id="content">
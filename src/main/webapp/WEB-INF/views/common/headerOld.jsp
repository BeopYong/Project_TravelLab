<%@page import="com.tlab.mvc.member.model.service.MemberService"%>
<%@page import="com.tlab.mvc.member.model.vo.Member"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8" %>
    
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
<link rel="stylesheet" href="<%=request.getContextPath() %>/css/style.css" />
<link rel="stylesheet" href="<%=request.getContextPath() %>/css/product.css" />
<style>
@charset "UTF-8";
div, section, header, aside, footer {padding:10px;}

/********** 전체컨테이너 **********/
div#container	{background-color:#F0F0F0; width:960px; margin:0 auto;}

/********** header **********/
header			{background: #03DAC5 url('/mvc/images/Java-Servlets-JSP.png') 21% 5%/18% no-repeat; height:130px; position:relative; padding:10px 0 0 0;}
header h1 		{margin-left:10px;}

/* 로그인컨테이너 */
header div.login-container{width:250px; position:absolute; right: 0px; top: 10px;}

/* 로그인테이블관련 : 탭순서를 고려한 배치 */
#loginFrm table{empty-cells:hide;}
#loginFrm input[type=submit]{width:60px; height:50px; color:white; background:#3300ff; position:absolute; top:14px;}
#loginFrm input[type=button]{border-radius:3px;}
#saveId+label{font-size:12px;font-family:'고딕'}

/* 로그인성공후 */
div.login-container table#logged-in{border-spacing:10px;}
div.login-container table#logged-in input[type=button]{border-radius:3px;}

/* 메뉴관련스타일 */
header nav {background:#5283de; width:100%; margin-top:40px;}
/* ul태그의 가운데정렬 */
ul.main-nav{
	display:table;
	padding:0px;
	margin:auto;
}
ul.main-nav li { 
	list-style-type: none; 
	width: 8em; 
	height: 2em;
	float: left; 
	text-align: center; 
	font-family: "휴먼모음T", sans-serif; 
	border-left: 1px #00bcd4 solid;
	background-color: #5283de; 
	/* 메뉴밑줄트랜지션용 */
	position:relative;	
}
ul.main-nav li:last-of-type{border-right:1px #00bcd4 solid;}
ul.main-nav li a {
    /*a태그의 display기본값은 inline임*/
    /* inline요소의 padding, margin은 제대로 동작하지 않음.(컨텐츠의 시각요소기준으로 제멋대로임	) */
	display: block;
	padding:.4em;
	text-decoration: none;
	color: #292929;
}
/* hover시 배경색 변경 */
ul.main-nav li:hover{
	background-color: #3300ff;
}
ul.main-nav li:hover > a{
	color:#FFF; /* 글자색*/
}
/* 메뉴밑줄효과 */
ul.main-nav li span.animate_line{
	position: absolute;
	/* position:absolute;=> display:block;으로 되면서, 너비, 높이를 가진다. */
    left: 0;
    bottom: 0;
    width: 0;
    height: 3px;
    background-color: #FCE72E;
    -webkit-transition: .2s;
    transition: .2s;
}
ul.main-nav li:hover span.animate_line{
	width:100%;
}


/********** content **********/
section#content		{background-color:#F5F5F5; float:left; width:940px; min-height:500px; }

/* 회원가입페이지 */
section#enroll-container {text-align:center;}
section#enroll-container input{margin:3px;}
section#enroll-container table{margin:0 auto;}
section#enroll-container table th {padding:0 10px; text-align:right;}
section#enroll-container table td {padding:0 10px; text-align:left;}
section#enroll-container sup{color: red;}

/* 회원정보보기 */
section#enroll-container input[readonly]{background:lightgray;}



/********** footer **********/
footer				{ background-color:#00bcd4; clear:both; height:75px; text-align:center;padding-top:40px;}
</style>
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
					<form 
						id="loginFrm" 
						action="<%= request.getContextPath() %>/member/login"
						method="POST">
						<table>
							<tr>
								<td><input type="text" name="memberId" id="memberId" placeholder="아이디" tabindex="1" value="<%= saveMemberId != null ? saveMemberId : "" %>"></td>
								<td><input type="submit" value="로그인" tabindex="3"></td>
							</tr>
							<tr>
								<td><input type="password" name="password" id="password" placeholder="비밀번호" tabindex="2"></td>
								<td></td>
							</tr>
							<tr>
								<td colspan="2">
									<input type="checkbox" name="saveId" id="saveId" <%= saveMemberId != null ? "checked" : "" %>/>
									<label for="saveId">아이디저장</label>&nbsp;&nbsp;
									<input 
										type="button" 
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
							<td>
								<input type="button" value="내정보보기" onclick="location.href='<%= request.getContextPath() %>/member/myPage';">
								<input type="button" value="로그아웃" onclick="location.href='<%= request.getContextPath() %>/member/memberLogout';">
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
						<li class="board"><a href="<%= request.getContextPath() %>/board/boardList">게시판</a></li>
						<li class="photo"><a href="<%= request.getContextPath() %>/product/productList">사진게시판</a></li>
						<li class="magazine"><a href="<%= request.getContextPath() %>/magazine/magazineList">매거진</a></li>
						<li class="cs"><a href="<%= request.getContextPath() %>/cs/csList">고객센터</a></li>
<% if(loginMember != null && MemberService.ADMIN_ROLE.equals(loginMember.getMemberRole())){ %>						
						<li class="admin"><a href="<%= request.getContextPath() %>/admin/memberList">회원관리</a></li>
						<li class="admin"><a href="<%= request.getContextPath() %>/admin/productList">상품관리</a></li>
<% } %>
 <%-- <% if(loginMember != null && MemberService.ADMIN_ROLE.equals(loginMember.getMemberRole())){ %>						
						<li class="admin"><a href="<%= request.getContextPath() %>/admin/memberList">회원관리</a></li>
<% } %>  --%>

					</ul>
				</nav>
				<!-- 메인메뉴 끝-->
						
		</header>
		
		<section id="content">
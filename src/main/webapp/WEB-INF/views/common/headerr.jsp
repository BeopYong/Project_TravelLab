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
<style>
    .hheader {
        position: relative;
    }
    .logo {
        padding: 2% 2% 8% 2% ;
        color: rgb(156, 156, 156);
        font-family: -apple-system, BlinkMacSystemFont, 'Segoe UI', Roboto, Oxygen, Ubuntu, Cantarell, 'Open Sans', 'Helvetica Neue', sans-serif;
    }
    .logo li a {
        text-decoration: none;
        color: black;
    }
    .traffic-hheader nav {
        clear: both;
        width: 99%;
        height: 50px;
        background-color : silver;
        padding: 2px;
        margin: 0;
        position: absolute;
        bottom : 0;
        text-align: center;
    }
    .traffic-hheader .thn  {
    position: absolute; top: 130px;
    }
    .traffic-hheader .thn a {
        color : white;
        margin : 60px;
        text-decoration: none;
    }
    .traffic-hheader ul {
        list-style-type: none;  
    }
    .traffic-hheader li {
        padding-top: 10px; 
    }
    .link {
        display: inline-block;
        text-align: center;
    }
    .link a {
        color: black;
        text-decoration: none;
        font-size: 20px;
    }
@font-face {
    font-family: 'yg-jalnan';
    src: url('https://cdn.jsdelivr.net/gh/projectnoonnu/noonfonts_four@1.2/JalnanOTF00.woff') format('woff');
    font-weight: normal;
    font-style: normal;
}
@font-face {
    font-family: 'OTWelcomeRA';
    src: url('https://cdn.jsdelivr.net/gh/projectnoonnu/noonfonts_2110@1.0/OTWelcomeRA.woff2') format('woff2');
    font-weight: normal;
    font-style: normal;
}
div#pageBar{margin-top:10px; text-align:center; background-color:rgb(227,211,196); }
div#pageBar span.cPage{color: #0066ff; margin-right: 5px;}
div#pageBar a{margin-right: 5px;}
div, section, header, aside, footer {padding:10px;}

/********** header **********/
header			{no-repeat; height:130px; position:relative; padding:0 0 0 0;}
header h1 		{margin-left:10px;}

/* 로그인컨테이너 */
header div.login-container{width:250px; position:absolute; right: 0px; top: 10px;}

/* 로그인테이블관련 : 탭순서를 고려한 배치 */
#loginFrm table{empty-cells:hide;}
#loginFrm input[type=submit]{width:60px; height:50px; color:white; background:#91a8e7; position:absolute; top:9.8px;}
#loginFrm input[type=button]{border-radius:3px;}
#saveId+label{font-size:12px;font-family:'고딕'}

/* 로그인성공후 */
div.login-container table#logged-in{border-spacing:10px;}
div.login-container table#logged-in input[type=button]{border-radius:3px;}

</style>
<link rel="stylesheet" href="<%=request.getContextPath() %>/css/product.css" />
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
			<h1 class="logo" style="font-family:'yg-jalnan';" font-size: 3em;">Travle lab</h1>
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
    <div class="traffic-hheader">
        <nav class="thn">
            <ul>
              <li class="link"><a href="<%= request.getContextPath() %>" style="font-family: 'OTWelcomeRA';">Home</a></li>
              <li class="link" style="font-family: 'OTWelcomeRA';"><a href="<%= request.getContextPath() %>/product/productMain">상품</a></li>
              <li class="link" style="font-family: 'OTWelcomeRA';"><a href="<%= request.getContextPath() %>/magazine/magazineList">Magazine</a></li>
              <li class="link" style="font-family: 'OTWelcomeRA';"><a href="<%= request.getContextPath() %>/cs/csList">고객센터</a></li>
              <% if(loginMember != null && MemberService.ADMIN_ROLE.equals(loginMember.getMemberRole())){ %>
              <li class="link" style="font-family: 'OTWelcomeRA';"><a href="<%= request.getContextPath() %>//admin/memberList">회원관리</a></li>
              <li class="link" style="font-family: 'OTWelcomeRA';"><a href="<%= request.getContextPath() %>/admin/productList">상품관리</a></li>
            <% } %>
            </ul>
        </nav>
    </div>
						
		</header>
		
		<section id="content">
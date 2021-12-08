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
<style>
@font-face {
  font-family: 'Cafe24Ssurround';
  src: url('https://cdn.jsdelivr.net/gh/projectnoonnu/noonfonts_2105_2@1.0/Cafe24Ssurround.woff') format('woff');
  font-weight: normal;
  font-style: normal;
}


.body {
  margin: 0px;
  font-family: 'Cafe24Ssurround';
  box-sizing: border-box;
}

/* /* a:visited { color : white; }
a:hover { text-decoration: none; }
a:focus { text-decoration: none; } */
a { text-decoration: none; }



.main-background {
  width: 100%;
  height: 764px;
  background-image: url(../img/landing.jpg);
  background-size: cover;
  background-repeat: no-repeat;
  background-position: center;
  /* filter: brightness(70%); */
  padding: 1px;
  position: relative;
  text-align: center;
  background-color: #bae9fc;
}

.main-title {
  /* color: white; */
  font-size: 50px;
  margin-top: 150px;
}

.main-background > p {
  /* color: #eee; */
  font-size: 20px;
  margin-bottom: 50px;
  font-family: 'Cafe24Ssurround';
}

.main-background button {
  padding: 10px;
  font-size: 20px;
  margin: 50px;
  border-radius: 30px;
  border: none;
  background-color: rgb(42, 144, 171);
  position: absolute;
  left: 0;
  right: 0;
  margin: auto;
  width: 150px;
}

.main-background button a {
  color : white;
}


.login-container {
  display: flex;
  height: 120px;
  align-items: center;
}

.login-form {
  margin: 10px;
  padding: 10px;
}

.headerName {
  font-size : 50px;
  margin : 30px;
  padding : 10px;
  color :rgb(42, 144, 171);
  font-family: 'Cafe24Ssurround';
}
</style>

<meta charset="UTF-8">
<title>당신의 여행을 응원합니다</title>
 <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.1.3/dist/css/bootstrap.min.css" rel="stylesheet" integrity="sha384-1BmE4kWBq78iYhFldvKuhfTAU6auU8tT94WrHftjDbrCEXSU1oBoqyl2QvZ6jIW3" crossorigin="anonymous">
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
    <div class="login-container">
      <div class="headerName">Travel Lab</div>
      <div style="flex-grow: 1;"></div>
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
    </div>

    <nav class="navbar navbar-expand-lg navbar-light bg-light" style="height : 100px;">
      <div class="container-fluid">
        <button class="navbar-toggler" type="button" data-bs-toggle="collapse" data-bs-target="#navbarSupportedContent" aria-controls="navbarSupportedContent" aria-expanded="false" aria-label="Toggle navigation">
          <span class="navbar-toggler-icon"></span>
        </button>
        <div class="collapse navbar-collapse" id="navbarSupportedContent">
          <ul class="navbar-nav me-auto mb-2 mb-lg-0">
            <li class="nav-item">
              <a class="nav-link active" aria-current="page" href="<%=request.getContextPath()%>">Home</a>
            </li>
            <li class="nav-item dropdown">
              <a class="nav-link dropdown-toggle" href="#" id="navbarDropdown" role="button" data-bs-toggle="dropdown" aria-expanded="false">
                Product
              </a>
              <ul class="dropdown-menu" aria-labelledby="navbarDropdown">
                <li><a class="dropdown-item" href="<%=request.getContextPath()%>/product/productList?p_category=101">항공</a></li>
                <li><a class="dropdown-item" href="<%=request.getContextPath()%>/product/productList?p_category=102">KTX</a></li>
                <li><a class="dropdown-item" href="<%=request.getContextPath()%>/product/productList?p_category=103">버스</a></li>
                <li><hr class="dropdown-divider"></li>
                <li><a class="dropdown-item" href="<%=request.getContextPath()%>/product/productList?p_category=201">숙박</a></li>
                <li><hr class="dropdown-divider"></li>
                <li><a class="dropdown-item" href="<%=request.getContextPath()%>/product/productList?p_category=301">맛집</a></li>
                <li><a class="dropdown-item" href="<%=request.getContextPath()%>/product/productList?p_category=302">핫플</a></li>
              </ul>
            </li>
            <li class="nav-item">
              <a class="nav-link" href="<%=request.getContextPath()%>/magazine/magazineList">Magazine</a>
            </li>
            <li class="nav-item">
              <a class="nav-link" href="<%=request.getContextPath()%>/cs/csList">CS</a>
            </li>
             <% if(loginMember != null && MemberService.ADMIN_ROLE.equals(loginMember.getMemberRole())){ %>
             <li class="nav-item">
              <a class="nav-link" href="<%=request.getContextPath()%>/admin/memberList">ADMIN-Memeber</a>
            </li>
            <li class="nav-item">
              <a class="nav-link" href="<%=request.getContextPath()%>/admin/productList">ADMIN-Product</a>
            </li>
            <% } %>
            
          </ul>
        </div>
      </div>
    </nav>
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
    </header>
<body>
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
	href="<%=request.getContextPath() %>/css/bootstrap.css" />
<link rel="stylesheet"
	href="<%=request.getContextPath() %>/css/style.css" />
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
			<!-- 여기까지 header영역 -->

			<!-- <link rel="stylesheet" href="<%=request.getContextPath()%>/css/board.css" /> -->
			<link rel="stylesheet"
				href="<%=request.getContextPath()%>/css/magazine.css" />


			<script>
        /**
         * magazine 유효성 검사(제목, 내용을 작성안한 경우 제출불가)
         */
        function magazineValidate(){
            const $title = $("[name=title]");
            const $content = $("[name=content]");
            const $region = $("[name=region]")
            //제목 작성하지 않은 경우
            if(!/^.+$/.test($title.val())){
                alert("제목을 입력하세요.")
                return false;
            }
            
            //내용을 작성하지 않은 경우
            if(!/^(.|\n)+$/.test($content.val())){
                alert("내용을 입력하세요.")
                return false;
            }
            
            //지역을 선택하지 않은 경우
            return true;
        }
        
        //magazineform 제출직전에 magazineValidate 호출
        $(() => {
        	$(document.magazineEnrollFrm).submit(magazineValidate);
        });
        </script>

			<section id="magazineForm-container" class="magazine-container">

				<div class="">
					<form name="magazineEnrollFrm" method="post"
						action="<%=request.getContextPath()%>/magazine/magazineEnroll"
						<input type="hidden" name="no" value="<%=loginMember.getMemberId()%>" />>
						<!-- enctype="multipart/form-data"
			accept-charset="UTF-8" -->

						<h3 id="logo">Magazine Insert</h3>
						<br>
						<!-- 매거진 게시물 등록 폼 시작 -->
						<tr>
							<label for="username"><th>지역</th></label>
							<td class="text-td"><select name="region" id="region"
								required class="form-select" aria-label="Default select example">
									<option value="0">선택</option>
									<option value="강원도">강원도</option>
									<option value="부산">부산</option>
									<option value="제주도">제주도</option>
							</select></td>
						</tr>

						<tr>
							<label for="username"><th>제목</th></label>

							<td class="text-td"><input type="text" name="title"
								id="title" value="<%=loginMember.getMemberName()%>님의 레시피입니다."
								readonly /></td>
						</tr>

						<tr>
							<label for="username"><th>작성자</th></label>

							<td class="text-td"><input type="text" name="writer"
								id="writer" value="<%=loginMember.getMemberId()%>" readonly /></td>
						</tr>

						<!-- 파일 추후에 수정 -->
						<tr>
							<label for="username"><th>첨부파일</th></label>

							<td class="text-td"><input type="file" name="upFile1"
								id="upfile" />
						</tr>

						<tr>
							<label for="username"><th>내 용</th></label>
							<td class="text-td"><textarea id="content" name="content"
									id="content" rows="10" cols="40" autocomplete="off" required></textarea>
							</td>

						</tr>

						<tr>
							<th colspan="2"><input type="submit" id="btn"
								class="insert-btn" value="등록" /> <input type="button" id="btn"
								class="listback-btn" value="취소" onclick="history.go(-1);" /></th>
						</tr>
						</table>


					</form>
				</div>

			</section>






			<style>
@import url(https://fonts.googleapis.com/css?family=Lily+Script+One);

@import
	url('https://fonts.googleapis.com/css2?family=Hammersmith+One&display=swap')
	;

@import url(//fonts.googleapis.com/earlyaccess/notosanskr.css);

form {
	font-family: 'Noto Sans KR', sans-serif;
}

body {
	margin: 0;
	font-family: arial, tahoma, sans-serif;
	font-size: 12px;
	font-weight: normal;
	direction: ltr;
	background: white;
}

form {
	margin: 10% auto 0 auto;
	padding: 30px;
	width: 800px;
	height: auto;
	overflow: hidden;
	background: white;
	border-radius: 10px;
}

form label {
	font-size: 17px;
	color: darkgray;
	cursor: pointer;
}

form label, form input {
	float: left;
	clear: both;
}

form input {
	margin: 19px 0;
	padding: 15px 10px;
	width: 100%;
	outline: none;
	border: 1px solid #bbb;
	border-radius: 20px;
	display: inline-block;
	-webkit-box-sizing: border-box;
	-moz-box-sizing: border-box;
	box-sizing: border-box;
	-webkit-transition: 0.2s ease all;
	-moz-transition: 0.2s ease all;
	-ms-transition: 0.2s ease all;
	-o-transition: 0.2s ease all;
	transition: 0.2s ease all;
}

form input[type="text"]:focus, form input[type="password"], form textarea :focus
	{
	border-color: cornflowerblue;
}

form input[type="submit"] {
	vertical-align: middle;
	font-size: 15px;
	padding: 15px 50px;
	width: auto;
	background: rgb(128, 151, 194);
	border: none;
	color: rgb(54, 54, 54);
	cursor: pointer;
	display: inline-block;
	float: right;
	clear: right;
	-webkit-transition: 0.2s ease all;
	-moz-transition: 0.2s ease all;
	-ms-transition: 0.2s ease all;
	-o-transition: 0.2s ease all;
	transition: 0.2s ease all;
	font-weight: bold;
}

form input[type="submit"] :hover {
	opacity: 0.8;
}

form input[type="submit"] :active {
	opacity: 0.4;
}

form input[type="button"] {
	vertical-align: middle;
	font-size: 15px;
	padding: 15px 50px;
	width: auto;
	background: rgb(128, 151, 194);
	border: none;
	color: rgb(54, 54, 54);
	cursor: pointer;
	position: relative;
	display: inline-block;
	float: left;
	clear: left;
	-webkit-transition: 0.2s ease all;
	-moz-transition: 0.2s ease all;
	-ms-transition: 0.2s ease all;
	-o-transition: 0.2s ease all;
	transition: 0.2s ease all;
	font-weight: bold;
}

form textarea {
	margin: 15px 0;
	padding: 15px 10px;
	width: 800px;
	outline: none;
	border: 1px solid #bbb;
	border-radius: 20px;
	display: inline-block;
	-webkit-box-sizing: border-box;
	-moz-box-sizing: border-box;
	box-sizing: border-box;
	-webkit-transition: 0.2s ease all;
	-moz-transition: 0.2s ease all;
	-ms-transition: 0.2s ease all;
	-o-transition: 0.2s ease all;
	transition: 0.2s ease all;
	resize: vertical;
}

form select {
	margin: 15px 0;
	padding: 15px 10px;
	width: 100%;
	outline: none;
	border: 1px solid #bbb;
	border-radius: 20px;
	display: inline-block;
	-webkit-box-sizing: border-box;
	-moz-box-sizing: border-box;
	box-sizing: border-box;
	-webkit-transition: 0.2s ease all;
	-moz-transition: 0.2s ease all;
	-ms-transition: 0.2s ease all;
	-o-transition: 0.2s ease all;
	transition: 0.2s ease all;
}

.forgot, .register {
	margin: 10px;
	float: left;
	clear: left;
	display: inline-block;
	color: cornflowerblue;
	text-decoration: none;
}

.forgot:hover, .register:hover {
	color: darkgray;
}

#logo {
	margin: 100;
	/* width: 200px;// */
	font-family: 'Hammersmith One', sans-serif;
	font-size: 60px;
	font-weight: bold;
	text-align: center;
	color: rgb(128, 151, 194);
	-webkit-transition: 0.2s ease all;
	-moz-transition: 0.2s ease all;
	-ms-transition: 0.2s ease all;
	-o-transition: 0.2s ease all;
	transition: 0.2s ease all;
}

#logo:hover {
	color: rgb(143, 146, 148);
}
</style>



			<!-- 여기까지 footer영역 -->
		</section>
		<footer>
			<div class="footer">
				<p>㈜ Travle Lap</p>
				<p>서울특별시 강남구 강남구 테헤란로14길 6</p>
				<p>사업자 등록번호: 001-01-0001</p>
				<p>고객센터 02)1234-1234</p>
			</div>
		</footer>
	</div>
	<script src="<%=request.getContextPath()%>/js/jquery.min.js"></script>
	<script src="<%=request.getContextPath()%>/js/popper.js"></script>
	<script src="<%=request.getContextPath()%>/js/bootstrap.min.js"></script>
</body>
</html>


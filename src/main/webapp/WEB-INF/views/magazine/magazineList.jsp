
<%@page import="java.util.List"%>
<%@page import="com.tlab.mvc.member.model.service.MemberService"%>
<%@page import="com.tlab.mvc.member.model.vo.Member"%>
<%@page import="com.tlab.mvc.magazine.model.vo.Magazine"%>
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
<!DOCTYPE HTML>
<html>
<head>
<meta charset="utf-8">
<meta http-equiv="X-UA-Compatible" content="IE=edge">
<title>Balay Template</title>
<meta name="viewport" content="width=device-width, initial-scale=1">
<meta name="description" content="" />
<meta name="keywords" content="" />
<meta name="author" content="" />

<!-- Facebook and Twitter integration -->
<meta property="og:title" content="" />
<meta property="og:image" content="" />
<meta property="og:url" content="" />
<meta property="og:site_name" content="" />
<meta property="og:description" content="" />
<meta name="twitter:title" content="" />
<meta name="twitter:image" content="" />
<meta name="twitter:url" content="" />
<meta name="twitter:card" content="" />

<!-- Place favicon.ico and apple-touch-icon.png in the root directory -->
<link rel="shortcut icon" href="favicon.ico">

<link
	href="https://fonts.googleapis.com/css?family=Quicksand:300,400,500,700"
	rel="stylesheet">

<!-- Animate.css -->
<link rel="stylesheet"
	href="<%=request.getContextPath()%>/css/magazine/animate.css">
<!-- Icomoon Icon Fonts-->
<link rel="stylesheet"
	href="<%=request.getContextPath()%>/css/magazine/icomoon.css">
<!-- Bootstrap  -->
<link rel="stylesheet"
	href="<%=request.getContextPath()%>/css/magazine/bootstrap.css">
<!-- Flexslider  -->
<link rel="stylesheet"
	href="<%=request.getContextPath()%>/css/magazine/flexslider.css">
<!-- Flaticons  -->
<link rel="stylesheet"
	href="<%=request.getContextPath()%>/css/magazine/flaticon.css">
<!-- Owl Carousel -->
<link rel="stylesheet"
	href="<%=request.getContextPath()%>/css/magazine/owl.carousel.min.css">
<link rel="stylesheet"
	href="<%=request.getContextPath()%>/css/magazine/owl.theme.default.min.css">
<!-- Theme style  -->
<link rel="stylesheet"
	href="<%=request.getContextPath()%>/css/magazine/style.css">

<!-- Modernizr JS -->
<script src="js/modernizr-2.6.2.min.js"></script>
<!-- FOR IE9 below -->
<!--[if lt IE 9]>
	<script src="js/respond.min.js"></script>
	<![endif]-->
<link rel="stylesheet"
	href="<%=request.getContextPath()%>/css/style.css" />

<title>당신의 여행을 응원합니다</title>
<script>
			$(() => {
			
			<%if (msg != null) {%>	
			
				alert("<%=msg%>");
				
			<%}%>
			
			<%-- 로그인하지 않은 경우만 출력 --%>
			<%if (loginMember == null) {%>
			
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
				
			<%}%>
			
			});
			</script>

</head>
<body>

	<!-- 헤더시작 -->
	<div id="container">
		<header>
			<h1>Travel Lab</h1>
			<div class="login-container">
				<%
				if (loginMember == null) {
				%>
				<!-- 로그인폼 시작 -->
				<form id="loginFrm"
					action="<%=request.getContextPath()%>/member/login" method="POST">
					<table>
						<tr>
							<td><input type="text" name="memberId" id="memberId"
								placeholder="아이디" tabindex="1"
								value="<%=saveMemberId != null ? saveMemberId : ""%>"></td>
							<td><input type="submit" value="로그인" tabindex="3"></td>
						</tr>
						<tr>
							<td><input type="password" name="password" id="password"
								placeholder="비밀번호" tabindex="2"></td>
							<td></td>
						</tr>
						<tr>
							<td colspan="2"><input type="checkbox" name="saveId"
								id="saveId" <%=saveMemberId != null ? "checked" : ""%> /> <label
								for="saveId">아이디저장</label>&nbsp;&nbsp; <input type="button"
								value="회원가입"
								onclick="location.href='<%=request.getContextPath()%>/member/memberEnroll';">
							</td>
						</tr>
					</table>
				</form>
				<!-- 로그인폼 끝-->
				<%
				} else {
				%>
				<table id="login">
					<tr>
						<td><%=loginMember.getMemberName()%>님, 안녕하세요.</td>
					</tr>
					<tr>
						<td><input type="button" value="내정보보기"
							onclick="location.href='<%=request.getContextPath()%>/member/myPage';">
							<input type="button" value="로그아웃"
							onclick="location.href='<%=request.getContextPath()%>/member/memberLogout';">
						</td>
					</tr>
				</table>
				<%
				}
				%>
			</div>

			<!-- 메인메뉴 시작 -->
			<nav>
				<ul class="main-nav">
					<li class="home"><a href="<%=request.getContextPath()%>">Home</a></li>
					<li class="photo"><a
						href="<%=request.getContextPath()%>/product/productList">사진게시판</a></li>
					<li class="magazine"><a
						href="<%=request.getContextPath()%>/magazine/magazineList">매거진</a></li>
					<li class="cs"><a
						href="<%=request.getContextPath()%>/cs/csList">고객센터</a></li>
					<%
					if (loginMember != null && MemberService.ADMIN_ROLE.equals(loginMember.getMemberRole())) {
					%>
					<li class="admin"><a
						href="<%=request.getContextPath()%>/admin/memberList">회원관리</a></li>
					<li class="admin"><a
						href="<%=request.getContextPath()%>/admin/productList">상품관리</a></li>
					<%
					}
					%>
					<%-- <% if(loginMember != null && MemberService.ADMIN_ROLE.equals(loginMember.getMemberRole())){ %>						
							<li class="admin"><a href="<%= request.getContextPath() %>/admin/memberList">회원관리</a></li>
	<% } %>  --%>

				</ul>
			</nav>
			<!-- 메인메뉴 끝-->

		</header>
		<!-- 헤더 끝 -->

		<!-- tlab project magazine list 추가 -->
		<%
		List<Magazine> list = (List<Magazine>) request.getAttribute("list");
		String searchType = request.getParameter("searchType");
		String searchKeyword = request.getParameter("searchKeyword");
		%>
		<!-- content 시작 -->
		<section>
			<style>
section#content {
	background-color: #FAFDFF;
	float: left;
	width: 940px;
	min-height: 500px;
}

div#search-container {
	margin: 0 0 10px 0;
	padding: 3px;
	text-align: center;
	border-radius: 10px;
	background-color: #f3f3f3;
}

div#search-region {
	display: <%=searchType == null || "region".equals(searchType) ? "inline-block" : "none"%>;
}

div#search-writer {
	display: <%="writer".equals(searchType) ? "inline-block" : "none"%>;
}

div#search-title {
	display: <%="title".equals(searchType) ? "inline-block" : "none"%>;
}

p#content-view {
	text-overflow: ellipsis;
	white-space: nowrap;
	overflow: hidden
}
</style>
			<label for=""> <!-- 매거진 검색 영역 -->
				<div id="search-container">
					<select id="searchType">
						<option value="region"
							<%="region".equals(searchType) ? "selected" : ""%>>지역</option>
						<option value="writer"
							<%="writer".equals(searchType) ? "selected" : ""%>>작성자</option>
						<option value="title"
							<%="title".equals(searchType) ? "selected" : ""%>>제목</option>
					</select>
					<div id="search-region" class="search-type">
						<form
							action="<%=request.getContextPath()%>/magazine/magazineFinder">
							<input type="hidden" name="searchType" value="region" /> <input
								type="text" name="searchKeyword"
								value="<%="region".equals(searchType) ? searchKeyword : ""%>"
								size="25" placeholder="검색할 지역를 입력하세요." />
							<button id="btn" type="submit" class="btn btn-primary btn-learn">검색</button>
						</form>
					</div>
					<div id="search-writer" class="search-type">
						<form
							action="<%=request.getContextPath()%>/magazine/magazineFinder">
							<input type="hidden" name="searchType" value="writer" /> <input
								type="text" name="searchKeyword"
								value="<%="writer".equals(searchType) ? searchKeyword : ""%>"
								size="25" placeholder="검색할 작성자를 입력하세요." />
							<button id="btn" type="submit" class="btn btn-primary btn-learn">검색</button>
						</form>
					</div>
					<div id="search-title" class="search-type">
						<form
							action="<%=request.getContextPath()%>/magazine/magazineFinder">
							<input type="hidden" name="searchType" value="title" /> <input
								type="text" name="searchKeyword"
								value="<%="title".equals(searchType) ? searchKeyword : ""%>"
								size="25" placeholder="검색할 제목을 입력하세요." />
							<button id="btn" type="submit" class="btn btn-primary btn-learn">검색</button>
						</form>
					</div>
				</div>
			</label>

			<!-- 여기부터임   -->
			<div id="colorlib-main">

				<div class="colorlib-blog">
					<div class="colorlib-narrow-content">
						<div class="row">
							<div class="col-md-6 col-md-offset-3 col-md-pull-3 animate-box"
								data-animate-effect="fadeInLeft">
								<span class="heading-meta">Travel Lab</span>
								<h2 class="colorlib-heading">MAGAZINE</h2>
							</div>
						</div>

						<div class="row">
							<%
							for (Magazine magazine : list) {
							%>

							<div class="col-md-4 col-sm-6 animate-box"
								data-animate-effect="fadeInLeft">
								<div class="blog-entry">
									<a
										href="<%=request.getContextPath()%>/magazine/magazineView?no=<%=magazine.getNo()%>">
										<a href="" class="blog-img"><img
											src="https://thumb.wishbeen.com/OUkkSnIQptRVw9a2P9BHTkUY_Wo=/218x180/smart/wishbeen-seoul.s3.ap-northeast-2.amazonaws.com/plan/1631817354775_image"
											class="img-responsive"
											alt="HTML5 Bootstrap Template by colorlib.com"></a>
										<div class="desc">
											<span><small id="regDate-view"><%=magazine.getRegDate()%></small>
												| <small id="readcount-view">조회수 : <%=magazine.getReadCount()%></small>
												| <small id="writer-view"><%=magazine.getWriter()%></small>
												| <small><%=magazine.getRegion()%></small></span>
											<h3 id="titler-view"><%=magazine.getTitle()%></h3>
											<p class="content-view" id="content-view"><%=magazine.getContent()%></p>
										</div>
									</a>
								</div>
							</div>
							<%
							}
							%>
							<div class="col-md-4 col-sm-6 animate-box"
								data-animate-effect="fadeInLeft">
								<div class="blog-entry">
									<a href="" class="blog-img"><img
										src="https://thumb.wishbeen.com/3pbr3btJDoM1008dCQ812-tyqu4=/218x180/smart/wishbeen-seoul.s3.ap-northeast-2.amazonaws.com/curation/1633148295396_1631148671492_image.jpg"
										class="img-responsive"
										alt="HTML5 Bootstrap Template by colorlib.com"></a>
									<div class="desc">
										<span><small>April 14, 2021 </small> | <small>
												조회수 : 4</small> | <small> Web Design </small> | <small> 조회수
												: 부산</small></span>
										<h3>
											<a href="">Wordpress for a Beginner</a>
										</h3>
										<p>Separated they live in Bookmarksgrove right at the
											coast of the Semantics, a large language ocean.</p>
									</div>
								</div>
							</div>
							<div class="col-md-4 col-sm-6 animate-box"
								data-animate-effect="fadeInLeft">
								<div class="blog-entry">
									<a href="" class="blog-img"><img
										src="https://thumb.wishbeen.com/V6AmhoY4_7grhfP2Fq6NJsDHsYc=/218x180/smart/wishbeen-seoul.s3.ap-northeast-2.amazonaws.com/plan/1578169568028_1577835472120-7.jpg"
										class="img-responsive"
										alt="HTML5 Bootstrap Template by colorlib.com"></a>
									<div class="desc">
										<span><small>April 14, 2021 </small> | <small>
												조회수 : 4</small> | <small> Inspiration </small> | <small> 부산</small></span>
										<h3>
											<a href="">Make website from scratch</a>
										</h3>
										<p>Separated they live in Bookmarksgrove right at the
											coast of the Semantics, a large language ocean.</p>
									</div>
								</div>
							</div>
						</div>

						<div class="row">
							<div class="col-md-4 col-sm-6 animate-box"
								data-animate-effect="fadeInLeft">
								<div class="blog-entry">
									<a href="" class="blog-img"><img
										src="https://thumb.wishbeen.com/fFq0jeNwB60JjGSTYGA2lin08Do=/218x180/smart/wishbeen-seoul.s3.ap-northeast-2.amazonaws.com/plan/1636088539390_%EB%B3%B4%EC%A0%95HGRP0831.jpg"
										class="img-responsive"
										alt="HTML5 Bootstrap Template by colorlib.com"></a>
									<div class="desc">
										<span><small>April 14, 2021 </small> | <small>
												조회수 : 4</small> | <small> Web Design </small> | <small>강원도</small></span>
										<h3>
											<a href="">Renovating National Gallery</a>
										</h3>
										<p>Separated they live in Bookmarksgrove right at the
											coast of the Semantics, a large language ocean.</p>
									</div>
								</div>
							</div>
							<div class="col-md-4 col-sm-6 animate-box"
								data-animate-effect="fadeInLeft">
								<div class="blog-entry">
									<a href="" class="blog-img"><img
										src="https://thumb.wishbeen.com/2VoBnDjWUluDdAtD_AFglTvL82I=/218x180/smart/wishbeen-seoul.s3.ap-northeast-2.amazonaws.com/plan/1590998781889_da62f9d2-0281-4c7b-96cd-720002715625.jpg"
										class="img-responsive"
										alt="HTML5 Bootstrap Template by colorlib.com"></a>
									<div class="desc">
										<span><small>April 14, 2021 </small> | <small>
												조회수 : 4</small> | <small> Web Design </small> | <small> 강원도</small></span>
										<h3>
											<a href="">Wordpress for a Beginner</a>
										</h3>
										<p>Separated they live in Bookmarksgrove right at the
											coast of the Semantics, a large language ocean.</p>
									</div>
								</div>
							</div>
							<div class="col-md-4 col-sm-6 animate-box"
								data-animate-effect="fadeInLeft">
								<div class="blog-entry">
									<a href="" class="blog-img"><img
										src="https://thumb.wishbeen.com/LohzGpIdU0j0-8ovFfrsjQhmlkY=/218x180/smart/wishbeen-seoul.s3.ap-northeast-2.amazonaws.com/plan/1604828240119_1604239678279.jpg"
										class="img-responsive"
										alt="HTML5 Bootstrap Template by colorlib.com"></a>
									<div class="desc">
										<span><small>April 14, 2021 </small> | <small>
												조회수 : 4</small> | <small> Inspiration </small> | <small>제주도</small></span>
										<h3>
											<a href="">Make website from scratch</a>
										</h3>
										<p>Separated they live in Bookmarksgrove right at the
											coast of the Semantics, a large language ocean.</p>
									</div>
								</div>
							</div>
						</div>


						<!-- 매거진 글쓰기 로그인 안된사람에겐 버튼 보이지 않음 -->
						<div>
							<%
							if (loginMember != null) {
							%>

							<input type="button" value="글쓰기"
								class="btn btn-primary btn-learn" id="btn"
								onclick="location.href='<%=request.getContextPath()%>/magazine/magazineForm'" />
							<%
							}
							%>
						</div>
						<!-- 페이지바 -->
						<div id='pageBar'><%=request.getAttribute("pagebar")%></div>


					</div>
				</div>

			</div>
	</div>

	<!-- 푸터 -->
	<footer>
		<div class="footer">
			<p>㈜ Travle Lap</p>
			<p>서울특별시 강남구 강남구 테헤란로14길 6</p>
			<p>사업자 등록번호: 001-01-0001</p>
			<p>고객센터 02)1234-1234</p>
		</div>
	</footer>
	</section>
	<script>
		/**
		 * 검색 div 노출
		 */
		
		$(searchType).change((e) => {
			$(".search-type").hide();
			
			const v = $(e.target).val();
			$("#search-" + v).css("display", "inline-block");
		});
	</script>
	<!-- jQuery -->
	<script src="<%=request.getContextPath()%>/js/magazine/jquery.min.js"></script>
	<!-- jQuery Easing -->
	<script
		src="<%=request.getContextPath()%>/js/magazine/jquery.easing.1.3.js"></script>
	<!-- Bootstrap -->
	<script
		src="<%=request.getContextPath()%>/js/magazine/bootstrap.min.js"></script>
	<!-- Waypoints -->
	<script
		src="<%=request.getContextPath()%>/js/magazine/jquery.waypoints.min.js"></script>
	<!-- Flexslider -->
	<script
		src="<%=request.getContextPath()%>/js/magazine/jquery.flexslider-min.js"></script>
	<!-- Sticky Kit -->
	<script
		src="<%=request.getContextPath()%>/js/magazine/sticky-kit.min.js"></script>
	<!-- Owl carousel -->
	<script
		src="<%=request.getContextPath()%>/js/magazine/owl.carousel.min.js"></script>
	<!-- Counters -->
	<script
		src="<%=request.getContextPath()%>/js/magazine/jquery.countTo.js"></script>


	<!-- MAIN JS -->
	<script src="<%=request.getContextPath()%>/js/magazine/main.js"></script>

</body>
</html>


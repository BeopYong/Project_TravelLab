<%@page import="com.tlab.mvc.magazine.model.vo.MagazineComment"%>
<%@page import="com.tlab.mvc.magazine.model.vo.MagazineAttachment"%>
<%@page import="java.util.List"%>
<%@page import="com.tlab.mvc.magazine.model.vo.Magazine"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ include file="/WEB-INF/views/common/headerr.jsp"%>
<head>
<!-- Required meta tags -->
<meta charset="utf-8">
<meta name="viewport"
	content="width=device-width, initial-scale=1, shrink-to-fit=no">
<link rel="icon" href="img/favicon.png" type="image/png">
<title>129 Beyond Travel Agency</title>
<!-- Bootstrap CSS -->
<link rel="stylesheet"
	href="<%=request.getContextPath()%>/css/magazine/blog/linericon/bootstrap.css">
<link rel="stylesheet"
	href="<%=request.getContextPath()%>/css/magazine/blog/linericon/style.css">
<link rel="stylesheet"
	href="<%=request.getContextPath()%>/css/magazine/blog/linericon/font-awesome.min.css">
<link rel="stylesheet"
	href="<%=request.getContextPath()%>/css/magazine/blog/linericon/owl.carousel.min.css">
<link rel="stylesheet"
	href="<%=request.getContextPath()%>/css/magazine/blog/linericon/nice-select.css">
<link rel="stylesheet"
	href="<%=request.getContextPath()%>/css/magazine/blog/linericon/animate.css">
<link rel="stylesheet"
	href="<%=request.getContextPath()%>/css/magazine/blog/linericon/jquery-ui.css">
<!-- <link rel="stylesheet" href="<%=request.getContextPath()%>/vendors/popup/magnific-popup.css">-->
<link rel="stylesheet"
	href="<%=request.getContextPath()%>/css/magazine/blog/linericon/swiper.min.css">
<link rel="stylesheet"
	href="<%=request.getContextPath()%>/css/magazine/blog/linericon/jquery.mCustomScrollbar.css">
<!-- main css -->
<link rel="stylesheet" href="css/style.css">
</head>

<body>
	<%
	Magazine magazine = (Magazine) request.getAttribute("magazine");

	boolean editable = loginMember != null && (
					  loginMember.getMemberId().equals(magazine.getWriter())
					  || MemberService.ADMIN_ROLE.equals(loginMember.getMemberRole())
					);
	System.out.println("editable@magazineView.jsp = " + editable);
%>

	<!--================Blog Area =================-->
	<section class="blog_area single-post-area section_gap">
		<div class="container">
			<div class="row">
				<div class="col-lg-8 posts-list">
					<div class="single-post row">
						<div class="col-lg-12">
							<div class="feature-img">
								<img class="img-fluid"
									src="https://technext.github.io/beyond/img/blog/feature-img1.jpg"
									alt="">
							</div>
						</div>
						<div class="col-lg-3  col-md-3">
							<div class="blog_info text-right">
								<div class="post_tag">

									<a class="active" href="#"><%=magazine.getRegion()%></a>

								</div>
								<ul class="blog_meta list">
									<li><a href="#"><%=magazine.getWriter()%></a></li>
									<li><a href="#"><%=magazine.getRegDate()%></a></li>
									<li><a href="#">조회수 : <%=magazine.getReadCount()%></a></li>

								</ul>

							</div>
						</div>
						<div class="col-lg-9 col-md-9 blog_details">
							<h2><%=magazine.getTitle()%></h2>
							<p class="excert">
								<%=magazine.getContent()%>
							</p>
							<p>Boot camps have its supporters and its detractors. Some
								people do not understand why you should have to spend money on
								boot camp when you can get the MCSE study materials yourself at
								a fraction of the camp price. However, who has the willpower to
								actually sit through a self-imposed MCSE training. who has the
								willpower to actually sit through a self-imposed</p>
							<p>Boot camps have its supporters and its detractors. Some
								people do not understand why you should have to spend money on
								boot camp when you can get the MCSE study materials yourself at
								a fraction of the camp price. However, who has the willpower to
								actually sit through a self-imposed MCSE training. who has the
								willpower to actually sit through a self-imposed</p>

						</div>
						<div class="col-lg-12">
							<div class="quotes"></div>
							<div class="row">
								<div class="col-6">
									<img class="img-fluid"
										src="https://thumb.wishbeen.com/li9dEDRJaRl2k_UUdwEehlLa2eE=/218x180/smart/wishbeen-seoul.s3.ap-northeast-2.amazonaws.com/plan/1576363375459_3c70c8f6-a6f6-4091-a3c1-3012fa8fe446.jpg"
										alt="">
								</div>
								<div class="col-6">
									<img class="img-fluid"
										src="https://thumb.wishbeen.com/pT-0348xohSMMDJQ3Jw9njO8_v8=/218x180/smart/wishbeen-seoul.s3.ap-northeast-2.amazonaws.com/plan/1569382643397_1569380215959.jpg"
										alt="">
								</div>
								<div class="col-lg-12 mt-25">
									<p>MCSE boot camps have its supporters and its detractors.
										Some people do not understand why you should have to spend
										money on boot camp when you can get the MCSE study materials
										yourself at a fraction of the camp price. However, who has the
										willpower.</p>
									<p>MCSE boot camps have its supporters and its detractors.
										Some people do not understand why you should have to spend
										money on boot camp when you can get the MCSE study materials
										yourself at a fraction of the camp price. However, who has the
										willpower.</p>
								</div>
							</div>
						</div>
					</div>
					<%
                    if (editable) {
                    %>
					<br />
					<div id="wrap" align="center">

						<%-- 작성자와 관리자만 마지막행 수정/삭제버튼이 보일수 있게 할 것 --%>

						<input type="button" value="수정하기" class="btn-reply text-uppercase"
							onclick="updateMagazine()"> <input type="button"
							value="삭제하기" class="btn-reply text-uppercase"
							onclick="deleteMagazine()">
						<%
                        }
                        %>
						<input type="button" value="목록" class="btn-reply text-uppercase"
							onclick="location.href = '<%=request.getContextPath()%>/magazine/magazineList';" />

						<div class="navigation-area">
							<div class="row"></div>
						</div>
					</div>
				</div>
			</div>
		</div>
	</section>
	<!--================Blog Area =================-->
	<!-- 글쓴이 또는 관리자만 deletemagazine 권한생성 -->
	<%
if (editable) {
%>
	<form action="<%=request.getContextPath()%>/magazine/magazineDelete"
		name="deleteMagazineFrm">
		<input type="hidden" name="magazineNo" value="<%=magazine.getNo()%>" />
	</form>
	<script>
const updateMagazine = () => {
	location.href = "<%=request.getContextPath()%>/magazine/magazineUpdate?no=<%=magazine.getNo()%>";
};

const deleteMagazine = () => {
	//게시물 삭제 재확인
	if(confirm("이 게시물을 정말 삭제하시겠습니까?")){
		$(document.deleteMagazineFrm).submit();		
	}
};

</script>
	<%
}
%>

	<script>

const loginAlert = () => {
	alert("로그인후 사용가능합니다.");
	$(memberId).focus();
};
</script>
	<!--================ End footer Area  =================-->


	<!-- Optional JavaScript -->
	<!-- jQuery first, then Popper.js, then Bootstrap JS -->
	<script
		src="<%=request.getContextPath()%>/js/magazine/jquery-3.2.1.min.js"></script>
	<script src="<%=request.getContextPath()%>/js/magazine/popper.js"></script>
	<script
		src="<%=request.getContextPath()%>/js/magazine/bootstrap.min.js"></script>
	<script src="<%=request.getContextPath()%>/js/magazine/stellar.js"></script>
	<script
		src="<%=request.getContextPath()%>/js/magazine/jquery.nice-select.min.js"></script>
	<script
		src="<%=request.getContextPath()%>/js/magazine/imagesloaded.pkgd.min.js"></script>
	<script src="<%=request.getContextPath()%>/js/magazine/isotope-min.js"></script>
	<script
		src="<%=request.getContextPath()%>/js/magazine/owl.carousel.min.js"></script>
	<script src="<%=request.getContextPath()%>/js/magazine/jquery-ui.js"></script>
	<script
		src="<%=request.getContextPath()%>/js/magazine/jquery.ajaxchimp.min.js"></script>
	<script src="<%=request.getContextPath()%>/js/magazine/mail-script.js"></script>
	<script
		src="<%=request.getContextPath()%>/vendors/popup/jquery.magnific-popup.min.js"></script>
	<!--<script src="<%=request.getContextPath()%>/vendors/swiper/js/swiper.min.js"></script>-->
	<script
		src="<%=request.getContextPath()%>/js/magazine/jquery.mCustomScrollbar.js"></script>
	<script src="<%=request.getContextPath()%>/js/magazine/theme.js"></script>

	<%@ include file="/WEB-INF/views/common/footer.jsp"%>

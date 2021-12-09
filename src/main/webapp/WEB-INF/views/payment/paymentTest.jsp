<%@page import="com.tlab.mvc.payment.model.vo.Payment"%>
<%@page import="java.text.DecimalFormat"%>
<%@page import="java.util.List"%>
<%@page import="com.tlab.mvc.member.model.vo.Member"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%
Member loginMember = (Member) session.getAttribute("loginMember");
List<Payment> list = (List<Payment>) request.getAttribute("list");
DecimalFormat dFormat = new DecimalFormat("###,###");
%>
<!DOCTYPE html>
<html lang="en">
<head>
<meta charset="UTF-8">
<meta name="viewport"
	content="width=device-width, initial-scale=1, shrink-to-fit=no">
<link
	href="https://fonts.googleapis.com/css2?family=Spectral:ital,wght@0,200;0,300;0,400;0,500;0,700;0,800;1,200;1,300;1,400;1,500;1,700&display=swap"
	rel="stylesheet">
<link rel="stylesheet"
	href="https://stackpath.bootstrapcdn.com/font-awesome/4.7.0/<%=request.getContextPath()%>/css/cartList/font-awesome.min.css">
<link rel="stylesheet"
	href="<%=request.getContextPath()%>/css/cartList/animate.css">
<link rel="stylesheet"
	href="<%=request.getContextPath()%>/css/cartList/owl.carousel.min.css">
<link rel="stylesheet"
	href="<%=request.getContextPath()%>/css/cartList/owl.theme.default.min.css">
<link rel="stylesheet"
	href="<%=request.getContextPath()%>/css/cartList/magnific-popup.css">
<link rel="stylesheet"
	href="https://cdnjs.cloudflare.com/ajax/libs/bootstrap-select/1.13.1/<%=request.getContextPath()%>/css/cartList/bootstrap-select.min.css">
<link rel="stylesheet"
	href="<%=request.getContextPath()%>/css/cartList/flaticon.css">
<link rel="stylesheet"
	href="<%=request.getContextPath()%>/css/cartList/style.css">
<title>PaymentList</title>
</head>
<body>
	<div class="wrap">
		<div class="container">
			<!-- 우측으로 배치. 로그인해서 장바구니페이지로 넘어오면 loginMember.getMemberId() 찍히게 -->
			<div class="reg">
				<p class="mb-0">
					<a href="#" class="mr-2">[ <%=loginMember.getMemberName()%>
						]님, 안녕하세요
					</a>
				</p>
			</div>
		</div>
	</div>
	</div>
	</div>

	<nav
		class="navbar navbar-expand-lg navbar-dark ftco_navbar bg-dark ftco-navbar-light"
		id="ftco-navbar">
		<div class="container">
			<a class="navbar-brand" href="index.html">Travel <span>Lab</span></a>
			<div class="order-lg-last btn-group"></div>
			<div class="collapse navbar-collapse" id="ftco-nav">
				<ul class="navbar-nav ml-auto">
					<li class="nav-item"><a href="<%=request.getContextPath()%>"
						class="nav-link">Home</a></li>
					<li class="nav-item"><a href="#" class="nav-link">About</a></li>
					<li class="nav-item"><a href="#" class="nav-link">Product</a></li>
			</div>
		</div>
	</nav>
	<!-- END nav -->

	<section class="hero-wrap hero-wrap-2"
		style="background-color: #02BEDE;" data-stellar-background-ratio="0.5">
		<div class="overlay"></div>
		<div class="container">
			<div
				class="row no-gutters slider-text align-items-end justify-content-center">
				<div class="col-md-9 ftco-animate mb-5 text-center">
					<h2 class="mb-0 bread">My Payment</h2>
				</div>
			</div>
		</div>
	</section>
	<section class="ftco-section">
		<div class="container">
			<div class="row">
				<div class="table-wrap">
					<table class="table">
						<thead class="thead-primary">
							<tr>
								<th>MemberId</th>
								<th>OrderCode</th>
								<th>Product</th>
								<th>Quantity</th>
								<th>TotalPrice</th>
								<th>&nbsp;</th>
							</tr>
						</thead>
						<tbody>
							<%
							for (Payment payment : list) {
								int sum = 0;
							%>
							<tr class="alert" role="alert">
								<td>
									<!--  -->
									<div class="email">
										<span><%=payment.getMemberId()%></span> <span></span>
									</div>
								</td>
								<td>
									<!--  -->
									<div class="email">
										<span><%=payment.getOrderCode()%></span> <span></span>
									</div>
								</td>
								<!--  -->
								<td><%=payment.getProductName()%></td>
								<td><%=payment.getQuantity()%></td>
								<!-- 상품별 총 금액 -->
								<td><%=dFormat.format(payment.getTotalBill())%>원</td>
								<td>
									<!-- <button type="button" class="close" data-dismiss="alert" aria-label="Close">
				            	<span aria-hidden="true"><i class="fa fa-close"></i></span>
				          	</button> -->
								</td>
							</tr>
							<%
							}
							%>
						</tbody>
					</table>
				</div>
			</div>
		</div>
	</section>


	<!-- loader -->
	<div id="ftco-loader" class="show fullscreen">
		<svg class="circular" width="48px" height="48px">
			<circle class="path-bg" cx="24" cy="24" r="22" fill="none"
				stroke-width="4" stroke="#eeeeee" />
			<circle class="path" cx="24" cy="24" r="22" fill="none"
				stroke-width="4" stroke-miterlimit="10" stroke="#F96D00" /></svg>
	</div>

	<script src="<%=request.getContextPath()%>/js/cartList/jquery.min.js"></script>
	<script
		src="<%=request.getContextPath()%>/js/cartList/jquery-migrate-3.0.1.min.js"></script>
	<script src="<%=request.getContextPath()%>/js/cartList/popper.min.js"></script>
	<script
		src="<%=request.getContextPath()%>/js/cartList/bootstrap.min.js"></script>
	<script
		src="<%=request.getContextPath()%>/js/cartList/jquery.easing.1.3.js"></script>
	<script
		src="<%=request.getContextPath()%>/js/cartList/jquery.waypoints.min.js"></script>
	<script
		src="<%=request.getContextPath()%>/js/cartList/jquery.stellar.min.js"></script>
	<script
		src="<%=request.getContextPath()%>/js/cartList/owl.carousel.min.js"></script>
	<script
		src="<%=request.getContextPath()%>/js/cartList/jquery.magnific-popup.min.js"></script>
	<script
		src="<%=request.getContextPath()%>/js/cartList/jquery.animateNumber.min.js"></script>
	<script
		src="<%=request.getContextPath()%>/js/cartList/scrollax.min.js"></script>
	<script
		src="https://maps.googleapis.com/maps/api/js?key=AIzaSyBVWaKrjvy3MaE7SQ74_uJiULgl1JY0H2s&sensor=false"></script>
	<script src="<%=request.getContextPath()%>/js/cartList/google-map.js"></script>
	<script
		src="https://cdnjs.cloudflare.com/ajax/libs/bootstrap-select/1.13.1/<%=request.getContextPath()%>/js/cartList/bootstrap-select.min.js"></script>
	<script src="<%=request.getContextPath()%>/js/cartList/main.js"></script>
</body>
</html>
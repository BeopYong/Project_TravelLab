<%@page import="com.tlab.mvc.magazine.model.vo.Magazine"%>
<%@page import="java.util.List"%>
<%@page import="com.tlab.mvc.member.model.vo.Member"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%
	Member loginMember = (Member) session.getAttribute("loginMember");
	List<Magazine> list = (List<Magazine>) request.getAttribute("list");
	String searchType = request.getParameter("searchType");
	String searchKeyword = request.getParameter("searchKeyword");
%>
<link rel="stylesheet" href="<%=request.getContextPath()%>/css/manageMagazineList.css" />
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
	/* background-color: #B6EAE4; */
	display: block;
    margin: auto;
    width: 70%;
}

div#search-cateCode {
	display: <%=searchType == null || "cateCode".equals(searchType) ? "inline-block" : "none"%>;
}

div#search-writer {
	display: <%="writer".equals(searchType) ? "inline-block" : "none"%>;
}
div#search-title {
	display: <%="title".equals(searchType) ? "inline-block" : "none"%>;
}
</style>
<!DOCTYPE html>
<html lang="en">
<head>
<meta charset="UTF-8">
<meta name="viewport" content="width=device-width, initial-scale=1, shrink-to-fit=no">
<link href="https://fonts.googleapis.com/css2?family=Spectral:ital,wght@0,200;0,300;0,400;0,500;0,700;0,800;1,200;1,300;1,400;1,500;1,700&display=swap" rel="stylesheet">
<link rel="stylesheet" href="https://stackpath.bootstrapcdn.com/font-awesome/4.7.0/<%=request.getContextPath() %>/css/cartList/font-awesome.min.css">
<link rel="stylesheet" href="<%=request.getContextPath() %>/css/cartList/animate.css">
<link rel="stylesheet" href="<%=request.getContextPath() %>/css/cartList/owl.carousel.min.css">
<link rel="stylesheet" href="<%=request.getContextPath() %>/css/cartList/owl.theme.default.min.css">
<link rel="stylesheet" href="<%=request.getContextPath() %>/css/cartList/magnific-popup.css">
<link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/bootstrap-select/1.13.1/<%=request.getContextPath() %>/css/cartList/bootstrap-select.min.css">
<link rel="stylesheet" href="<%=request.getContextPath() %>/css/cartList/flaticon.css">
<link rel="stylesheet" href="<%=request.getContextPath() %>/css/cartList/style.css">
<title>AdminProductList</title>
</head>
<body>
	<div class="wrap">
			<div class="container">
		        <div class="reg">
		        	<p class="mb-0"><a href="#" class="mr-2">[ <%= loginMember.getMemberName() %> ]님, 안녕하세요</a></p>
		        </div>
					</div>
				</div>
			</div>
		</div>
    
	  <nav class="navbar navbar-expand-lg navbar-dark ftco_navbar bg-dark ftco-navbar-light" id="ftco-navbar">
	    <div class="container">
	      <a class="navbar-brand" href="index.html">Travel <span>Lab</span></a>
	      <div class="order-lg-last btn-group">
        </div>
	      <div class="collapse navbar-collapse" id="ftco-nav">
	        <ul class="navbar-nav ml-auto">
	          <li class="nav-item"><a href="<%= request.getContextPath() %>" class="nav-link">Home</a></li>
	          <li class="nav-item"><a href="#" class="nav-link">About</a></li>
              <li class="nav-item"><a href="#" class="nav-link">Product</a></li>
	      </div>
	    </div>
	  </nav>
    <!-- END nav -->
    
    <section class="hero-wrap hero-wrap-2" style="background-color: #02BEDE;" data-stellar-background-ratio="0.5">
      <div class="overlay"></div>
      <div class="container">
        <div class="row no-gutters slider-text align-items-end justify-content-center">
          <div class="col-md-9 ftco-animate mb-5 text-center">
            <h2 class="mb-0 bread">Manage Magazine</h2>
          </div>
        </div>
      </div>
    </section>

<section id="magazineList-container">
	<h2>매거진관리</h2>

	<div id="search-container">
		<label for="searchType">검색타입 :</label> <select id="searchType">
			<option value="cateCode"
				<%="cateCode".equals(searchType) ? "selected" : ""%>>지역번호</option>
			<option value="writer"
				<%="writer".equals(searchType) ? "selected" : ""%>>작성자</option>
			<option value="title"
				<%="title".equals(searchType) ? "selected" : ""%>>제목</option>
		</select>
		<div id="search-cateCode" class="search-type">
			<form action="<%=request.getContextPath()%>/admin/magazineFinder">
				<input type="hidden" name="searchType" value="cateCode" /> <input
					type="text" name="searchKeyword"
					value="<%="cateCode".equals(searchType) ? searchKeyword : ""%>"
					size="25" placeholder="검색할 지역번호를 입력하세요." />
				<button type="submit">검색</button>
			</form>
		</div>
		<div id="search-writer" class="search-type">
			<form action="<%=request.getContextPath()%>/admin/magazineFinder">
				<input type="hidden" name="searchType" value="writer" /> <input
					type="text" name="searchKeyword"
					value="<%="writer".equals(searchType) ? searchKeyword : ""%>"
					size="25" placeholder="검색할 작성자를 입력하세요." />
				<button type="submit">검색</button>
			</form>
		</div>
		<div id="search-title" class="search-type">
			<form action="<%=request.getContextPath()%>/admin/magazineFinder">
				<input type="hidden" name="searchType" value="title" /> <input
					type="text" name="searchKeyword"
					value="<%="title".equals(searchType) ? searchKeyword : ""%>"
					size="25" placeholder="검색할 제목을 입력하세요." />
				<button type="submit">검색</button>
			</form>
		</div>
	</div>
    	<div class="container">
    		<div class="row">
    			<div class="table-wrap">
						<table class="table">
						  <thead class="thead-primary">
						    <tr>
                                <th>작성자</th>
                                <th>제목</th>
                                <th>지역번호</th>
                                <th>유효</th>
                                <th>등록날짜</th>
                                <th>실행</th>
                                <th>&nbsp;</th>
                                <th>&nbsp;</th>
						    </tr>
						  </thead>
						  <tbody>
                   		<%
						for (Magazine magazine : list) {
							int sum = 0;
						%>
						    <tr class="alert" role="alert">
						      <td>
                                  <!--  -->
						      	<div class="email">
						      		<span><%=magazine.getWriter()%></span>
						      		<span></span>
						      	</div>
						      </td>
						      <td>
                                  <!--  -->
						      	<div class="email">
						      		<span><%=magazine.getTitle()%></span>
						      		<span></span>
						      	</div>
				        	</td>
				        	<td>
                                  <!--  -->
						      	<div class="email">
						      		<span><%=magazine.getRegion() != null ? magazine.getRegion() : ""%></span>
						      		<span></span>
						      	</div>
						      </td>
				      <td style="table-layout: fixed">
					 <form name="magazineValidUpdateFrm"
						action="<%=request.getContextPath()%>/admin/magazineValidUpdate"
						method="POST">
						<input type="hidden" name="writer"
							value="<%= magazine.getWriter() %>" /> 
						<select name="magazineValid" class="magazine-valid">
							<option value="Y"
								<%="Y".equals(magazine.getValid()) ? "selected" : ""%>>Y</option>
							<option value="N"
								<%="N".equals(magazine.getValid()) ? "selected" : ""%>>N</option>
						</select>
					</form> 
				</td>
						      <td>
						      <div class="email">
						      		<span><%=magazine.getRegDate()%></span>
						      		<span></span>
						      	</div>
						      </td>
						      <td>
						      <div class="email">
						      		<button onclick="deleteMagazine()">삭제</button>
						      	</div>
						      </td>
						    </tr>
					    <%
						}
						%>
		</form>
						  </tbody>
						</table>
					</div>
    		</div>
    	</div>
    <div id="pageBar">
		<%=request.getAttribute("pagebar")%>
	</div>
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


$(".magazine-valid").change((e) => {
	const $select = $(e.target);
	const magazineValid = $select.val();
	console.log(magazineValid);
	if(confirm(`상품의 구매가능 여부를 [\${magazineValid}]로 변경하시겠습니까?`)){
		const $frm = $select.parent();
		$frm.submit();
	}
	else {
		// selected 초기값으로 복원
		$select.children("[selected]").prop("selected", true);
	}
});
</script>
  <!-- loader -->
  <div id="ftco-loader" class="show fullscreen"><svg class="circular" width="48px" height="48px"><circle class="path-bg" cx="24" cy="24" r="22" fill="none" stroke-width="4" stroke="#eeeeee"/><circle class="path" cx="24" cy="24" r="22" fill="none" stroke-width="4" stroke-miterlimit="10" stroke="#F96D00"/></svg></div>

  <script src="<%=request.getContextPath() %>/js/cartList/jquery.min.js"></script>
  <script src="<%=request.getContextPath() %>/js/cartList/jquery-migrate-3.0.1.min.js"></script>
  <script src="<%=request.getContextPath() %>/js/cartList/popper.min.js"></script>
  <script src="<%=request.getContextPath() %>/js/cartList/bootstrap.min.js"></script>
  <script src="<%=request.getContextPath() %>/js/cartList/jquery.easing.1.3.js"></script>
  <script src="<%=request.getContextPath() %>/js/cartList/jquery.waypoints.min.js"></script>
  <script src="<%=request.getContextPath() %>/js/cartList/jquery.stellar.min.js"></script>
  <script src="<%=request.getContextPath() %>/js/cartList/owl.carousel.min.js"></script>
  <script src="<%=request.getContextPath() %>/js/cartList/jquery.magnific-popup.min.js"></script>
  <script src="<%=request.getContextPath() %>/js/cartList/jquery.animateNumber.min.js"></script>
  <script src="<%=request.getContextPath() %>/js/cartList/scrollax.min.js"></script>
  <script src="https://maps.googleapis.com/maps/api/js?key=AIzaSyBVWaKrjvy3MaE7SQ74_uJiULgl1JY0H2s&sensor=false"></script>
  <script src="<%=request.getContextPath() %>/js/cartList/google-map.js"></script>
  <script src="https://cdnjs.cloudflare.com/ajax/libs/bootstrap-select/1.13.1/<%=request.getContextPath() %>/js/cartList/bootstrap-select.min.js"></script>
  <script src="<%=request.getContextPath() %>/js/cartList/main.js"></script>
</body>
</html>
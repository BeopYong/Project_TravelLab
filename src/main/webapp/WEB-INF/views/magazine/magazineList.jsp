<%@page import="com.tlab.mvc.magazine.model.vo.Magazine"%>
<%@page import="com.tlab.mvc.magazine.model.vo.MagazineEntity"%>
<%@page import="java.util.List"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ include file="/WEB-INF/views/common/header.jsp"%>
<%
	List<Magazine> list = (List<Magazine>) request.getAttribute("list");
	String searchType = request.getParameter("searchType");
	String searchKeyword = request.getParameter("searchKeyword");
%>
<!-- <link rel="stylesheet" href="<%=request.getContextPath()%>/css/board.css" /> -->
<link rel="stylesheet"
	href="<%=request.getContextPath()%>/css/magazine.css" />
	
<!-- 매거진 리스트 전체페이지 -->
<section id="magazineForm-container" class="magazine-container">

	<h2>MAGAZINE</h2>
	
	<!-- 매거진 검색 영역 -->
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
			<form action="<%=request.getContextPath()%>/magazine/magazineFinder">
				<input type="hidden" name="searchType" value="region" /> <input
					type="text" name="searchKeyword"
					value="<%="region".equals(searchType) ? searchKeyword : ""%>"
					size="25" placeholder="검색할 지역를 입력하세요." />
				<button id="btn" type="submit">검색</button>
			</form>
		</div>
		<div id="search-writer" class="search-type">
			<form action="<%=request.getContextPath()%>/magazine/magazineFinder">
				<input type="hidden" name="searchType" value="writer" /> <input
					type="text" name="searchKeyword"
					value="<%="writer".equals(searchType) ? searchKeyword : ""%>"
					size="25" placeholder="검색할 작성자를 입력하세요." />
				<button id="btn" type="submit">검색</button>
			</form>
		</div>
		<div id="search-title" class="search-type">
			<form action="<%=request.getContextPath()%>/magazine/magazineFinder">
				<input type="hidden" name="searchType" value="title" /> <input
					type="text" name="searchKeyword"
					value="<%="title".equals(searchType) ? searchKeyword : ""%>"
					size="25" placeholder="검색할 제목을 입력하세요." />
				<button id="btn" type="submit">검색</button>
			</form>
		</div>
	</div>
	
	<!-- 매거진 내용 상세페이지에 들어가기위해 일단 내용입력해놓음-->	
	
	
		<%
		for (Magazine magazine : list) {
		%>
		<div class="magazineList-wrap">
			<ul class="magazineList">
				<li>
				</li>
				<li>
					<a href=""><img src="<%= request.getContextPath() %>/images/magazine/kangwondo.jpg" alt="<%= magazine.getNo() %>" /></a>
					
					<a href="<%=request.getContextPath()%>/magazine/magazineView?no=<%=magazine.getNo()%>" id="magazinelist-view">
						<em><%=magazine.getNo()%></em>
						<strong id="title"><%=magazine.getTitle() %></strong>
						<h5 id="writer"><%=magazine.getWriter()%></h5>
						<p id="content"><%=magazine.getContent() %></p>
						
						<div class="source-box">
							<span class="region"><%= magazine.getRegion() %></span>
							<span class="readCount"><%= magazine.getReadCount() %></span>
							<span class="date"><%= magazine.getRegDate() %></span>							
						</div>
					</a>
				</li>
			</ul>
			
		</div>
		<%
		}
		%>	
	
	
	
	<!-- 매거진 글쓰기 로그인 안된사람에겐 버튼 보이지 않음 -->
	<div>
		<%
		if (loginMember != null) {
		%>

		<input type="button" value="글쓰기" class="btn-add" id="btn"
			onclick="location.href='<%=request.getContextPath()%>/magazine/magazineForm'" />
		<%
		}
		%>
	</div>
	
	<!-- 페이지바 -->
	<div id='pageBar'><%=request.getAttribute("pagebar")%></div>

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
<%@ include file="/WEB-INF/views/common/footer.jsp"%>

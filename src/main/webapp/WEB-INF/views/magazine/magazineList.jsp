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
<!-- 매거진 전체페이지 -->
<section id="magazineForm-container" class="magazine-container">

	<h2>MAGAZINE</h2>

	<div id="search-container">
		<label for="searchType">검색타입 :</label> <select id="searchType">
			<option value="region" 
				<%="region".equals(searchType) ? "selected" : ""%>>지역번호</option>
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
				<button type="submit">검색</button>
			</form>
		</div>
		<div id="search-writer" class="search-type">
			<form action="<%=request.getContextPath()%>/magazine/magazineFinder">
				<input type="hidden" name="searchType" value="writer" /> <input
					type="text" name="searchKeyword"
					value="<%="writer".equals(searchType) ? searchKeyword : ""%>"
					size="25" placeholder="검색할 작성자를 입력하세요." />
				<button type="submit">검색</button>
			</form>
		</div>
		<div id="search-title" class="search-type">
			<form action="<%=request.getContextPath()%>/magazine/magazineFinder">
				<input type="hidden" name="searchType" value="title" /> <input
					type="text" name="searchKeyword"
					value="<%="title".equals(searchType) ? searchKeyword : ""%>"
					size="25" placeholder="검색할 제목을 입력하세요." />
				<button type="submit">검색</button>
			</form>
		</div>
	</div>
	
	<!-- 매거진 내용 상세페이지에 들어가기위해 일단 내용입력해놓음-->
	<table id="tbl-magazine">
		<tr>
			<th>번호</th>
			<th>제목</th>
			<th>아이디</th>
			<th>작성일</th>
			<th>첨부파일</th>
			<th>조회수</th>
			<th>추천수</th>
		</tr>


		<%
		for (Magazine magazine : list) {
		%>
		<tr>
			<td><%=magazine.getNo()%></td>
			<td><a
				href="<%=request.getContextPath()%>/magazine/magazineView?no=<%=magazine.getNo()%>"><%=magazine.getTitle()%></a>
				<%=magazine.getCommentCount() > 0 ? "(" + magazine.getCommentCount() + ")" : ""%>
			</td>
			<td><%=magazine.getWriter()%></td>
			<td><%=magazine.getRegDate()%></td>
			<td>
				<%
				if (magazine.getAttachCount() > 0) {
				%> <img alt=""
				src="<%=request.getContextPath()%>" width="16px" /> <%
 }
 %>
			</td>

			<td><%=magazine.getReadCount()%></td>

			<td></td>
		</tr>

		<%
		}
		%>
	</table>
	<div>
		<!-- 매거진 글쓰기 로그인 안된사람에겐 버튼 보이지 않음 -->
		<%
		if (loginMember != null) {
		%>

		<input type="button" value="글쓰기" id="btn-add"
			onclick="location.href='<%=request.getContextPath()%>/magazine/magazineForm'" />
		<%
		}
		%>
	</div>
	<!-- 페이지바 -->
	<div id='pageBar'><%=request.getAttribute("pagebar")%></div>

</section>
<script>
$("#searchType").change((e) => {
// e.target : 이벤트 발생 객체 -> #searchType
const type = $(e.target).val();
console.log(type);
	
// 1. .search-type 감추기
$(".search-type").hide();
	
// 2. #search-${type} 보여주기(diplay:inline-block)
// \$ : $를 escaping
$(`#search-\${type}`).css("display", "inline-block");
});
</script>
<%@ include file="/WEB-INF/views/common/footer.jsp"%>

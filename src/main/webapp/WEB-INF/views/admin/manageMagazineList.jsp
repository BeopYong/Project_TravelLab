<%@page import="com.tlab.mvc.magazine.model.vo.Magazine"%>
<%@page import="java.util.List"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%
List<Magazine> list = (List<Magazine>) request.getAttribute("list");
String searchType = request.getParameter("searchType");
String searchKeyword = request.getParameter("searchKeyword");
%>
<%@ include file="/WEB-INF/views/common/header.jsp"%>
<!-- 관리자용 admin.css link -->
<link rel="stylesheet"
	href="<%=request.getContextPath()%>/css/manageMagazineList.css" />
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
	background-color: #B6EAE4;
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
}

</style>

<section id="magazineList-container">
	<h2>상품관리</h2>

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


	<table id="tbl-magazine">
		<thead>
			<tr>
				<th class="writer" style="table-layout: fixed">작성자</th>
				<th class="title" style="table-layout: fixed">제목</th>
				<th class="region" style="table-layout: fixed">지역번호</th>
				<th class="content" style="table-layout: fixed">내용</th>
				<th class="valid" style="table-layout: fixed">유효</th>
				<th class="regDate" style="table-layout: fixed">등록날짜</th>
				<th class="execute" style="table-layout: fixed">실행</th>
			</tr>
		</thead>
		<tbody>
			<%
			for (Magazine magazine : list) {
			%>
			<tr>
				<td width="40px" style="table-layout: fixed"><%=magazine.getWriter()%></td>
				<td width="40px" style="table-layout: fixed"><%=magazine.getTitle()%></td>
				<td width="40px" style="table-layout: fixed"><%=magazine.getRegion() != null ? magazine.getRegion() : ""%></td>
				<td width="150px" style="table-layout: fixed"><%=magazine.getContent()%></td>
				
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
				<td width="40px" style="table-layout: fixed"><%=magazine.getRegDate()%></td>
				<td width="40px" style="table-layout: fixed"><button onclick="deleteMagazine()">삭제</button></td>
			</tr>
			<%
			}
			%>
		</tbody>
	</table>
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
<%@ include file="/WEB-INF/views/common/footer.jsp"%>
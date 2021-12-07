<%@page import="java.util.List"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@page import="com.tlab.mvc.magazine.model.service.MagazineService"%>
<%@page import="com.tlab.mvc.magazine.model.vo.Magazine"%>
<%
List<Magazine> list = (List<Magazine>) request.getAttribute("list");
System.out.println("memberList@memberList.jsp" + list);

/* HttpSession session = request.getSession(); */
%>
<%@ include file="/WEB-INF/views/common/header.jsp"%>

<!-- 관리자용 admin.css link -->
<link rel="stylesheet"
	href="<%=request.getContextPath()%>/css/memberList.css" />
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

</style>
<section id="memberList-container">
	<h2>회원관리</h2>

	<div id="search-container">
		
	</div>


	<table id="tbl-member">
		<thead>
			<tr>
				<th class="member-id" style="table-layout: fixed">번호</th>
				<th class="member-name" style="table-layout: fixed">작가</th>
				<th style="table-layout: fixed">제목</th>
				<th style="table-layout: fixed">지역</th>
				<th style="table-layout: fixed">등록일</th>
			</tr>
		</thead>
		<tbody>
			<%
			for (Magazine magazine : list) {
			%>
			<tr>
				<td width="100px" style="table-layout: fixed"><%=magazine.getNo()%></td>
				<td width="40px" style="table-layout: fixed"><%=magazine.getWriter()%></td>
				<td style="table-layout: fixed">
					<%=magazine.getTitle()%>
				</td>
				<td width="180px" style="table-layout: fixed"><%=magazine.getRegion()%></td>
				<td style="table-layout: fixed"><%=magazine.getRegDate()%></td>
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


</script>
<%@ include file="/WEB-INF/views/common/footer.jsp"%>







<%@page import="com.tlab.mvc.magazine.model.vo.Magazine"%>
<%@page import="java.util.List"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ include file="/WEB-INF/views/common/header.jsp" %>

<section id="megazine-container">
	<h2>매거진</h2>
	

<!-- 매거진 내용 상세페이지에 들어가기위해 일단 내용입력해놓음-->
	<table>
		<tr>
			<th>번호</th>
			<th>제목</th>
			<th>아이디</th>
			<th>작성일</th>
			<th>추천수</th>
			<th>조회수</th>
		
			<th>첨부파일</th>
		</tr>
		
<%
	List<Magazine> list = (List<Magazine>) request.getAttribute("list");
	for(Magazine magazine : list) {
%>
		<tr>
			<td><%= magazine.getNo() %></td>
			<!-- 매거진 제목 ~님의 레시피로 바꾸기 -->
			<td><%= magazine.getTitle() %></td>
			<td><%= magazine.getWriter() %></td>
			<td><%= magazine.getRegDate() %></td>
			<td></td>
			<td><%= magazine.getReadCount() %></td>
			
			<td></td>
		</tr>


<%
	}
%>

	</table>
	

		

<!-- 매거진 글쓰기 로그인 안된사람에겐 버튼 보이지 않음 -->
<% if(loginMember != null) { %>
	<input type="button" value="글쓰기" id="btn-add" onclick="location.href='<%= request.getContextPath() %>/magazine/magazineForm'"/>
<% } %>
	
<!-- 페이지바 -->	
	<div id='pageBar'><%= request.getAttribute("pagebar") %></div>
	
</section>			
<%@ include file="/WEB-INF/views/common/footer.jsp" %>
    
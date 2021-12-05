<%@page import="com.tlab.mvc.magazine.model.vo.Magazine"%>
<%@page import="java.util.List"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ include file="/WEB-INF/views/common/header.jsp" %>
<%
	String searchType = request.getParameter("searchType");
%>
<link rel="stylesheet" href="<%=request.getContextPath()%>/css/board.css" />
<!-- 매거진 전체페이지 -->
<section id="megazine-container" class="csboard-container">
		
	<h2>MAGAZINE</h2>
	
	<div class="serarch-container">
		<select name="" id="serchType">
			<option value="region" <%= "region".equals(searchType) ? "selected" : "" %>>지역</option>
		</select>
	</div>
<!-- 매거진 내용 상세페이지에 들어가기위해 일단 내용입력해놓음-->
	<table id ="tbl-magazine">
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
	List<Magazine> list = (List<Magazine>) request.getAttribute("list");
	for(Magazine magazine : list) {
%>
		<tr>
			<td><%= magazine.getNo() %></td>
			<td>
				<a href="<%= request.getContextPath() %>/magazine/magazineView?no=<%= magazine.getNo() %>"><%= magazine.getTitle() %></a>
				<%= magazine.getCommentCount() > 0 ? "(" + magazine.getCommentCount() + ")" : "" %>
			</td>
			<td><%= magazine.getWriter() %></td>
			<td><%= magazine.getRegDate() %></td>
			<td>
<% if(magazine.getAttachCount() > 0) { %>	
				<img alt="" src="<%= request.getContextPath() %>" width="16px"/>		
<% } %>
			</td>

			<td><%= magazine.getReadCount() %></td>
			
			<td></td>
		</tr>

<%
	}
%>
	</table>
<div>
<!-- 매거진 글쓰기 로그인 안된사람에겐 버튼 보이지 않음 -->
<% if(loginMember != null) { %>
	<input type="button" value="글쓰기" id="btn-add" onclick="location.href='<%= request.getContextPath() %>/magazine/magazineForm'"/>
<% } %>
</div>		

<!-- 페이지바 -->	
	<div id='pageBar'><%= request.getAttribute("pagebar") %></div>
</section>			
<%@ include file="/WEB-INF/views/common/footer.jsp" %>
    
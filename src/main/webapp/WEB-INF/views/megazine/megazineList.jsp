<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ include file="/WEB-INF/views/common/header.jsp" %>

<section id="megazine-container">
	<h2>매거진</h2>
	
<!-- 매거진 글쓰기 로그인 안된사람에겐 버튼 보이지 않음 -->
<% if(loginMember != null) { %>
	<input type="button" value="글쓰기" id="btn-add" onclick="location.href='<%= request.getContextPath() %>/megazine/megazineForm'"/>
<% } %>

<!-- 매거진 내용 -->
	<div>
	
	</div>
	
	
		

	
<!-- 페이지바 -->	
	<div id='pageBar'><%= request.getAttribute("pagebar") %></div>
</section>			
<%@ include file="/WEB-INF/views/common/footer.jsp" %>
    
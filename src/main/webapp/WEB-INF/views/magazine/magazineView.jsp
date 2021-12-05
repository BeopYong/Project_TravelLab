<%@page import="com.tlab.mvc.magazine.model.vo.MagazineComment"%>
<%@page import="com.tlab.mvc.magazine.model.vo.MagazineAttachment"%>
<%@page import="java.util.List"%>
<%@page import="com.tlab.mvc.magazine.model.vo.Magazine"%>
<%@ page language="java" contentType="text/html; charset=UTF-8" 
pageEncoding="UTF-8"%>
<%@ include file="/WEB-INF/views/common/header.jsp"%>
<%
	Magazine magazine = (Magazine) request.getAttribute("magazine");

	boolean editable = loginMember != null && (
					  loginMember.getMemberId().equals(magazine.getWriter())
					  || MemberService.ADMIN_ROLE.equals(loginMember.getMemberRole())
					);
	System.out.println("editable@magazineView.jsp = " + editable);
%>

<link rel="stylesheet" href="<%=request.getContextPath()%>/css/board.css" />

<section id="magazine-container">
	<h2>게시판</h2>
	<table id="tbl-ㅡmagazine-view">
		<tr>
			<th>글번호</th>
			<td><%= magazine.getNo() %></td>
		</tr>
		<tr>
			<th>제 목</th>
			<td><%= magazine.getTitle() %></td>
		</tr>
		<tr>
			<th>작성자</th>
			<td><%= magazine.getWriter() %></td>
		</tr>
		<tr>
			<th>조회수</th>
			<td><%= magazine.getReadCount() %></td>
		</tr>

		<tr>
			<th>내 용</th>
			<td><%= magazine.getContent() %></td>
		</tr>
		
<% 	if(editable){ %>
		<br />
		<div id="wrap" align="center">
		<tr>
			<%-- 작성자와 관리자만 마지막행 수정/삭제버튼이 보일수 있게 할 것 --%>
			<th colspan="2">
			<input type="button" value="수정하기" class="modify-btn" onclick="updateMagazine()"> 
			<input type="button" value="삭제하기" class="delete-btn" onclick="deleteMagazine()">
<% 	} %>
			<input type="button" value="목록" class="back-btn" onclick= "location.href = '<%= request.getContextPath()%>/magazine/magazineList';" />
			</th>
		</tr>
		</div>
	</table>

	
</section>



<!-- 글쓴이 또는 관리자만 deletemagazine 권한생성 -->
<% if (editable) { %>
<form action="<%= request.getContextPath() %>/magazine/magazineDelete" name="deleteMagazineFrm">
	<input type="hidden" name="magazineNo" value="<%= magazine.getNo() %>" />
</form>
<script>
const updateMagazine = () => {
	location.href = "<%= request.getContextPath() %>/magazine/magazineUpdate?no=<%= magazine.getNo() %>";
};

const deleteMagazine = () => {
	//게시물 삭제 재확인
	if(confirm("이 게시물을 정말 삭제하시겠습니까?")){
		$(document.deleteMagazineFrm).submit();		
	}
};

</script>
<%} %>

<script>

const loginAlert = () => {
	alert("로그인후 사용가능합니다.");
	$(memberId).focus();
};
</script>

<%@ include file="/WEB-INF/views/common/footer.jsp"%>
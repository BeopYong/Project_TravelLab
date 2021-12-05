<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ include file="/WEB-INF/views/common/header.jsp" %>
<link rel="stylesheet" href="<%=request.getContextPath()%>/css/board.css" />
<script>
function boardValidate(){
	//프로필 사진을 올리지 않는경우 검증 (해야하나?)
	
	return true;
}

$(document.boardEnrollFrm).submit(boardValidate);
</script>
<section id=profile-container>
<h2>회원 정보</h2>
<form
	name="boardEnrollFrm"
	action="<%=request.getContextPath() %>/member/profileEnroll" 
	method="post"
	enctype="multipart/form-data">
		<input type="hidden" name="memberId" value="<%= loginMember.getMemberId() %>" />
	<table id="tbl-profile-view">
	<tbody>
		<tr>
			<th><%= loginMember.getMemberName() %>님의 프로필</th>
		</tr>
		<tr>
			<th>이미지첨부</th>
			<td>			
				<input type="file" name="upFile">
			</td>
		</tr>
		<tr>
			<th colspan="1">
				<input type="submit" value="등록하기">
			</th>
		</tr>
	</tbody>
</table>
</form>
</section>
<%@ include file="/WEB-INF/views/common/footer.jsp" %>
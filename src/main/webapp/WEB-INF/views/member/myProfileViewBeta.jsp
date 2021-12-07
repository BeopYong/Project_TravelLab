<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ include file="/WEB-INF/views/common/header.jsp" %>
<section id=profile-container >
	<h2 align="center">프로필</h2>
	<body>
	<form
		id="profileUpdateFrm"
		name="profileEnrollFrm"
		action="<%=request.getContextPath() %>/member/profileView" 
		method="post"
		enctype="multipart/form-data">
			<input type="hidden" name="memberId" value="<%= loginMember.getMemberId() %>" />
		<table id="tbl-profile-view" align="center">
			<thead>
				<th align="center" colspan="2"><%= loginMember.getMemberName() %>님의 프로필</th>
			</thead>
			<tbody>
				<tr>
					<th width="300px" style="table-layout: fixed">-</th>
				</tr>
				<tr>
					<td align="center"><img src="https://api.cdn.visitjeju.net/photomng/thumbnailpath/202110/21/40916b0e-7ce7-4c3f-8ad1-59aeef46d4c6.png"  /></td>
				</tr>
				<tr>
					<th width="300px" style="table-layout: fixed">파일첨부</th>
				</tr>
				<tr>
					<td align="center">			
					<input type="file" name="upFile">
					</td>
				</tr>
				<tr>
					<td align="center">			
						-
					</td>
				</tr>
				<tr>
					<th align="center" colspan="2">
						<input type="submit" value="등록하기">
					</th>
				</tr>
			</tbody>
		</table>
	</form>
</section>
<%@ include file="/WEB-INF/views/common/footer.jsp" %>
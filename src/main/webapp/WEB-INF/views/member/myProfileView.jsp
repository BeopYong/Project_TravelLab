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
					<td align="center"><img src="https://uc3474b5f2efa50ce5bc40635c2e.previews.dropboxusercontent.com/p/thumb/ABWhhtXoYkZhe_KZFq8u8eZ9c5tYbKs41FFy53UZVXyZY6A3oIdgSbYzRRh7KXBTqAMTrZscteSmJN6HUUYZaqHKWw4MWKNsnkfBsQPts_x1l4kIA2xa7xKE9exsrWcqwcJB5BTUqkEQAB73p8TCzcc062tBhMk0QjfCgn41UADbLpnktQrgHX9tiaeFhzST3A8wbaR913fe4hmJBOrqXk_HAQ3OORiSlh_A-wKUOmNXTJ6YzrKfHcrR6Vhhp2TN1ZONkz_SROni2VigD-pZOj27QSqerEKaa2HdkOYGS-C0KfWXNAJrJMaJPzM-9TFoRm4Yb6lgBSl7Dd-5gjK4WWTSspqaJ9puEehu-Gr8WAoJLKHYEp8xV0fhWe52Ei45CSA/p.png"  /></td>
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
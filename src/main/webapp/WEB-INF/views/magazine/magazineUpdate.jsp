<%@page import="java.util.List"%>
<%@page import="com.tlab.mvc.magazine.model.vo.MagazineAttachment"%>
<%@page import="com.tlab.mvc.magazine.model.vo.Magazine"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ include file="/WEB-INF/views/common/header.jsp"%>
<%
Magazine magazine = (Magazine) request.getAttribute("magazine");
%>

<script>
/**
 * 유효성검사
 */
 function magazineValidate() {
	const $title = $("[name=title]");
	const $content = $("[name=content]");
	
	//제목을 작성하지 않은경우
	if(!/^.+$/.test($title.val())){
		alert("제목을 입력하세요.");
		return false;
	}
					   
	//내용을 작성하지 않은 경우 폼제출할 수 없음.
	// \n는 .에 포함되지 않는다.
	if(!/^(.|\n)+$/.test($content.val())){
		alert("내용을 입력하세요.");
		return false;
	}
	
	return true;
}
$(() => {
	$(document.magazineUpdateFrm).submit(magazineValidate);
});

</script>
<section id="magazine-container">
	<h2>게시판 수정</h2>
	<div style="padding: 200px 300px;">
		<form name="magazineUpdateFrm"
			action="<%=request.getContextPath()%>/magazine/magazineUpdate"
			method="post" 
			>
			<!-- enctype="multipart/form-data" -->
			
			<input type="hidden" name="no" value="<%=magazine.getNo()%>" />
			<table id="tbl-board-view">
				<tr>
					<th>제 목</th>
					<td>
					<input type="text" name="title" value="<%=magazine.getTitle()%>" required>
					</td>
				</tr>
				<tr>
					<th>작성자</th>
					<td><input type="text" name="writer"
						value="<%=magazine.getWriter()%>" readonly /></td>
				</tr>
				<%
				List<MagazineAttachment> attachments = magazine.getAttachments();
				if (attachments != null && !attachments.isEmpty()) {
				%>
				<tr>
					<th>기존 첨부파일</th>
					<td>
						<%
						for (MagazineAttachment attach : attachments) {
						%>
						<div style="padding: 0; margin: 3px;">
							<img src="<%=request.getContextPath()%>/images/file.png"
								width="16px" />
							<%=attach.getOriginalFilename()%>
							<label for="delFile<%=attach.getNo()%>">제거</label> <input
								type="checkbox" name="delFile" id="delFile<%=attach.getNo()%>"
								value="<%=attach.getNo()%>" />
						</div> <%
 }
 %>
					</td>
				</tr>
				<%
				}
				%>
				<tr>
					<th>첨부파일 추가</th>
					<td><input type="file" name="upFile1"> <br> <input
						type="file" name="upFile2"></td>
				</tr>
				<tr>
					<th>내 용</th>
					<td><textarea rows="5" cols="40" name="content"><%=magazine.getContent()%></textarea></td>
				</tr>
				<tr>
					<th colspan="2"><input type="submit" value="수정하기"></th>
				</tr>
			</table>
		</form>
	</div>
</section>

<%@ include file="/WEB-INF/views/common/footer.jsp"%>

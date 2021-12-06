<%@page import="java.util.List"%>
<%@page import="com.tlab.mvc.magazine.model.vo.MagazineAttachment"%>
<%@page import="com.tlab.mvc.magazine.model.vo.Magazine"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ include file="/WEB-INF/views/common/header.jsp"%>
<%
	Magazine magazine = (Magazine) request.getAttribute("magazine");
	List<MagazineAttachment> attachments = magazine.getAttachments();
%>
<!-- <link rel="stylesheet" href="<%=request.getContextPath()%>/css/board.css" /> -->
<link rel="stylesheet" href="<%=request.getContextPath()%>/css/magazine.css" />
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
<section id="magazineForm-container" class="magazine-container">
	<h2>게시판 수정</h2>
	<div style="">
	<!-- padding: 200px 300px; -->
		<form name="magazineUpdateFrm"
			action="<%=request.getContextPath()%>/magazine/magazineUpdate"
			method="post" >
			<input type="hidden" name="no" value="<%= magazine.getNo() %>"/>
			
			<!-- enctype="multipart/form-data"
	accept-charset="UTF-8"   --> 
						
			
			<table id="tbl-magazine-view">
				<tr>
					<th>지역</th>
					<td class="text-td">
					<select name="region" id="region"><%= magazine.getRegion() %>
						<option value="강원도">강원도</option>
						<option value="부산">부산</option>
						<option value="제주도">제주도</option>
					</select>
					</td>
				</tr>
				<tr>
					<th>제 목</th>
					<td class="text-td">
						<input type="text" name="title" value="<%=magazine.getTitle()%>" style="width: 300px" required>
					</td>
				</tr>
				<tr>
					<th>작성자</th>
					<td class="text-td">
						<input type="text" name="writer" value="<%=magazine.getWriter()%>" readonly />
					</td>
				</tr>
				<%
				
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
					<th colspan="2">
					<input type="submit" class="modified-btn"value="수정하기" />
					<input type="button" class="cancell-btn" value="취소" onclick="history.go(-1);" />
					</th>
				</tr>
			</table>
		</form>
	</div>
</section>

<%@ include file="/WEB-INF/views/common/footer.jsp"%>

<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ include file="/WEB-INF/views/magazine/mgheader.jsp" %>


<script>
/**
 * magazine 유효성 검사(제목, 내용을 작성안한 경우 제출불가)
 * 
 */
function magazineValidate(){
	const $title = $("[name=title]");
	const $content = $("[name=content]");
	
	//제목 작성하지 않은 경우
	if(!/^.+$/.test($title.val())){
		alert("제목을 입력하세요.")
		return false;
	}
	
	//내용을 작성하지 않은 경우
	if(/^.+$/.test($content.val())){
		alert("내용을 입력하세요.")
		return false;
	}
	return true;
}

$(document.magazineEnrollFrm).submit(magazineValidate);

</script>

<section id="magazine-container">
<h2>매거진 작성</h2>
<form 
	name="magazineEnrollFrm"
	action="<%= request.getContextPath() %>/magazine/magazineEnroll"
	method="post"
	enctype="multipart/form-data">
	<table id="tbl-magazine-view">
	<!-- 제목 추후에 수정 -->
	<tr>
		<th>제목</th>
		<td>
		<input type="text" name="title" value="<%= loginMember.getMemberName()%>" required/>
		</td>
	</tr>
	<tr>
		<th>작성자</th>
		<td>
		<input type="text" name="writer" value="<%= loginMember.getMemberId() %>" readonly/>
		</td>
	</tr> 
	<!-- 파일 추후에 수정 -->
	<tr>
		<th>첨부파일</th>
		<td>
		<input type="file" name="upFile1"/>
		</td>
	</tr>
	<tr>
		<th>내 용</th>
		<td>
		<textarea id="summernote" name="content" rows="10"></textarea>
		</td>		
		
	</tr>
	
	<tr>
		<th colspan="2">
			<input type="submit" value="등록" />
		</th>
	</tr>
	</table>
</form>

</section>
<%@ include file="/WEB-INF/views/common/footer.jsp" %>
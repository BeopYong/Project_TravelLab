<%@page import="com.tlab.mvc.magazine.model.vo.Magazine"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ include file="/WEB-INF/views/common/header.jsp" %>
<!-- <link rel="stylesheet" href="<%=request.getContextPath()%>/css/board.css" /> -->
<link rel="stylesheet" href="<%=request.getContextPath()%>/css/magazine.css" />
<script>
/**
 * magazine 유효성 검사(제목, 내용을 작성안한 경우 제출불가)
 */
function magazineValidate(){
	const $title = $("[name=title]");
	const $content = $("[name=content]");
	const $region = $("[name=region]")
	//제목 작성하지 않은 경우
	if(!/^.+$/.test($title.val())){
		alert("제목을 입력하세요.")
		return false;
	}
	
	//내용을 작성하지 않은 경우
	if(!/^(.|\n)+$/.test($content.val())){
		alert("내용을 입력하세요.")
		return false;
	}
	
	//지역을 선택하지 않은 경우
	return true;
}

//magazineform 제출직전에 magazineValidate 호출
$(() => {
$(document.magazineEnrollFrm).submit(magazineValidate);
});
</script>

<section id="magazineForm-container" class="magazine-container">
<form 
	name="magazineEnrollFrm"
	action="<%= request.getContextPath() %>/magazine/magazineEnroll"
	method="post"
	
	<input type="hidden" name="no" value="<%= loginMember.getMemberId()%>" />
	>
	<!-- enctype="multipart/form-data"
	accept-charset="UTF-8" -->
	
	<table id="tbl-magazine-view">
<h2>매거진 작성</h2>
	<!-- 제목 추후에 수정 -->
	<tr>
		<th>지역</th>
		<td class="text-td">
			<select name="region" id="region" required>				
				<option value="0">선택</option>
				<option value="강원도">강원도</option>
				<option value="부산">부산</option>
				<option value="제주도">제주도</option>
			</select>
		</td>
		
			
	</tr>
	<tr>
		<th>제목</th>
		<td class="text-td">
		<input type="text" name="title" id="title"value="<%= loginMember.getMemberName()%>님의 레시피입니다." readonly/>
		</td>
	</tr>
	<tr>
		<th>작성자</th>
		<td class="text-td">
		<input type="text" name="writer" id="writer" value="<%= loginMember.getMemberId() %>" readonly/>
		</td>
	</tr> 
	<!-- 파일 추후에 수정 -->
	<tr>
		<th>첨부파일</th>
		<td class="text-td">
		<input type="file" name="upFile1" id="upfile"/>
		<br>
		<input type="file" name="upFile2" id="upfile"/>
		</td>
	</tr>
	
	<tr>
		<th>내 용</th>
		<td class="text-td">
		<textarea id="content" name="content" id="content" rows="10" cols="40" required></textarea>
		</td>		
		
	</tr>
	
	<tr>
		<th colspan="2">
			<input type="submit" id= "btn" class="insert-btn" value="등록" />
			<input type="button" id= "btn" class="listback-btn" value="취소" onclick="history.go(-1);" />
		</th>
	</tr>
	</table>
</form>

</section>


<%@ include file="/WEB-INF/views/common/footer.jsp" %>
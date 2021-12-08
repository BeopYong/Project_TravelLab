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
<link rel="stylesheet"
	href="<%=request.getContextPath()%>/css/magazine.css" />
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

	<h3 id="logo">Magazine Update</h3>
	<div style="">
		<!-- padding: 200px 300px; -->
		<form name="magazineUpdateFrm"
			method="post"
			action="<%=request.getContextPath()%>/magazine/magazineUpdate" 
			<input type="hidden" name="no" value="<%=magazine.getNo()%>" /> >
			<!-- enctype="multipart/form-data"
			accept-charset="UTF-8"   -->
			
			<!-- 매거진 게시물 수정 폼 시작 -->
		<div>
				<tr>
					<label for="username"><th>지역</th></label>

					<td class="text-td"><select name="region" id="region" class="form-select" aria-label="Default select example" selected="<%=magazine.getRegion()%>">
							<option value="강원도">강원도</option>
							<option value="부산">부산</option>
							<option value="제주도">제주도</option>
					</select></td>
				</tr>
				
				<tr>
					<label for="username"><th>제 목</th></label>
					<td class="text-td"><input type="text" name="title"
						value="<%=magazine.getTitle()%>" style="width: 300px" required>
					</td>
				</tr>
				
				<tr>
					<label for="username"><th>작성자</th></label>
					<td class="text-td"><input type="text" name="writer"
						value="<%=magazine.getWriter()%>" readonly /></td>
				</tr>
				
				<%
				if (attachments != null && !attachments.isEmpty()) {
				%>
				<tr>
					<label for="username"><th>기존 첨부파일</th></label>

					<td>
						<%
						for (MagazineAttachment attach : attachments) {
						%> <%=attach.getOriginalFilename()%> <label
						for="delFile<%=attach.getNo()%>">제거</label> <input type="checkbox"
						name="delFile" id="delFile<%=attach.getNo()%>"
						value="<%=attach.getNo()%>" /> <%
 }
 %>
					</td>
				</tr>
				<%
				}
				%>
				
				<tr>
					<label for="username"><th>첨부파일 추가</th></label>

					<td><input type="file" name="upFile1"> <br>
				</tr>
				
				<tr>
					<label for="username"><th>내 용</th></label>

					<td><textarea rows="5" cols="40" name="content"><%=magazine.getContent()%></textarea></td>
				</tr>
				
				<tr>
					<th colspan="2"><input type="submit" id="btn"
						class="modified-btn" value="수정하기" /> <input type="button"
						id="btn" class="cancell-btn" value="취소" onclick="history.go(-1);" />
					</th>
				</tr>
			</div>
		</form>
	</div>
</section>

<style>
@import url(https://fonts.googleapis.com/css?family=Lily+Script+One);

@import
	url('https://fonts.googleapis.com/css2?family=Hammersmith+One&display=swap');

@import url(//fonts.googleapis.com/earlyaccess/notosanskr.css);

form { 
 font-family: 'Noto Sans KR', sans-serif;
}

body {
	margin: 0;
	font-family: arial, tahoma, sans-serif;
	font-size: 12px;
	font-weight: normal;
	direction: ltr;
	background: white;
}

form {
	margin: 10% auto 0 auto;
	padding: 30px;
	width: 800px;
	height: auto;
	overflow: hidden;
	background: white;
	border-radius: 10px;
}

form label {
	font-size: 17px;
	color: darkgray;
	cursor: pointer;
}

form label, form input {
	float: left;
	clear: both;

}

form input {
	margin: 19px 0;
	padding: 15px 10px;
	width: 100%;
	outline: none;
	border: 1px solid #bbb;
	border-radius: 20px;
	display: inline-block;
	-webkit-box-sizing: border-box;
	-moz-box-sizing: border-box;
	box-sizing: border-box;
	-webkit-transition: 0.2s ease all;
	-moz-transition: 0.2s ease all;
	-ms-transition: 0.2s ease all;
	-o-transition: 0.2s ease all;
	transition: 0.2s ease all;
}

form input[type="text"]:focus, form input[type="password"], form textarea :focus
	{
	border-color: cornflowerblue;
}

form input[type="submit"] {
	vertical-align: middle;
	font-size: 15px;
	padding: 15px 50px;
	width: auto;
	background: rgb(128, 151, 194) ;
	border: none;
	color: rgb(54, 54, 54);
	cursor: pointer;
	display: inline-block;
	float : right;
	clear: right;
	-webkit-transition: 0.2s ease all;
	-moz-transition: 0.2s ease all;
	-ms-transition: 0.2s ease all;
	-o-transition: 0.2s ease all;
	transition: 0.2s ease all;
	font-weight: bold;
}

form input[type="submit"] :hover {
	opacity: 0.8;
}

form input[type="submit"] :active {
	opacity: 0.4;
}

form input[type="button"] {
	vertical-align: middle;
	font-size: 15px;
	padding: 15px 50px;
	width: auto;
	background: rgb(128, 151, 194) ;
	border: none;
	color: rgb(54, 54, 54);
	cursor: pointer;
	position: relative;
	display: inline-block;
	float :left;
	clear: left;
	-webkit-transition: 0.2s ease all;
	-moz-transition: 0.2s ease all;
	-ms-transition: 0.2s ease all;
	-o-transition: 0.2s ease all;
	transition: 0.2s ease all;
	font-weight: bold;
	

}

form textarea {
	margin: 15px 0;
	padding: 15px 10px;
	width: 800px;
	outline: none;
	border: 1px solid #bbb;
	border-radius: 20px;
	display: inline-block;
	-webkit-box-sizing: border-box;
	-moz-box-sizing: border-box;
	box-sizing: border-box;
	-webkit-transition: 0.2s ease all;
	-moz-transition: 0.2s ease all;
	-ms-transition: 0.2s ease all;
	-o-transition: 0.2s ease all;
	transition: 0.2s ease all;
	resize: vertical;
}

form select {
	margin: 15px 0;
	padding: 15px 10px;
	width: 100%;
	outline: none;
	border: 1px solid #bbb;
	border-radius: 20px;
	display: inline-block;
	-webkit-box-sizing: border-box;
	-moz-box-sizing: border-box;
	box-sizing: border-box;
	-webkit-transition: 0.2s ease all;
	-moz-transition: 0.2s ease all;
	-ms-transition: 0.2s ease all;
	-o-transition: 0.2s ease all;
	transition: 0.2s ease all;
}

.forgot, .register {
	margin: 10px;
	float: left;
	clear: left;
	display: inline-block;
	color: cornflowerblue;
	text-decoration: none;
}

.forgot:hover, .register:hover {
	color: darkgray;
}

#logo {
	margin: 100;
	/* width: 200px;// */
	font-family: 'Hammersmith One', sans-serif;
	font-size: 60px;
	font-weight: bold;
	text-align: center;
	color: rgb(128, 151, 194) ;
	-webkit-transition: 0.2s ease all;
	-moz-transition: 0.2s ease all;
	-ms-transition: 0.2s ease all;
	-o-transition: 0.2s ease all;
	transition: 0.2s ease all;
}

#logo:hover {
	color: rgb(143, 146, 148);
}
</style>

<%@ include file="/WEB-INF/views/common/footer.jsp"%>

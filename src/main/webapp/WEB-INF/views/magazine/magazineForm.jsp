<%@page import="com.tlab.mvc.member.model.service.MemberService"%>
<%@page import="com.tlab.mvc.member.model.vo.Member"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8" %>
    

<!-- 여기까지 header영역 -->
<%@ include file="/WEB-INF/views/common/headerr.jsp"%>
 <link rel="canonical" href="https://getbootstrap.com/docs/5.1/examples/blog/">
    <!-- Bootstrap core CSS -->
    <link href="<%= request.getContextPath() %>/css/magazine/bootstrapv.min.css" rel="stylesheet">
    
    <!-- Custom styles for this template -->
    <link href="https://fonts.googleapis.com/css?family=Playfair&#43;Display:700,900&amp;display=swap" rel="stylesheet">
    
    <!-- Custom styles for this template -->
    <link href="<%= request.getContextPath() %>/css/magazine/blog.css" rel="stylesheet">
    <script src="<%= request.getContextPath() %>/js/jquery-3.6.0.js"></script>
    
    <link rel="icon" href="<%= request.getContextPath() %>/images/icons/tourist.png">
<!-- javaScript -->	
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

	<div class="">
		<form name="magazineEnrollFrm"
		method="post"
		action="<%=request.getContextPath()%>/magazine/magazineEnroll"
		<input type="hidden" name="no" value="<%=loginMember.getMemberId()%>" /> >
		<!-- enctype="multipart/form-data"
			accept-charset="UTF-8" -->
			
			<h3 id="logo">Magazine Insert</h3>
			<br>
		<!-- 매거진 게시물 등록 폼 시작 -->
		<tr>
			<label for="username"><th>지역</th></label>
			<td class="text-td"><select name="region" id="region" required class="form-select" aria-label="Default select example">
					<option value="0">선택</option>
					<option value="강원도">강원도</option>
					<option value="부산">부산</option>
					<option value="제주도">제주도</option>
			</select></td>
		</tr>
		
		<tr>
			<label for="username"><th>제목</th></label>

			<td class="text-td"><input type="text" name="title" id="title"
				value="<%=loginMember.getMemberName()%>님의 " /></td>
		</tr>
		
		<tr>
			<label for="username"><th>작성자</th></label>

			<td class="text-td"><input type="text" name="writer" id="writer"
				value="<%=loginMember.getMemberId()%>" readonly /></td>
		</tr>
		
		<!-- 파일 추후에 수정 -->
		<tr>
			<label for="username"><th>첨부파일</th></label>

			<td class="text-td">
			<input type="file" name="upFile1" id="upfile" />
		</tr>

		<tr>
			<label for="username"><th>내 용</th></label>
			<td class="text-td"><textarea id="content" name="content"
					id="content" rows="10" cols="40" autocomplete="off" required></textarea>
			</td>

		</tr>

		<tr>
			<th colspan="2">
				<input type="submit" id="btn" class="insert-btn"
				value="등록" /> 
				<input type="button" id="btn" class="listback-btn"
				value="취소" onclick="history.go(-1);" /></th>
		</tr>
		</table>


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
		margin: 0% auto 0 auto;
		padding: 30px;
		width: 1000px;
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
		margin: 13px 0;
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
		background: rgb(255, 206, 100) ;
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
		background-color: #ffffff;
      	
	}
	
	form input[type="submit"] :active {
		opacity: 0.4;
	}
	
	form input[type="button"] {
		vertical-align: middle;
		font-size: 15px;
		padding: 15px 50px;
		width: auto;
		background: rgb(255, 206, 100) ;
		border: none;
		color: rgb(54, 54, 54);
		cursor: pointer;
		position: relative;
		display: inline-block;
		
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
		width: 950px;
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
		color: darkgray;
		text-decoration: none;
	}
	
	.forgot:hover, .register:hover {
		color: rgb(255, 206, 100) ;
	}
	
	#logo {
		margin: 10%;
		/* width: 200px;// */
		font-family: 'Hammersmith One', sans-serif;
		font-size: 60px;
		font-weight: bold;
		text-align: center;
		color: rgb(255, 206, 100) ;
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


<!-- 여기까지 footer영역 -->		
<%@ include file="/WEB-INF/views/common/Nfooter.jsp"%>
	
	
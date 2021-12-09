<!DOCTYPE html>
<html lang="en">
<head>
  <meta charset="UTF-8">
  <meta http-equiv="X-UA-Compatible" content="IE=edge">
  <meta name="viewport" content="width=device-width, initial-scale=1.0">
  <title>당신의 여행을 응원합니다</title>
</head>
<body>


<!-- 여기부터 쭉 시작 -->
<%@page import="com.tlab.mvc.product.model.vo.ProductAttachment"%>
<%@page import="com.tlab.mvc.product.model.vo.Product"%>
<?xml version="1.0" encoding="UTF-8" ?>
<%@page import="java.util.List"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<link
	href="https://cdn.jsdelivr.net/npm/bootstrap@5.1.3/dist/css/bootstrap.min.css"
	rel="stylesheet"
	integrity="sha384-1BmE4kWBq78iYhFldvKuhfTAU6auU8tT94WrHftjDbrCEXSU1oBoqyl2QvZ6jIW3"
	crossorigin="anonymous">
<link rel="preconnect" href="https://fonts.googleapis.com">
<link rel="preconnect" href="https://fonts.gstatic.com" crossorigin>
 <link rel="stylesheet" href="/tlab/css/product/main.css" />
 <link rel="stylesheet" href="/tlab/css/product.css" />
<link
	href="https://fonts.googleapis.com/css2?family=Noto+Serif+KR:wght@600&display=swap"
	rel="stylesheet">
<!-- 위에 지키고 여기에 헤더 넣으면 됨 -->
<script>

<%
	Product product = (Product) request.getAttribute("product");
%>
/**
* productFrm 유효성 검사
*/
function productValidate(){
	const $p_name = $("[name=p_name]");
	const $unit_price = $("[name=unit_price]");
	if(!/^.+$/.test($p_name.val())) {
		alert("상품 이름을 입력하세요.");
		return false;
	}
					   
	//내용을 작성하지 않은 경우 폼제출할 수 없음.
	// \n는 .에 포함되지 않는다.
	if(!/^(.|\n)+$/.test($unit_price.val())) {
	alert("가격을 입력하세요.");
	return false;
	}
	return true;
}
$(document.productUpdateFrm).submit(productValidate);

</script>


<section>

<form 
	name="productUpdateFrm" 
	method="post" 
	action="<%=request.getContextPath() %>/product/productUpdate"
	enctype="multipart/form-data">
	<input type="hidden" name="no" value="<%=product.getNo()%>" />
			<h3 id="logo">상품 등록</h3>
<br>

	<div class="inputArea"> 
		 <label for="username"><th>카테고리</th></label>
		 <select class="category1" name="p_category" selected="<%= product.getP_category()%>">
	 		 <option value="101">항공패스</option>
	 		 <option value="102">버스패스</option>
	 		 <option value="103">기차패스</option>
	 		 <option value="201">숙박패스</option>
	 		 <option value="301">맛집</option>
	 		 <option value="302">관광지</option>
	 	</select>
		 <label for="username"><th>지역</th>/label>
		 <select class="category2" name="region" selected="<%= product.getRegion()%>">
 			 <option value="033">강원도</option>
 			 <option value="051">부산</option>
 			 <option value="064">제주</option>
		 </select>
	</div>

<div class="inputArea">
 <label for="pName">상품명</label>
 <input type="text" id="p_name" name="p_name" value="<%= product.getP_name()%>" />
</div>

<div class="inputArea">
 <label for="pPrice">상품가격</label>
 <input type="text" id="unit_price" name="unit_price" value="<%= product.getUnit_price()%>"/>
</div>

<div class="inputArea">
 <label for="pStock">상품수량</label>
 <input type="text" id="p_stock" name="p_stock" value="<%= product.getP_stock()%>" />
</div>

<div class="inputArea">
<% 
	List<ProductAttachment> pAttach = product.getAttachments();
	if(pAttach != null && !pAttach.isEmpty()) { 
%>
	<label for="">첨부된 파일</label>
<%
	for(ProductAttachment pAttachs : pAttach) {
%>
	<%= pAttachs.getOriginalFilename()%>
<% } %>
	
<% } %>
	<br>
	<label for="">파일 추가</label>
	<input type="file" name="uploadFile1" id="uploadFile1" />
</div>

<div class="inputArea">
 <label for="pDes">상품소개</label>

<textarea name="content" id="summernote" class="summernote"><%= product.getP_content()%></textarea>






 <textarea rows="5" cols="50" id="p_content" name="p_content"><%= product.getP_content()%></textarea>
</div>

<div class="inputArea">
 <button type="submit" id="register_Btn" class="btn btn-primary">수정하기</button>
</div>

</form>



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


<%@ include file="/WEB-INF/views/common/footer.jsp" %>
<?xml version="1.0" encoding="UTF-8" ?>
<%@page import="java.util.List"%>
<%@page import="com.tlab.mvc.product.model.vo.ProductAttachment"%>
<%@page import="com.tlab.mvc.product.model.vo.Product"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ include file="/WEB-INF/views/common/productHeader.jsp"%>

<link rel="stylesheet"
	href="<%=request.getContextPath()%>/css/magazine.css" />

<%
Product product = (Product) request.getAttribute("product");
%>

<script>
	/**
	 * productFrm 유효성 검사
	 */
	function productValidate() {
		const $p_name = $("[name=p_name]");
		const $unit_price = $("[name=unit_price]");
		if (!/^.+$/.test($p_name.val())) {
			alert("상품 이름을 입력하세요.");
			return false;
		}

		//내용을 작성하지 않은 경우 폼제출할 수 없음.
		// \n는 .에 포함되지 않는다.
		if (!/^(.|\n)+$/.test($unit_price.val())) {
			alert("가격을 입력하세요.");
			return false;
		}
		return true;
	}

	$(document.productUpdateFrm).submit(productValidate);
</script>

<section id="productForm-container" class="product-container">

<div class="write-box">
	<form name="productEnrollFrm" method="post"
		action="<%=request.getContextPath()%>/product/productEnroll"
		enctype="multipart/form-data">
		<h3 id="logo">상품 업로드</h3>
			<br>

		<tr>
			<label for="username"><th>지역</th></label> 
		<td class="text-td">		
			<select class="form-selected1" name="p_category" id="p_category" aria-label="Default select example"
				selected="<%=product.getP_category()%>">
				<option value="101">항공패스</option>
				<option value="102">버스패스</option>
				<option value="103">기차패스</option>
				<option value="201">숙박패스</option>
				<option value="301">맛집</option>
				<option value="302">관광지</option>
			</select> </td>
			</tr>
			<tr>
			<label for="username"><th>지역</th></label> 
		<td class="text-td">
			<select class="form-selected2" name="region" id="region" selected="<%=product.getRegion()%>">
				<option value="033">강원도</option>
				<option value="051">부산</option>
				<option value="064">제주</option>
			</select>
		</td>
		</tr>
		<tr>
			<label for="username"><th>상품명</th></label> 
			<td class="text-td">
			<input type="text" id="p_name"
				name="p_name" value="<%=product.getP_name()%>" />
			</td>
		
	</tr>
	<tr>
	
			<label for="username"><th>가격</th></label> 
			
			<td class="text-td">
			<input type="text" id="unit_price"
				name="unit_price" value="<%=product.getUnit_price()%>" />
			</td>
	</tr>
	
		
	<tr>
			<label for="username"><th>상품 수량</th></label> 
			<td>			
			<input type="text" id="p_stock"
				name="p_stock" value="<%=product.getP_stock()%>" />		
			</td>
	</tr>
	<tr>
			
			<%
			List<ProductAttachment> pAttach = product.getAttachments();
			if (pAttach != null && !pAttach.isEmpty()) {
			%>
			<label for="username"><th>첨부된 파일</th></label>
			<%
			for (ProductAttachment pAttachs : pAttach) {
			%>
			<%=pAttachs.getOriginalFilename()%>
			<label for="delFeil<%=pAttachs.getNo()%>">삭제하기</label> <input
				type="checkbox" name="delFile" id="delFiel<%=pAttachs.getNo()%>"
				value="<%=pAttachs.getNo()%>" />
			<%
			}
			%>
			<%
			}
			%>
			<br>
			<label for="username"><th>파일 추가</th></label> 
			<td class="text-td">
			<input type="file" name="uploadFile1"
				id="uploadFile1" />
			</td>
		</tr>

		<tr>
			<label for="username"><th>상품 소개</th></label>
			<td class="text-td">
			<textarea name="p_content" cols="30" rows="10" autocomplete="off"><%=product.getP_content()%></textarea>			
			</td>
		</tr>
			
			

		<div class="inputArea">

		
		<th colspan="2"><input type="submit" id="btn"
						class="modified-btn" value="등록" /> <input type="button"
						id="btn" class="cancell-btn" value="취소" onclick="history.go(-1);" />
					</th>
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

form input[type="text"]:focus, form input[type="select"], form textarea :focus
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
  font-family: 'Cafe24Ssurround';
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
@font-face {
  font-family: 'Cafe24Ssurround';
  src: url('https://cdn.jsdelivr.net/gh/projectnoonnu/noonfonts_2105_2@1.0/Cafe24Ssurround.woff') format('woff');
  font-weight: normal;
  font-style: normal;
}
</style>

	<script src="<%=request.getContextPath()%>/js/jquery.min.js"></script>
	<script src="<%=request.getContextPath()%>/js/popper.js"></script>
	<script src="<%=request.getContextPath()%>/js/bootstrap.min.js"></script>
	
	
</body>
</html>





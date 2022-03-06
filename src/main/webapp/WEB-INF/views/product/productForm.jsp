<?xml version="1.0" encoding="UTF-8" ?>
<%@page import="java.util.List"%>
<%@page import="com.tlab.mvc.product.model.vo.ProductAttachment"%>
<%@page import="com.tlab.mvc.product.model.vo.Product"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ include file="/WEB-INF/views/common/header.jsp"%>

<script>
	function productValidate() {
		const $title = $("[name=title]");
		const $content = $("[name=content]")
		//제목을 작성하지 않은 경우 폼제출할 수 없음.
		if (!/^.+$/.test($title.val())) {
			alert("제목을 입력하세요.");
			return false;
		}

		//내용을 작성하지 않은 경우 폼제출할 수 없음.
		// \n는 .에 포함되지 않는다.
		if (!/^(.|\n)+$/.test($title.val())) {
			alert("내용을 입력하세요.");
			return false;
		}
		return true;
	}
	$(document.productEnrollFrm).submit(productValidate);
</script>

<section id="productForm-container" class="product-container">

<div class="write-box">
	<form name="productEnrollFrm" method="post"
		action="<%=request.getContextPath()%>/product/productEnroll"
		enctype="multipart/form-data">
		<h3 id="logo">상품 업로드</h3>
			<br>

	<form name="productEnrollFrm" method="post"
		action="<%=request.getContextPath()%>/product/productEnroll"
		enctype="multipart/form-data">

		<div class="inputArea">
			<label>카테고리</label> <select class="category1" name="p_category">
				<option value="101">항공패스</option>
				<option value="102">버스패스</option>
				<option value="103">기차패스</option>
				<option value="201">숙박패스</option>
				<option value="301">맛집</option>
				<option value="302">관광지</option>
			</select> <label>지역 코드</label> <select class="category2" name="region">
				<option value="033">강원도</option>
				<option value="051">부산</option>
				<option value="064">제주</option>
			</select>
		</div>

		<div class="inputArea">
			<label for="pName">상품명</label> <input type="text" id="p_name"
				name="p_name" />
		</div>

		<div class="inputArea">
			<label for="pPrice">상품가격</label> <input type="text" id="unit_price"
				name="unit_price" />
		</div>

		<div class="inputArea">
			<label for="pStock">상품수량</label> <input type="text" id="p_stock"
				name="p_stock" />
		</div>

		<div class="inputArea">
			<label for="">파일 첨부</label> <input type="file" name="uploadFile1"
				id="uploadFile1" />
		</div>

		<div class="inputArea">
			<label for="pDes">상품소개</label>
			<textarea name="p_content" id="summernote" class="summernote"></textarea>
		</div>

		<div class="inputArea">
			<button type="submit" id="register_Btn" class="btn btn-primary">등록</button>
		</div>

	</form>

</section>

<%@ include file="/WEB-INF/views/common/footer.jsp"%>

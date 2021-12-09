<?xml version="1.0" encoding="UTF-8" ?>
<%@page import="java.util.List"%>
<%@page import="com.tlab.mvc.product.model.vo.ProductAttachment"%>
<%@page import="com.tlab.mvc.product.model.vo.Product"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ include file="/WEB-INF/views/common/header.jsp"%>

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


<section>

	<form name="productUpdateFrm" method="post"
		action="<%=request.getContextPath()%>/product/productUpdate"
		enctype="multipart/form-data">
		<input type="hidden" name="no" value="<%=product.getNo()%>" />

		<div class="inputArea">
			<label>카테고리</label> <select class="category1" name="p_category"
				selected="<%=product.getP_category()%>">
				<option value="101">항공패스</option>
				<option value="102">버스패스</option>
				<option value="103">기차패스</option>
				<option value="201">숙박패스</option>
				<option value="301">맛집</option>
				<option value="302">관광지</option>
			</select> <label>지역 코드</label> <select class="category2" name="region"
				selected="<%=product.getRegion()%>">
				<option value="033">강원도</option>
				<option value="051">부산</option>
				<option value="064">제주</option>
			</select>
		</div>

		<div class="inputArea">
			<label for="pName">상품명</label> <input type="text" id="p_name"
				name="p_name" value="<%=product.getP_name()%>" />
		</div>

		<div class="inputArea">
			<label for="pPrice">상품가격</label> <input type="text" id="unit_price"
				name="unit_price" value="<%=product.getUnit_price()%>" />
		</div>

		<div class="inputArea">
			<label for="pStock">상품수량</label> <input type="text" id="p_stock"
				name="p_stock" value="<%=product.getP_stock()%>" />
		</div>

		<div class="inputArea">
			<%
			List<ProductAttachment> pAttach = product.getAttachments();
			if (pAttach != null && !pAttach.isEmpty()) {
			%>
			<label for="">첨부된 파일</label>
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
			<label for="">파일 추가</label> <input type="file" name="uploadFile1"
				id="uploadFile1" />
		</div>

		<div class="inputArea">
			<label for="pDes">상품소개</label>
			<textarea name="p_content"><%=product.getP_content()%></textarea>
		</div>

		<div class="inputArea">
			<button type="submit" id="register_Btn" class="btn btn-primary">수정하기</button>
		</div>

	</form>

</section>





<%@ include file="/WEB-INF/views/common/footer.jsp"%>
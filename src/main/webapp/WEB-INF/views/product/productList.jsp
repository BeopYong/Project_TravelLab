<!DOCTYPE html>
<%@page import="com.tlab.mvc.product.model.vo.ProductEntity"%>
<html lang="en">
<head>
  <meta charset="UTF-8">
  <meta http-equiv="X-UA-Compatible" content="IE=edge">
  <meta name="viewport" content="width=device-width, initial-scale=1.0">
  <title>당신의 여행을 응원합니다</title>

<!-- 여기부터 쭉 시작 -->
<%@page import="com.tlab.mvc.product.model.vo.ProductAttachment"%>
<%@page import="com.tlab.mvc.product.model.vo.Product"%>
<?xml version="1.0" encoding="UTF-8" ?>
<%@page import="java.util.List"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ include file="/WEB-INF/views/common/header.jsp"%>
<%@page import="java.awt.Image"%>

<script src="<%=request.getContextPath()%>/js/jquery-3.6.0.js"></script>

<section>

<div p_container>
	<td>
		<form name="form"
			action="<%=request.getContextPath()%>/product/productList">
			<select name="p_category" onchange="this.form.submit()">
				<option value="">category</option>
				<option value="101">교통/숙박</option>
				<option value="301">맛집</option>
				<option value="302">장소</option>
			</select><br>
			<br>
	</td>
	</tr>
	</form>

	<script>

$(p_category).change((e) => {
	const v = $(e.target).val();
	
});

</script>	
    
    		<div id="product-container">
			<div id="search-p_content" class="search-type">
				<form action="<%=request.getContextPath()%>/product/productFinder">
					<input type="hidden" name="searchType" value="p_content" />
					<input type="text" name="searchKeyword" size = "25" placeholder="검색할 내용을 입력하세요." id="product-seaerch-bar" />
					<button type="submit">검색</button>
				</form>
			</div>
	</div>
	


	<div class="container">

		<%
		List<ProductAttachment> pAttach = (List<ProductAttachment>) request.getAttribute("pAttach");
		List<Product> productList = (List<Product>) request.getAttribute("productList");

		for (Product product : productList) {
		%>
		<div class="product-view">
			<a
				href="<%=request.getContextPath()%>/product/productView?no=<%=product.getNo()%>">
				<img
				src="<%=request.getContextPath()%>/upload/product/travel_lab.jpg"
				alt="">
			</a>
			<p><%=product.getP_name()%></p>
		</div>
		<%
		}
		%>
	</div>
	<div style="clear: both;"></div>




</section>


<div id='pageBar'><%=request.getAttribute("pagebar")%></div>

<%@ include file="/WEB-INF/views/common/footer.jsp"%>

<?xml version="1.0" encoding="UTF-8" ?>
<%@page import="com.tlab.mvc.product.model.vo.ProductAttachment"%>
<%@page import="com.tlab.mvc.product.model.vo.Product"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ include file="/WEB-INF/views/common/header.jsp" %> 

<script>
	
function cartIn() {
	
	const quantity = document.getElementById("quantity");
	
	console.log(quantity.options[quantity.selectedIndex].value);
}
	
</script>


<%
	ProductAttachment productAttachment = new ProductAttachment();
	Product product = (Product) request.getAttribute("product");
%>

<section>

<form
	name="ProductFrm"
	method="post"
	enctype="multipart/form-data">
	<table id="tbl-board-view">
	
<div>
	<img src="<%= request.getContextPath() %>/upload/product/<%=productAttachment.getRenamedFilename() %>" alt="" />
</div>
	
 <table>

 	<tr>
 		<th><p name="p_name">상품</p></th>
 		<th><%= product.getP_name() %></th>
 	</tr>
 	<tr>
 		<th>지역</th>
 		<th><p name="region"><%= product.getRegion() %></p></td>
 	</tr>
 	<tr>
 		<th>가격</th>
 		<th><%= product.getUnit_price() %></td>
 	</tr>
	<tr>
		<th>수량</th>
		<td>
 		<select name="quantity" id="quantity">
 			<option value="1">1</option>
 			<option value="2">2</option>
 			<option value="3">3</option>
 			<option value="4">4</option>
 			<option value="5">5</option>
 		</select>		
		</td>
	</tr>
 	<tr>
 		<th>상세 설명</th>
 		<th><%= product.getP_content() %></td>
 	</tr>
 	
 
 </table>
 	<input type="button" value="장바구니" onclick="cartIn();"/>
 	<input type="submit" value="구매하기"/>
 		
 	<input type="submit" value="수정하기"/>
 	<input type="submit" value="삭제하기"/>
</form>
</section>


<%@ include file="/WEB-INF/views/common/footer.jsp" %>
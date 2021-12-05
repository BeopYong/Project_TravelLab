<?xml version="1.0" encoding="UTF-8" ?>
<%@page import="com.tlab.mvc.product.model.vo.ProductAttachment"%>
<%@page import="com.tlab.mvc.product.model.vo.Product"%>
<%@page import="com.tlab.mvc.member.model.vo.Member"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ include file="/WEB-INF/views/common/header.jsp" %> 


<%
	Member member = new Member();
	ProductAttachment productAttachment = new ProductAttachment();
	Product product = (Product) request.getAttribute("product");
%>

<section>

<form
	name="ProductFrm"
	method="post"
	enctype="multipart/form-data"
	action="<%= request.getContextPath()%>/cart">
	<table id="tbl-board-view">

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
 		<th>
 		<p name="product_bill"><%= product.getUnit_price() %></p></td>
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
 	<tr>
 		<input type="submit" value="장바구니" />
 		<input type="hidden" name="member_Id" value = <%=member.getMemberId() %> />
 	</tr>
 	
	</form>
	
	
	
 
 <% if (loginMember != null && MemberService.ADMIN_ROLE.equals(loginMember.getMemberRole())) { 
 %>
 	<tr>
 		<td>
 		<input type="button" value="장바구니" onclick="cartIn()" />
		</td>
	</tr>
		<% 	} %>
	</table>
</section>



<form
	name="productDelFrm"
	method="POST" 
	action="<%=request.getContextPath()%>/product/productDelete" >	 	
	<tr>
	<input type="submit" value="삭제하기2" />
	<input type="hidden" name="no" value="<%= product.getNo() %>" />	
	</tr>
</form>





<%@ include file="/WEB-INF/views/common/footer.jsp" %>
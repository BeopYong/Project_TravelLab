<%@page import="com.tlab.mvc.product.model.vo.Product"%>
<?xml version="1.0" encoding="UTF-8" ?>
<%@page import="java.util.List"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ include file="/WEB-INF/views/common/header.jsp" %>

<section>

  <table class="product-table">
    <tr>
      <td colspan="3">뜨는 맛집</td>
      <td><a href="<%= request.getContextPath() %>/product/productFoodList.jsp">더 보기</a></td>
    </tr>
    <tr>
    
<% 
	List<Product> foodList = (List<Product>) request.getAttribute("foodList");
	for(Product product :foodList) { 
%>
	<td><%=product.getAttachCount()%><br /><%=product.getP_name() %></td>
       
<% } %> 
    
    </tr>
  </table>
  
  <table class="product-table">
    <tr>
      <td colspan="3">많이 찾는 장소</td>
      <td><a href="<%= request.getContextPath() %>/product/productPlaceList.jsp">더 보기</a></td>
    </tr>
       <tr>
    
<% 
	List<Product> placeList = (List<Product>) request.getAttribute("placeList");
	for(Product product : placeList) { 
%>
	<td><%=product.getAttachCount()%><br /><%=product.getP_name() %></td>
       
<% } %> 
    
    </tr>
   
  </table>

</section>

<%@ include file="/WEB-INF/views/common/footer.jsp" %>
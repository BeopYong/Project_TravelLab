<%@page import="com.tlab.mvc.product.model.vo.Product"%>
<?xml version="1.0" encoding="UTF-8" ?>
<%@page import="java.util.List"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ include file="/WEB-INF/views/common/header.jsp" %>

<section>

	<table>
	<tr>
      <td colspan="3">뜨는 맛집</td>
      <td><a href="<%= request.getContextPath() %>/product/productFoodList">더 보기</a></td>
    </tr>
    </table>

	<div class="container">
   <%
   	List<Product> foodList = (List<Product>) request.getAttribute("foodList");
   for(Product product : foodList) {
   %>
   
      <div class="product-view">
		<p><a href="<%= request.getContextPath() %>/product/productView?no=<%= product.getNo()%>"><%=product.getAttachCount()%></p>
        <p><%=product.getP_name() %></p>
     </div>
    <% } %>
    </div>
    <div style="clear: both;"></div>






  
  <table class="product-table">
    <tr>
      <td colspan="3">많이 찾는 장소</td>
      <td><a href="<%= request.getContextPath() %>/product/productPlaceList">더 보기</a></td>
    </tr>   
  </table>
  <div class="container">
   <%
   	List<Product> placeList = (List<Product>) request.getAttribute("placeList");
   for(Product product : placeList) {
   %>
   
      <div class="product-view">
		<p><a href="<%= request.getContextPath() %>/product/productView?no=<%= product.getNo()%>"><%=product.getAttachCount()%></p>
        <p><%=product.getP_name() %></p>
     </div>
    <% } %>
    </div>
  

  <table>
	<tr>
		<td>
	  <a href="<%= request.getContextPath()%>/product/productTest">바로가기</a>	
		</td>
	</tr>
  </table>

</section>

<%@ include file="/WEB-INF/views/common/footer.jsp" %>
<%@page import="com.tlab.mvc.product.model.vo.Product"%>
<?xml version="1.0" encoding="UTF-8" ?>
<%@page import="java.util.List"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ include file="/WEB-INF/views/common/header.jsp" %>
<script src="<%=request.getContextPath()%>/js/jquery-3.6.0.js"></script>

<section>

  <table class="product-table">
    <tr>
      <td colspan="3"><h1>추천 맛집</h1></td>
      <td></td>
    </tr>
    <tr> 
   <%
   	List<Product> foodList = (List<Product>) request.getAttribute("foodList");
   for(Product product : foodList) {
   %>

	<td><%=product.getAttachCount()%><br /><%=product.getP_name() %></td>

    <% } %>
    </tr>
  </table>
  

</section>

<div id='pageBar'><%= request.getAttribute("pagebar") %></div>

<%@ include file="/WEB-INF/views/common/footer.jsp" %>
<%@page import="com.tlab.mvc.product.model.vo.Product"%>
<?xml version="1.0" encoding="UTF-8" ?>
<%@page import="java.util.List"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ include file="/WEB-INF/views/common/header.jsp" %>

<section>

  <table class="product-table">
    <tr>
      <td colspan="3"><h1>핫! 플레이스</h1></td>
      <td></td>
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

<div id='pageBar'><%= request.getAttribute("pagebar") %></div>

<%@ include file="/WEB-INF/views/common/footer.jsp" %>
<%@page import="com.tlab.mvc.product.model.vo.Product"%>
<?xml version="1.0" encoding="UTF-8" ?>
<%@page import="java.util.List"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ include file="/WEB-INF/views/common/header.jsp" %>

<section>

   
     <div class="container">
   <%
   	List<Product> placeList = (List<Product>) request.getAttribute("placeList");
   for(Product product : placeList) {
   %>
   
      <div class="product-view">
		<p><%=product.getAttachCount()%></p>
        <p><%=product.getP_name() %></p>
     </div>
    <% } %>
    </div>
    <div style="clear: both;"></div>
    

  

</section>

<div id='pageBar'><%= request.getAttribute("pagebar") %></div>

<%@ include file="/WEB-INF/views/common/footer.jsp" %>
<%@page import="com.tlab.mvc.common.Attachment"%>
<%@page import="com.tlab.mvc.product.model.vo.ProductAttachment"%>
<%@page import="com.tlab.mvc.product.model.vo.Product"%>
<?xml version="1.0" encoding="UTF-8" ?>
<%@page import="java.util.List"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ include file="/WEB-INF/views/common/header.jsp" %>
<%@page import="java.awt.Image"%>
<script src="<%=request.getContextPath()%>/js/jquery-3.6.0.js"></script>


<section>

	<div class="container">
   <%
	ProductAttachment productAttachment = (ProductAttachment) session.getAttribute("pAttach");
   	List<Product> foodList = (List<Product>) request.getAttribute("foodList");
 
   	for(Product product : foodList) {
   %>
   
      <div class="product-view">
		<a href="<%= request.getContextPath() %>/product/productView?no=<%= product.getNo()%>">
		 <img src="<%=request.getContextPath() %>/upload/product/<%=productAttachment.getRenamedFilename() %>" alt="">
		</a>
        <p><%=product.getP_name() %></p>
     </div>
    <% } 
    %>
    </div>
    <div style="clear: both;"></div>
    

  

</section>
  

<div id='pageBar'><%= request.getAttribute("pagebar") %></div>

<%@ include file="/WEB-INF/views/common/footer.jsp" %>
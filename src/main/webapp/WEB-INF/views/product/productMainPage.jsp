<%@page import="com.tlab.mvc.product.model.vo.ProductAttachment"%>
<%@page import="com.tlab.mvc.product.model.vo.Product"%>
<?xml version="1.0" encoding="UTF-8" ?>
<%@page import="java.util.List"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ include file="/WEB-INF/views/common/header.jsp" %>



<%
	ProductAttachment productAttachment = new ProductAttachment();
%>


<section>
	<td>
            <form name="form" action="<%= request.getContextPath()%>/product/productList">
			<select name="p_category" onchange="this.form.submit()">
                <option value="">category</option>
                <option value="101">교통/숙박</option>
                <option value="301">맛집</option>
                <option value="302">장소</option>
			</select><br><br>
            </td>
          </tr>
		  </form>
	
<script>

$(p_category).change((e) => {
	const v = $(e.target).val();
	
});

</script>	

	<table>
	<tr>
      <td colspan="3">여행을 떠나봅시다!</td>
      <td><a href="<%= request.getContextPath()%>/product/productList?p_category=101">더 보기</a></td>
    </tr>
    </table>

	<div class="container">
   <%
   	List<Product> ticketList = (List<Product>) request.getAttribute("ticketList");
   for(Product product : ticketList) {
   %>
   
      <div class="product-view">
		<a href="<%= request.getContextPath() %>/product/productView?no=<%= product.getNo()%>">
		 <img src="<%=request.getContextPath() %>/upload/product/travel_lab.jpg" alt="">
		</a>
        <p><%=product.getP_name() %></p>
     </div>
    <% } %>
    </div>
    <div style="clear: both;"></div>
	
	

	<table>
	<tr>
      <td colspan="3">뜨는 맛집</td>
      <td><a href="<%= request.getContextPath()%>/product/productList?p_category=301">더 보기</a></td>
    </tr>
    </table>

	<div class="container">
   <%
   	List<Product> foodList = (List<Product>) request.getAttribute("foodList");
   for(Product product : foodList) {
   %>
   
      <div class="product-view">
		<a href="<%= request.getContextPath() %>/product/productView?no=<%= product.getNo()%>">
		 <img src="<%=request.getContextPath() %>/upload/product/travel_lab.jpg" alt="">
		</a>
        <p><%=product.getP_name() %></p>
     </div>
    <% } %>
    </div>
    <div style="clear: both;"></div>

  
  <table class="product-table">
    <tr>
      <td colspan="3">많이 찾는 장소</td>
      <td><a href="<%= request.getContextPath()%>/product/productList?p_category=302">더 보기</a></td>
    </tr>   
  </table>
  <div class="container">
   <%
   	List<Product> placeList = (List<Product>) request.getAttribute("placeList");
   for(Product product : placeList) {
   %>
   
      <div class="product-view">
		<a href="<%= request.getContextPath() %>/product/productView?no=<%= product.getNo()%>">
        <img src="<%=request.getContextPath() %>/upload/product/travel_lab.jpg" alt=""></a>
        <p><%=product.getP_name() %></p>
     </div>
    <% } %>
    </div>
  

  <table>
	<tr>
		<td>
	  <a href="<%= request.getContextPath()%>/product/productTest">상품 등록</a>	
		</td>
	</tr>
  </table>

</section>



<%@ include file="/WEB-INF/views/common/footer.jsp" %>
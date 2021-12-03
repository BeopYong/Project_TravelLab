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
      <td><button>더 보기</button></td>
    </tr>
    <tr>
    
<% List<Product> list = (List<Product>) request.getAttribute("list");
	for(Product product :list) { 
%>
	<td><%=product.getAttachCount()%><br /><%=product.getP_name() %></td>
               
<% } %> 
    
    </tr>
  </table>
  
  <table class="product-table">
    <tr>
      <td colspan="3">많이 찾는 장소</td>
      <td><button>더 보기</button></td>
    </tr>
    <tr>
      <td>상품img1</td>
      <td>상품img2</td>
      <td>상품img3</td>
      <td>상품img4</td>
    </tr>
    <tr>
      <td>상품1</td>
      <td>상품2</td>
      <td>상품3</td>
      <td>상품4</td>
    </tr>
    <tr>
      <td>상품img1</td>
      <td>상품img2</td>
      <td>상품img3</td>
      <td>상품img4</td>
    </tr>
    <tr>
      <td>상품1</td>
      <td>상품2</td>
      <td>상품3</td>
      <td>상품4</td>
    </tr>
    
  </table>

</section>

<%@ include file="/WEB-INF/views/common/footer.jsp" %>
<?xml version="1.0" encoding="UTF-8" ?>
<%@page import="com.tlab.mvc.product.model.vo.ProductAttachment"%>
<%@page import="com.tlab.mvc.product.model.vo.Product"%>
<%@page import="com.tlab.mvc.member.model.vo.Member"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ include file="/WEB-INF/views/common/header.jsp" %> 


<%
	Member member = new Member();
	ProductAttachment productAttachment = (ProductAttachment) request.getAttribute("productAttachment");
	Product product = (Product) request.getAttribute("product");
%>

<section>


	<form
	name="ProductFrm"
	method="post"
	enctype="multipart/form-data"
	action="<%= request.getContextPath()%>/cart">
    
    <div class="product-info-container">
      <div class="product-info-img-box">
      	<img src="<%=request.getContextPath() %>/upload/product/<%=productAttachment.getRenamedFilename() %>" alt="">
      </div>

      <div class="product-info-box">
        <table>
          <tr>
            <th>상품명</th>
            <td colspan="2" name="product_name"><%= product.getP_name() %></td>
          </tr>
          <tr>
            <th>지역</th>
            <td colspan="2"><p name="region"><%= product.getRegion() %></p></td>
          </tr>
          <tr>
            <th>가격</th>
            <td><p><%= product.getUnit_price() %></p></td>
            <td>
              <select name="quantity" id="quantity">
                <option value="" selected>수량을 선택하세요. (최대 5개)</option>
                <option value="1">1</option>
                <option value="2">2</option>
                <option value="3">3</option>
                <option value="4">4</option>
                <option value="5">5</option>
              </select>
            </td>
          </tr>
          <tr>
            <th colspan="3" name="product_bill"><span class="totalPrice">2000</span></th>
          </tr>
          <tr>
            <td colspan="3"><div class="product-info"><p><%= product.getP_content() %></p></div></td>
          </tr>
          <tr>
          	<input type="hidden" name="memberId" value="<%= member.getMemberId()%>" />
          </tr>
          
        </table>
      </div>
    
    </form>
    
    <div class="btnbox">
      <button type="button" class="btn btn-primary btn-lg" id="btn">바로 결제</button>
      <button type="button" class="btn btn-secondary btn-lg" id="btn">장바구니</button>
    </div>
  </div>
  
 </section>



<%@ include file="/WEB-INF/views/common/footer.jsp" %>
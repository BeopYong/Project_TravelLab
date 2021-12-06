<?xml version="1.0" encoding="UTF-8" ?>
<%@page import="com.tlab.mvc.product.model.vo.ProductAttachment"%>
<%@page import="com.tlab.mvc.product.model.vo.Product"%>
<%@page import="com.tlab.mvc.member.model.vo.Member"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ include file="/WEB-INF/views/common/header.jsp" %> 

<%
	Member member = (Member) session.getAttribute("loginMember");
	ProductAttachment productAttachment = (ProductAttachment) request.getAttribute("productAttachment");
	Product product = (Product) request.getAttribute("product");
%>

	<form
	name="ProductFrm"
	method="post"
	enctype="multipart/form-data"
	action="<%= request.getContextPath()%>/cart/cartList">
    
    <div class="product-info-container">

      <div class="product-info-img-box">
      	<img src="<%=request.getContextPath() %>/upload/product/<%=productAttachment.getRenamedFilename() %>" alt="">
      </div>

      <div class="product-info-box">
        <table>
          <tr>
            <th>상품명</th>
            <td colspan="2">
            	<p><%=product.getP_name() %></p>
            	<input type="hidden" name="p_name" value="<%=product.getP_name()%>"/>
            </td>
          </tr>
          <tr>
            <th>지역</th>
            <td colspan="2">
            	<p name="region"><%= product.getRegion() %></p>
            	<input type="hidden" name="region" value="<%= product.getRegion()%>"/>
            </td>
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
            <th colspan="3">총 결제 금액</th>
            <td>
            <p></p>
            <input type="hidden" name="product_bill" value="4000" />         
            </td>
          </tr>
          <tr>
            <td colspan="3"><div class="product-info"><p><%=product.getP_content() %></p></div></td>
          </tr>
          <tr>
          </tr>
		<tr>	
		<td>
	       <input type="hidden" id="no" name="no" value="<%=product.getNo()%>"/>
	       <input type="hidden" id="memberId" name="memberId" value="<%=member.getMemberId()%>"/>
		</td>

		</tr>          
        </table>
      </div>
    
    </form>
    
    <div class="btnbox">
     <button type="button" class="btn btn-primary btn-lg" id="btn">바로 결제</button>
<!--	 <button type="submit" class="btn btn-secondary btn-lg" id="btn">장바구니</button> -->
	 <button type="submit" class="btn btn-secondary btn-lg" id="btn">장바구니</button>
    </div>
  </div>
 
  

<%@ include file="/WEB-INF/views/common/footer.jsp" %>
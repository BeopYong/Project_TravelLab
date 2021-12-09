
<!-- 여기부터 쭉 시작 -->
<%@page import="com.tlab.mvc.product.model.vo.ProductAttachment"%>
<%@page import="com.tlab.mvc.product.model.vo.Product"%>
<?xml version="1.0" encoding="UTF-8" ?>
<%@page import="java.util.List"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
    <link
	href="https://cdn.jsdelivr.net/npm/bootstrap@5.1.3/dist/css/bootstrap.min.css"
	rel="stylesheet"
	integrity="sha384-1BmE4kWBq78iYhFldvKuhfTAU6auU8tT94WrHftjDbrCEXSU1oBoqyl2QvZ6jIW3"
	crossorigin="anonymous">
<link rel="stylesheet" href="<%=request.getContextPath() %>/css/product/productView.css" />
<link rel="preconnect" href="https://fonts.googleapis.com">
<link rel="preconnect" href="https://fonts.gstatic.com" crossorigin>
<link href="https://fonts.googleapis.com/css2?family=Libre+Barcode+39+Text&family=Noto+Serif+KR:wght@600&display=swap" rel="stylesheet">
<%@ include file="/WEB-INF/views/common/productHeader2.jsp" %>

<% 
	session.getAttribute("msg");
	ProductAttachment productAttachment = (ProductAttachment) request.getAttribute("productAttachment");
	Product product = (Product) request.getAttribute("product");
%>
	<form
	name="ProductFrm"
	method="post"
	enctype="multipart/form-data"
	action="<%= request.getContextPath()%>/cart/cartList">
    
    <div class="all-wrapper">
    <div class="container">
      <div class="img-box">
	 	<%
		if (productAttachment != null) {
	 	%>
      	<img src="<%=request.getContextPath() %>/upload/product/<%=productAttachment.getRenamedFilename() %>" alt="">
      <% } else { %>
		 <img src="<%=request.getContextPath() %>/upload/product/travel_lab.jpg" alt="">
      	<% } %>
      	</div>
      	  <div class="left">
      	  <br /><br />
      	  <div class="product">
      	  <label for="product">상품명 : </label>
      	  <p><%=product.getP_name()%></p>
      	  <input type="hidden" name="p_name" value="<%=product.getP_name()%>"/>
      	  </div>
      	    
      	    <div class="product">
			<label for="product">지역 : </label>
      	  <p><%=product.getRegion()%></p>
      	  <input type="hidden" name="region" value="<%=product.getRegion()%>"/>
      	  </div>
      	  
      	    <div class="product">
      	  <label for="product">가격 : </label>
      	  <p><%=product.getUnit_price()%>원</p>
      	  <input type="hidden" name="unit_price" value="<%= product.getUnit_price()%>"/>
      	  </div>
      	  
      	  <div class="product">
      	  <form name="form">
			<select name="quantity" onChange="getSelectValue(this.form);">
 				<option value="0" selected>수량을 선택하세요. (최대 5개)</option>
                <option value="1">1</option>
                <option value="2">2</option>
                <option value="3">3</option>
                <option value="4">4</option>
                <option value="5">5</option>
			</select>
      	  </div>
      	  <div class="product">
      	  <label for="">총 결제금액 : </label>
			<input type="text" name="product_bill" readonly>
      	  </div>
      	  <div class="barcode">
      	  	<p>Travel Lab</p>
      	  </div>
      	  </form>
      	  </div>
      	  
      	  <div class="right">
      	  <h1>✔상세 정보✔</h1>
      	  <p><%=product.getP_content() %></p>
      	  </div>
      	
      	
      		<tr>	
		<td>
	    <input type="hidden" id="no" name="no" value="<%=product.getNo()%>"/>
		
		
		<%
			Member member = (Member) session.getAttribute("loginMember");
			if (member != null) {
		%>
		<input type="hidden" id="memberId" name="memberId" value="<%=member.getMemberId()%>"/>
		<%
			}
		%>
		</td>
		</tr>          
        </table>
      </div>
    
    </form>
    
   <form action="<%= request.getContextPath()%>/product/productDelete" method="POST" name="ProductDelFrm">
   	<input type="hidden" name="no" value="<%= product.getNo()%>"/>
   </form>
    
    
    <div class="btnbox">
     <button type="button" class="btn btn-primary btn-lg" id="btn1">바로 결제</button>
<!--	 <button type="submit" class="btn btn-secondary btn-lg" id="btn">장바구니</button> -->
	 <button type="submit" class="btn btn-secondary btn-lg" id="btn2">장바구니</button>
    </div>
    
    
    <% 	if( loginMember != null && MemberService.ADMIN_ROLE.equals(loginMember.getMemberRole())){ %>
		<table>
		<tr>
			<%-- 작성자와 관리자만 마지막행 수정/삭제버튼이 보일수 있게 할 것 --%>
			<th colspan="2">
				<input type="button" value="수정하기" onclick="updateProduct()">
				<input type="button" value="삭제하기" onclick="deleteProduct()">
			</th>
		</tr>
		</table>
		<% 	} %>


<script>
const deleteProduct = () => {
	if(confirm("등록된 상품을 삭제하시겠습니까?")){
		$(document.ProductDelFrm).submit();		
	}
};

const updateProduct = () => {
	location.href = "<%= request.getContextPath() %>/product/productUpdate?no=<%= product.getNo() %>";
};

function getSelectValue(frm) {
 frm.product_bill.value = frm.quantity.options[frm.quantity.selectedIndex].value * <%=product.getUnit_price()%>;
};

</script>
      	
      	
      	
      	
      	
      	
      	</div>
    </div>
      	
      	
      	
      	
      	
      	
      	
      	
      	
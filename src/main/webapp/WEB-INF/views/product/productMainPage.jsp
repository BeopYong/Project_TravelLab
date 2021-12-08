<!DOCTYPE html>
<html lang="en">
<head>
  <meta charset="UTF-8">
  <meta http-equiv="X-UA-Compatible" content="IE=edge">
  <meta name="viewport" content="width=device-width, initial-scale=1.0">
  <title>당신의 여행을 응원합니다</title>
</head>
<body>


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
<link rel="preconnect" href="https://fonts.googleapis.com">
<link rel="preconnect" href="https://fonts.gstatic.com" crossorigin>
 <link rel="stylesheet" href="/tlab/css/product/main.css" />
 <link rel="stylesheet" href="/tlab/css/product.css" />
<link
	href="https://fonts.googleapis.com/css2?family=Noto+Serif+KR:wght@600&display=swap"
	rel="stylesheet">
<!-- 위에 지키고 여기에 헤더 넣으면 됨 -->


<%
	List<ProductAttachment> pAttach = (List<ProductAttachment>)request.getAttribute("pAttach");
%>


  <div class="product-main-box">

    <form name="form"
			action="<%=request.getContextPath()%>/product/productList">
      <select name="p_category" onchange="this.form.submit()">
        <option value="">category</option>
        <option value="101">항공</option>
        <option value="102">버스</option>
        <option value="103">KTX</option>
        <option value="201">숙박</option>
        <option value="301">맛집</option>
        <option value="302">장소</option>
      </select>
    </form>
	
<script>

$(p_category).change((e) => {
	const v = $(e.target).val();
	
});

</script>	

		<div id="product-container">
			<div id="search-p_content" class="search-type">
				<form action="<%=request.getContextPath()%>/product/productFinder">
					<input type="hidden" name="searchType" value="p_content" />
					<input type="text" name="searchKeyword" size = "25" placeholder="검색할 내용을 입력하세요." id="product-seaerch-bar" />
					<button type="submit">검색</button>
				</form>
			</div>
	</div>
	
	
	<tr>
		<td>
	  <a href="<%= request.getContextPath()%>/product/productTest">바로가기</a>	
		</td>
	</tr>

   	<form action="<%= request.getContextPath()%>/product/productEnroll" method="POST" name="ProductEnrollFrm">
   	<input type="hidden" name="no" value="">
   </form>

    <div class="product-view-header">
      <div style="flex-grow: 1;"><p class="p-ad-ment"><a href="<%=request.getContextPath()%>/product/productList?p_category=101">여행을 떠나봅시다!<a></a></p></div>
    </div>
	

	<div class="container">
   <%
   	List<Product> ticketList = (List<Product>) request.getAttribute("ticketList");
   for(Product product : ticketList) {
   %>
   
      <div class="product-view">
		<a href="<%= request.getContextPath() %>/product/productView?no=<%= product.getNo()%>">
		 <img src="<%=request.getContextPath() %>/upload/product/travel_lab.jpg" alt="">
        <p><%=product.getP_name() %></p></a>
     </div>
    <% } %>
    </div>
    <div style="clear: both;"></div>
	
	

	   <div class="product-view-header">
      <p class="p-ad-ment"><a href="<%=request.getContextPath()%>/product/productList?p_category=301">여행의 꽃 맛집</p></a>
    </div>
	<div class="container">
	
   <%
   	List<Product> foodList = (List<Product>) request.getAttribute("foodList");
   for(Product product : foodList) {
   %>
   
      <div class="product-view">
		<a href="<%= request.getContextPath() %>/product/productView?no=<%= product.getNo()%>">
		 <img src="<%=request.getContextPath() %>/upload/product/travel_lab.jpg" alt="">
        <p><%=product.getP_name() %></p></a>
     </div>
    <% } %>
    </div>
    <div style="clear: both;"></div>

  
      <div class="product-view-header">
      <div style="flex-grow: 1;"><p class="p-ad-ment"><a href="<%=request.getContextPath()%>/product/productList?p_category=302">요즘 핫! 플레이스</a></p></div>
    </div>
  
  <div class="container">
   <%
   	List<Product> placeList = (List<Product>) request.getAttribute("placeList");
   for(Product product : placeList) {
   %>
   
      <div class="product-view">
		<a href="<%= request.getContextPath() %>/product/productView?no=<%= product.getNo()%>">
        <img src="<%=request.getContextPath() %>/upload/product/travel_lab.jpg" alt="">
        <p><%=product.getP_name() %></p>
        </a>
     </div>
    <% } %>
    </div>

<script
	src="https://cdn.jsdelivr.net/npm/bootstrap@5.1.3/dist/js/bootstrap.bundle.min.js"
	integrity="sha384-ka7Sk0Gln4gmtz2MlQnikT1wXgYsOg+OMhuP+IlRH9sENBO0LRn5q+8nbTov4+1p"
	crossorigin="anonymous"></script>
<script>
const enrollProduct = () => {
	if(confirm("상품을 등록하시겠습니까?")){
		$(document.ProductEnrollFrm).submit();		
	}
};
</script>

</section>
</div>

<!-- 푸터자리 -->
</body>
</html>
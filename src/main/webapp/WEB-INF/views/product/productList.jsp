<!DOCTYPE html>
<%@page import="com.tlab.mvc.product.model.vo.ProductEntity"%>
<html lang="en">
<head>
  <meta charset="UTF-8">
  <meta http-equiv="X-UA-Compatible" content="IE=edge">
  <meta name="viewport" content="width=device-width, initial-scale=1.0">
  <title>당신의 여행을 응원합니다</title>

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
<style>
.p_container {
	margin : 10px;
	width : 80%;
}
</style>
</head>
<body>
<script src="<%=request.getContextPath()%>/js/jquery-3.6.0.js"></script>

<section>

<div p_container>
	<td>
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
	


	<div class="container">
	
   <%
    List<ProductAttachment> pAttach = (List<ProductAttachment>) request.getAttribute("pAttach");
   	List<ProductEntity> productList = (List<ProductEntity>) request.getAttribute("productList");
 
   	for(ProductEntity product : productList) {
   %>
      <div class="product-view">
		<a href="<%= request.getContextPath() %>/product/productView?no=<%=product.getNo()%>">
		 <img src="<%=request.getContextPath() %>/upload/product/travel_lab.jpg" alt="">
		</a>
        <p><%=product.getP_name() %></p>
     </div>
    <% }
    %>
    </div>
    <div style="clear: both;"></div>
    

</div>
  

</section>
  

<div id='pageBar'><%= request.getAttribute("pagebar") %></div>

</body>
</html>
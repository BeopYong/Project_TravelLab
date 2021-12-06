<%@page import="com.tlab.mvc.product.model.service.ProductService"%>
<%@page import="com.tlab.mvc.product.model.vo.ProductEntity"%>
<%@page import="java.util.List"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%
List<ProductEntity> list = (List<ProductEntity>) request.getAttribute("list");
System.out.println("productList@productList.jsp" + list);
String searchType = request.getParameter("searchType");
String searchKeyword = request.getParameter("searchKeyword");
/* HttpSession session = request.getSession(); */
%>
<%@ include file="/WEB-INF/views/common/header.jsp"%>
<!-- 관리자용 admin.css link -->
<link rel="stylesheet"
	href="<%=request.getContextPath()%>/css/productList.css" />
<style>
section#content {
	background-color: #FAFDFF;
	float: left;
	width: 940px;
	min-height: 500px;
}

div#search-container {
	margin: 0 0 10px 0;
	padding: 3px;
	text-align: center;
	border-radius: 10px;
	background-color: #B6EAE4;
}

div#search-cateCode {
	display: <%=searchType == null || "cateCode".equals(searchType) ? "inline-block" : "none"%>;
}

div#search-gdsName {
	display: <%="gdsName".equals(searchType) ? "inline-block" : "none"%>;
}
</style>

<section id="productList-container">
	<h2>상품관리</h2>

	<div id="search-container">
		<label for="searchType">검색타입 :</label> <select id="searchType">
			<option value="cateCode"
				<%="cateCode".equals(searchType) ? "selected" : ""%>>지역번호</option>
			<option value="gdsName"
				<%="gdsName".equals(searchType) ? "selected" : ""%>>상품명</option>
		</select>
		<div id="search-cateCode" class="search-type">
			<form action="<%=request.getContextPath()%>/admin/productFinder">
				<input type="hidden" name="searchType" value="cateCode" /> <input
					type="text" name="searchKeyword"
					value="<%="cateCode".equals(searchType) ? searchKeyword : ""%>"
					size="25" placeholder="검색할 지역번호를 입력하세요." />
				<button type="submit">검색</button>
			</form>
		</div>
		<div id="search-gdsName" class="search-type">
			<form action="<%=request.getContextPath()%>/admin/productFinder">
				<input type="hidden" name="searchType" value="gdsName" /> <input
					type="text" name="searchKeyword"
					value="<%="gdsName".equals(searchType) ? searchKeyword : ""%>"
					size="25" placeholder="검색할 상품명을 입력하세요." />
				<button type="submit">검색</button>
			</form>
		</div>
	</div>


	<table id="tbl-product">
		<thead>
			<tr>
				<th class="region" style="table-layout: fixed">지역번호</th>
				<th class="productCategory" style="table-layout: fixed">상품카테고리</th>
				<th class="productName" style="table-layout: fixed">상품명</th>
				<th class="price" style="table-layout: fixed">단위가격</th>
				<th class="stock" style="table-layout: fixed">재고</th>
				<th class="valid" style="table-layout: fixed">유효</th>
				<th class="regDate" style="table-layout: fixed">등록날짜</th>
			</tr>
		</thead>
		<tbody>
			<%
			for (ProductEntity product : list) {
			%>
			<tr>
				<td width="40px" style="table-layout: fixed"><%=product.getRegion() != null ? product.getRegion() : ""%></td>
				<td width="40px" style="table-layout: fixed"><%=product.getP_category()%></td>
				<td width="150px" style="table-layout: fixed"><%=product.getP_name()%></td>
				<td width="40px" style="table-layout: fixed"><%=product.getUnit_price() != 0 ? product.getUnit_price() : ""%></td>
				
				<td style="table-layout: fixed">
					<form 
						name="productStockUpdateFrm"
						action="<%= request.getContextPath() %>/admin/productStockUpdate"
						method="POST">
						<input type="hidden" name="productName"
							value="<%= product.getP_name() %>" />
						<select name="productStock" class="product-stock">
							<option value="<%= product.getP_stock() %> selected"><%= product.getP_stock() %></option>
							<option value="0">0</option>
							<option value="1">1</option>
							<option value="2">2</option>
							<option value="3">3</option>
							<option value="4">4</option>
							<option value="5">5</option>
							<option value="6">6</option>
							<option value="7">7</option>
							<option value="8">8</option>
							<option value="9">9</option>
							<option value="10">10</option>
							<option value="11">11</option>
							<option value="12">12</option>
							<option value="13">13</option>
							<option value="14">14</option>
							<option value="15">15</option>
						</select>
					</form>
				</td>
				<td style="table-layout: fixed">
					 <form name="productValidUpdateFrm"
						action="<%=request.getContextPath()%>/admin/productValidUpdate"
						method="POST">
						<input type="hidden" name="productName"
							value="<%= product.getP_name() %>" /> 
						<select name="productValid" class="product-valid">
							<option value="<%=ProductService.VALID_Y%>"
								<%=ProductService.VALID_Y.equals(product.getValid()) ? "selected" : ""%>>Y</option>
							<option value="<%=ProductService.VALID_N%>"
								<%=ProductService.VALID_N.equals(product.getValid()) ? "selected" : ""%>>N</option>
						</select>
					</form> 
				</td>
				<td width="100px" style="table-layout: fixed"><%=product.getReg_date()%></td>
			</tr>
			<%
			}
			%>
		</tbody>
	</table>
	<div id="pageBar">
		<%=request.getAttribute("pagebar")%>
	</div>
</section>
<script>
/**
 * 검색 div 노출
 */

$(searchType).change((e) => {
	$(".search-type").hide();
	
	const v = $(e.target).val();
	$("#search-" + v).css("display", "inline-block");
});


$(".product-valid").change((e) => {
	const $select = $(e.target);
	const productValid = $select.val();
	console.log(productValid);
	if(confirm(`상품의 구매가능 여부를 [\${productValid}]로 변경하시겠습니까?`)){
		const $frm = $select.parent();
		$frm.submit();
	}
	else {
		// selected 초기값으로 복원
		$select.children("[selected]").prop("selected", true);
	}
});



$(".product-stock").change((e) => {
	const $select = $(e.target);
	const productStock = $select.val();
	console.log(productStock);
	if(confirm(`수량을 [\${productStock}]로 변경하시겠습니까?`)){
		const $frm = $select.parent();
		$frm.submit();
	}
	else {
		// selected 초기값으로 복원
		$select.children("[selected]").prop("selected", true);
	}
});
</script>
<%@ include file="/WEB-INF/views/common/footer.jsp"%>







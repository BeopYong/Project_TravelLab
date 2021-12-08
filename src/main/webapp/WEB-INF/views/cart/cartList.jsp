<%@page import="com.tlab.mvc.cart.model.vo.Cart"%>
<%@page import="java.util.List"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ include file="/WEB-INF/views/common/header.jsp" %>
<%
	List<Cart> list = (List<Cart>) request.getAttribute("list");
%>
<style>
#memberCartList {
	border-collapse: collapse;
	line-height: 1.5;
	text-align: center;
}
#memberCartList thead th {
	padding: 10px;
	font-weight: bold;
	vertical-align: top;
	color: black;
	border-bottom: 3px solid #036;
	text-align: center;
	background-color: #d8c1ff5e;
}
table#memberCartList {
	background: #efefef;
}
section#cartList-container h3 {
	text-align: center;
}
section#cartList-container table#memberCartList {
	border-collapse: collapse;
	margin-left: auto;
	margin-right: auto;
}
table#memberCartList td {
	border-bottom: 1px solid black;
	padding: 10px;
	background-color: #ffff;
}
.btn-pay {
	display: block;
	margin: auto;
	width: 60px;
	color: #000000;
    border: #000000 solid 1px;
    border-radius: 20%;
    padding: 10px;
    background-color: #ffffff;
}
.btn-pay:hover {
    color: #ffffff;
    background-color: #000000;
}
</style>
<body>
<section id="cartList-container">
	<h3>장바구니 목록</h3>
	<form action="<%=request.getContextPath()%>/member/cartList"
		name="cartListFrm"
		method="get">
		<input type="hidden" name="memberId" value="<%= loginMember.getMemberId() %>" />
		<table id="memberCartList">
			<thead>
				<tr>
					<th style="table-layout: fixed">체크박스</th>
					<th style="table-layout: fixed">No</th>
					<th style="table-layout: fixed">상품명</th>
					<th style="table-layout: fixed">수량</th>
					<th style="table-layout: fixed">회원아이디</th>
					<th style="table-layout: fixed">총액</th>
				</tr>
			</thead>
			<tbody>
				<%
				for (Cart cart : list) {
				%>
				<tr>
					<td><input type="checkbox" name="cartSelect" onclick="return cart_checkbox()" value="<%=cart.getProduct_name() + " " + cart.getQuantity() + "개"%>"/>
						<td width="100px" style="table-layout: fixed"><%=cart.getNo()%></td>
						<td width="200px" style="table-layout: fixed"><%=cart.getProduct_name()%></td>
						<td width="100px" style="table-layout: fixed"><%=cart.getQuantity()%></td>
						<td width="100px" style="table-layout: fixed"><%=cart.getMember_id()%></td>
						<td width="100px" style="table-layout: fixed"><%=cart.getProduct_bill()%>원</td>
					</td>
				</tr>
				<%
				}
				%>
			</tbody>
		</table>
	</form>
</section>
<button type="button" class="btn-pay" onclick="payment()">결제</button>
</body>
<script>
	function cart_checkbox(){
		var flag = true;
		var values = document.getElementsByName("cartSelect");
		if(values[i].checked){
			request.getSession(values[i]);
		}
		return flag;
	}
	let payment = function(){
		if(confirm("결제하시겠습니까?")){
			alert("결제가 진행중입니다....잠시만 기다려주세요");
			location.href="<%=request.getContextPath()%>/member/orderList";		
		}
	}
</script>

<%@ include file="/WEB-INF/views/common/footer.jsp" %>
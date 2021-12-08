<%@page import="com.tlab.mvc.payment.model.vo.Payment"%>
<%@page import="java.util.List"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ include file="/WEB-INF/views/common/header.jsp" %> 
<%
	List<Payment> list = (List<Payment>) request.getAttribute("list");
%>
<style>
#memberPaymentList {
	border-collapse: collapse;
	line-height: 1.5;
	text-align: center;
}
#memberPaymentList thead th {
	padding: 10px;
	font-weight: bold;
	vertical-align: top;
	color: black;
	border-bottom: 3px solid #036;
	text-align: center;
	background-color: #d8c1ff5e;
}
table#memberPaymentList {
	background: #efefef;
}
section#paymentList-container h3 {
	text-align: center;
}
section#paymentList-container table#memberPaymentList {
	border-collapse: collapse;
	margin-left: auto;
	margin-right: auto;
}
table#memberPaymentList td {
	border-bottom: 1px solid black;
	padding: 10px;
	background-color: #ffff;
}
tbody th {
	border-bottom: 1px solid black;
	background-color: #d8c1ff5e;
}
</style>
<body>
<section id="paymentList-container">
	<h3>결제내역</h3>
	<table id="memberPaymentList">
		<thead>
			<tr>
				<th style="table-layout: fixed">회원아이디</th>
				<th style="table-layout: fixed">주문코드</th>
				<th style="table-layout: fixed">상품명</th>
				<th style="table-layout: fixed">수량</th>
				<th style="table-layout: fixed">상품가격</th>
			</tr>
		</thead>
		<tbody>
			<%
			for (Payment payment : list) {
				int sum = 0;
			%>
			<tr>
				<td width="100px" style="table-layout: fixed"><%=payment.getMemberId()%></td>
				<td width="100px" style="table-layout: fixed"><%=payment.getOrderCode()%></td>
				<td width="200px" style="table-layout: fixed"><%=payment.getProductName()%></td>
				<td width="100px" style="table-layout: fixed"><%=payment.getQuantity()%></td>
				<td width="100px" style="table-layout: fixed"><%=payment.getTotalBill()%>원</td>
			</tr>
			<%
			}
			%>
			<th colspan="4" style="table-layout: fixed">총 결제금액</th>
			<th style="table-layout: fixed">140,000원</th>
		</tbody>
	</table>
</section>








<%@ include file="/WEB-INF/views/common/footer.jsp" %>
<%@page import="com.tlab.mvc.orderlist.model.vo.OrderList"%>
<%@page import="java.util.List"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ include file="/WEB-INF/views/common/header.jsp"%>	
<%
List<OrderList> list = (List<OrderList>) request.getAttribute("orderList");
%>	
<style>
tr th, td{
	text-align: center;
}
</style>
	<h1>구매내역</h1>
	<form action="<%=request.getContextPath()%>/member/orderList"
		name="orderListFrm"
		method="get">
		<input type="hidden" name="memberId" value="<%= loginMember.getMemberId() %>" />
		<table id="memberOrderList">
			<thead>
				<tr>
					<th style="table-layout: fixed">No</th>
					<th style="table-layout: fixed">주문코드</th>
					<th style="table-layout: fixed">회원아이디</th>
					<th style="table-layout: fixed">결제금액</th>
					<th style="table-layout: fixed">구매날짜</th>
				</tr>
			</thead>
			<tbody>
				<%
				for (OrderList orderList : list) {
				%>
				<tr>
					<td width="100px" style="table-layout: fixed"><%=orderList.getNo()%></td>
					<td width="100px" style="table-layout: fixed"><%=orderList.getOrderCode()%></td>
					<td width="100px" style="table-layout: fixed"><%=orderList.getMemberId()%></td>
					<td width="100px" style="table-layout: fixed"><%=orderList.getTotalBill()%></td>
					<td width="100px" style="table-layout: fixed"><%=orderList.getPaymentDate()%></td>
				</tr>
				<%
				}
				%>
			</tbody>
		</table>
	</form>
	
<%@ include file="/WEB-INF/views/common/footer.jsp"%>

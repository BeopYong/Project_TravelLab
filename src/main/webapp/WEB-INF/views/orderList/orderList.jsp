<%@page import="com.tlab.mvc.orderlist.model.vo.OrderList"%>
<%@page import="java.util.List"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ include file="/WEB-INF/views/common/header.jsp"%>	
<%
List<OrderList> list = (List<OrderList>) request.getAttribute("orderList");
%>	
<style>
    .table {
        border: 1px solid black;
        border-radius: 10%;
        width: 500px;
        height: 200px;
        margin: auto;
        margin-top: 130px;
        background-color: #ffff;
    }
    #test {
	    text-align: center;
	    margin-top: 70px;
    }
    .btn-pay {
    	display: block;
		margin: auto;
		width: 60px;
		transform: translate(0, -65px);
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
    <div class="table">
        <p id="test">
            <strong><%= loginMember.getMemberId() %>님</strong>&nbsp;결제가 완료되었습니다.<br> 주문코드는 <strong style="color: red;">123456</strong> 입니다. 감사합니다.
        </p>
    </div>
	<button type="button" class="btn-pay" onclick="location.href='<%=request.getContextPath()%>/member/payment'">확인</button>
</body>
	
<%@ include file="/WEB-INF/views/common/footer.jsp"%>

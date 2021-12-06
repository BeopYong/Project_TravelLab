package com.tlab.mvc.payment.controller;

import java.io.IOException;
import java.util.List;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import com.tlab.mvc.member.model.vo.Member;
import com.tlab.mvc.orderlist.model.vo.OrderList;
import com.tlab.mvc.payment.model.service.PaymentService;

/**
 * Servlet implementation class PaymentServlet
 */
@WebServlet("/PaymentServlet")
public class PaymentServlet extends HttpServlet {
	private static final long serialVersionUID = 1L;
	private PaymentService paymentService = new PaymentService();

	/**
	 * @see HttpServlet#doGet(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		try {
			HttpSession session = request.getSession();
			Member memberId = (Member) session.getAttribute("loginMember");
			System.out.println("페이먼트서블릿멤버아이디 = " + memberId);
//			List<OrderList> orderList = orderListService.selectAllOrderList(memberId);
//			System.out.println("페이먼트서블릿오더리스트 = " + orderList);
//			
//			request.setAttribute("orderList", orderList);
			request
				.getRequestDispatcher("/WEB-INF/views/orderList/orderList.jsp")
				.forward(request, response);
		 } catch(Exception e){
			 e.printStackTrace();
			 throw e;
		 }
		
		
		
		
	}
}



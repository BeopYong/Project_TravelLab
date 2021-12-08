package com.tlab.mvc.orderlist.controller;

import java.io.IOException;
import java.util.List;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import com.tlab.mvc.member.model.vo.Member;
import com.tlab.mvc.orderlist.model.service.OrderListService;
import com.tlab.mvc.orderlist.model.vo.OrderList;

/**
 * Servlet implementation class OrderListServlet
 */
@WebServlet("/member/orderList")
public class OrderListServlet extends HttpServlet {
	private static final long serialVersionUID = 1L;
	private OrderListService orderListService = new OrderListService();
       
	/**
	 * @see HttpServlet#doGet(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
//		try {
//			HttpSession session = request.getSession();
//			Member memberId = (Member) session.getAttribute("loginMember");
////			String memberId = request.getParameter("memberId");
//			System.out.println("오더리스트서블릿멤버아이디 = " + memberId);
//			List<OrderList> orderList = orderListService.selectAllOrderList(memberId);
//			System.out.println("list@OrderListServlet = " + orderList);
//			
//			request.setAttribute("orderList", orderList);
//			request
//				.getRequestDispatcher("/WEB-INF/views/orderList/orderList.jsp")
//				.forward(request, response);
//		 } catch(Exception e){
//			 e.printStackTrace();
//			 throw e;
//		 }
		request
		.getRequestDispatcher("/WEB-INF/views/orderList/orderListTest.jsp")
		.forward(request, response);
	}
}

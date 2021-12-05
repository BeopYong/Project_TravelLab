package com.tlab.mvc.cart.controller;

import java.io.IOException;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

/**
 * Servlet implementation class CartServlet
 */
@WebServlet("/cart")
public class CartServlet extends HttpServlet {
	private static final long serialVersionUID = 1L;

	/**
	 * @see HttpServlet#doPost(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		// TODO Auto-generated method stub
		
		String product_name = request.getParameter("p_name");
		String region = request.getParameter("region");
		int product_bill = Integer.parseInt(request.getParameter("unit_price"));
		int quantity = Integer.parseInt(request.getParameter("quantity"));
		
		
		
		//상품 상세 페이지 다시 보여줘야 함!!!!!!!!!! -> 리다이렉트
		
		request.getRequestDispatcher("/WEB-INF/views/cart/cart.jsp")
		.forward(request, response);
	}

}

package com.tlab.mvc.cart.controller;

import java.io.IOException;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.tlab.mvc.cart.model.service.CartService;
import com.tlab.mvc.product.model.vo.Product;

/**
 * Servlet implementation class CartServlet
 */
@WebServlet("/cart")
public class CartServlet extends HttpServlet {
	private static final long serialVersionUID = 1L;
	private CartService cartService = new CartService();
	private Product product = new Product();
	
	/**
	 * @see HttpServlet#doPost(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		// TODO Auto-generated method stub
//		
		String product_name = request.getParameter("product_name");
		System.out.println(product_name);
//		int product_bill = Integer.parseInt(request.getParameter("product_bill"));
//		int quantity = Integer.parseInt(request.getParameter("quantity"));
//		String memberId = request.getParameter("memberId");
//		
//		Cart cart = new Cart(0, product_name, product_bill, quantity, memberId);
//		System.out.println("cartServlet" + cart);
//		
		
		//상품 상세 페이지 다시 보여줘야 함!!!!!!!!!! -> 리다이렉트
		
		String location = request.getContextPath() + "/WEB-INF/views/productView?no=" + product.getNo();
		
		response.sendRedirect(location);
	}

}

package com.tlab.mvc.product.controller;

import java.io.IOException;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

/**
 * Servlet implementation class ProductDeleteServlet
 */
@WebServlet("/product/productDelete")
public class ProductDeleteServlet extends HttpServlet {
	private static final long serialVersionUID = 1L;

	/**
	 * @see HttpServlet#doPost(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		// TODO Auto-generated method stub
		
		int productNo = Integer.parseInt(request.getParameter("no"));
		System.out.println(productNo);
	
		request
		.getRequestDispatcher("/WEB-INF/views/product/productMainPage.jsp")
		.forward(request, response);
		
		
	}
	
	

}

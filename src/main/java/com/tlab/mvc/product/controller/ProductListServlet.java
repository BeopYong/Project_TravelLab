package com.tlab.mvc.product.controller;

import java.io.IOException;
import java.util.HashMap;
import java.util.List;
import java.util.Map;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.tlab.mvc.product.model.service.ProductService;
import com.tlab.mvc.product.model.vo.Product;

/**
 * Servlet implementation class ProductEnrollServlet
 */
@WebServlet("/photo/photoList")
public class ProductListServlet extends HttpServlet {
	private static final long serialVersionUID = 1L;
	private ProductService productService = new ProductService();

	/**
	 * @see HttpServlet#doPost(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
	//1. 사용자 입력값
		int cPage = 1;
		final int numPerPage = 4;
			
		try {
			cPage = Integer.parseInt(request.getParameter("cPage"));
		} catch (NumberFormatException e) {}
		
		int end = cPage * numPerPage;
		
		Map<String, Integer>param = new HashMap<>();
		param.put("end", end);
		
		List<Product> list = productService.randomProductList(param);
		System.out.println("list@servlet = " + list);
		
		request.setAttribute("list", list);
		request
		.getRequestDispatcher("/WEB-INF/views/product/productList.jsp")
		.forward(request, response);
	}

}

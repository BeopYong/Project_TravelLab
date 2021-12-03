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
 * Servlet implementation class ProductFoodListServlet
 */
@WebServlet("/product/productFoodList")
public class ProductFoodListServlet extends HttpServlet {
	private static final long serialVersionUID = 1L;
	private ProductService productService = new ProductService();

	/**
	 * @see HttpServlet#doGet(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		
		int cPage = 1;
		final int numPerPage = 12;
			
		try {
			cPage = Integer.parseInt(request.getParameter("cPage"));
		} catch (NumberFormatException e) {}
		
		int end = cPage * numPerPage;
		int food = 301;
		
		Map<String, Integer>param = new HashMap<>();
		param.put("end", end);
		param.put("301", food);
		
		List<Product> foodList = productService.productFoodList(param);
		
		
		request.getRequestDispatcher("/WEB-INF/views/product/productFoodList.jsp")
		.forward(request, response);
	}

}

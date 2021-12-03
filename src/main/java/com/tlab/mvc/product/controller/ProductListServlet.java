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
		int food = 301;
		int festival = 302;
		
		Map<String, Integer>param = new HashMap<>();
		param.put("end", end);
		param.put("301", food);
		param.put("302", festival);
		
		List<Product> foodList = productService.randomProductFoodList(param);
		List<Product> placeList = productService.randomProductPlaceList(param);
		
		request.setAttribute("foodList", foodList);
		request.setAttribute("placeList", placeList);
		request
		.getRequestDispatcher("/WEB-INF/views/product/productMainList.jsp")
		.forward(request, response);
	}

}

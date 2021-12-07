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
import com.tlab.mvc.product.model.vo.ProductEntity;

/**
 * Servlet implementation class ProductFinderServlet
 */
@WebServlet("/product/productFinder")
public class ProductFinderServlet extends HttpServlet {
	private static final long serialVersionUID = 1L;
	private ProductService productService = new ProductService();
	
	/**
	 * @see HttpServlet#doPost(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		//1. 사용자 입력값 처리
				String region = request.getParameter("region");
				String p_content = request.getParameter("p_content");
				
				Map<String, Object> searchParam = new HashMap<>();
				searchParam.put("region", region);
				searchParam.put("p_content", p_content);
				System.out.println("param@servlet = " + searchParam);
				
				//2. 업무로직
				List<ProductEntity> list = productService.searchProduct(searchParam);
				System.out.println("list@servlet = " + list);
				
				//3. view단 처리
				request.setAttribute("list", list);
				request.getRequestDispatcher("/WEB-INF/views/product/productList.jsp")
				.forward(request, response);
	}

}

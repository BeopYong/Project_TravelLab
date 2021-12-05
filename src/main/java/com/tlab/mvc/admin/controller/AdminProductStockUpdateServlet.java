package com.tlab.mvc.admin.controller;

import java.io.IOException;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.tlab.mvc.member.model.vo.Member;
import com.tlab.mvc.product.model.service.ProductService;
import com.tlab.mvc.product.model.vo.ProductEntity;

/**
 * Servlet implementation class AdminProductStockUpdateServlet
 */
@WebServlet("/admin/productStockUpdate")
public class AdminProductStockUpdateServlet extends HttpServlet {
	private static final long serialVersionUID = 1L;
	private ProductService productService = new ProductService();

	/**
	 * @see HttpServlet#doPost(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		// 1. 사용자입력값처리
		try {
			String productName = request.getParameter("productName");
			int productStock = Integer.parseInt(request.getParameter("productStock"));
			ProductEntity product = new ProductEntity();
			product.setP_name(productName);
			product.setP_stock(productStock);

			// 2. 업무로직
			int result = productService.updateProductStock(product);
		} catch (Exception e) {
			e.printStackTrace();
			throw e;
		}
		
		// 3. redirect
		response.sendRedirect(request.getContextPath() + "/admin/productList");
	}

}

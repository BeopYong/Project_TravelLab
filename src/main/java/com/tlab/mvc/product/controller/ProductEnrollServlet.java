package com.tlab.mvc.product.controller;

import java.io.IOException;
import java.util.Date;

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
@WebServlet("/product/productEnroll")
public class ProductEnrollServlet extends HttpServlet {
	private static final long serialVersionUID = 1L;
	private ProductService productSevice = new ProductService();

	/**
	 * @see HttpServlet#doPost(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		
		//product 객체
		//insert into product (no,region,p_category,p_name,p_stock,unit_price) values (seq_product_no.nextval,? , ? , ?, ? ,?);
		String region = request.getParameter("region");
		int p_category = Integer.parseInt(request.getParameter("p_category"));
		String p_name = request.getParameter("p_name");
		String p_content = request.getParameter("p_content");
		String p_day_ = request.getParameter("p_day");
		int p_stock = Integer.parseInt(request.getParameter("p_stock"));
		int unit_price = Integer.parseInt(request.getParameter("unit_price"));
		

		//업무 로직
		
		//redirect
		
		
	}

}

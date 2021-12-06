package com.tlab.mvc.product.controller;

import java.io.IOException;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.tlab.mvc.product.model.service.ProductService;
import com.tlab.mvc.product.model.vo.Product;
import com.tlab.mvc.product.model.vo.ProductAttachment;

/**
 * Servlet implementation class ProductViewServlet
 */
@WebServlet("/product/productView")
public class ProductViewServlet extends HttpServlet {
	private static final long serialVersionUID = 1L;
	private ProductService productService = new ProductService();
	/**
	 * @see HttpServlet#doGet(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		
		//사용자 입력값
		int no = Integer.parseInt(request.getParameter("no"));
		
		//업무 로직
		//product 조회
		Product product = productService.selectOneProduct(no);
		System.out.println("[productView@Servlet!!!!!!!!!!!!!!! = " + product);
		//attachment 조회
		ProductAttachment productAttachment = productService.selectOneProductAttachment(no);
		System.out.println("[productView@Servlet!!!!!!!!!!!!!!! = " + productAttachment);

		//view
		request.setAttribute("product", product);
		request.setAttribute("productAttachment", productAttachment);
		request.getRequestDispatcher("/WEB-INF/views/product/productView.jsp")
		.forward(request, response);
		
		
	}

}

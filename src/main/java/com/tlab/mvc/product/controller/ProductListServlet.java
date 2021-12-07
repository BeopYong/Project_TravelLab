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
import javax.servlet.http.HttpSession;

import com.tlab.mvc.common.MvcUtils;
import com.tlab.mvc.product.model.service.ProductService;
import com.tlab.mvc.product.model.vo.Product;

/**
 * Servlet implementation class ProductEnrollServlet
 */
@WebServlet("/product/productList")
public class ProductListServlet extends HttpServlet {
	private static final long serialVersionUID = 1L;
	private ProductService productService = new ProductService();

	/**
	 * @see HttpServlet#doPost(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
	
		int p_category = Integer.parseInt(request.getParameter("p_category"));
		int cPage = 1;
		final int numPerPage = productService.selectTotalList(p_category);
			
		try {
			cPage = Integer.parseInt(request.getParameter("cPage"));
		} catch (NumberFormatException e) {}
		
		int start = (cPage - 1) * numPerPage + 1;
		int end = cPage * numPerPage;
		
		Map<String, Integer>param = new HashMap<>();
		param.put("start", start);
		param.put("end", end);
		
		
		//업무로직
		List<Product> productList = productService.selectAllProductList(param, p_category);	
		System.out.println(productList);
		
		
		//페이지바 : MvcUtils.getPagebar 호출
		//totalContent, url
		
		String url = request.getRequestURI(); // /mvc/product/productFoodList
//		System.out.println("productfoodlist@url = " + url);
		
		int totalContent = productService.selectTotalList(p_category);
		String pagebar = MvcUtils.getPagebar(cPage, numPerPage, totalContent, url);
		System.out.println("pagebar = " + pagebar);
		
		
		
		//view
		HttpSession session = request.getSession();
		
		request.setAttribute("productList", productList);
		request.setAttribute("pagebar", pagebar);
		request
		.getRequestDispatcher("/WEB-INF/views/product/productList.jsp")
		.forward(request, response);
		
	}

}


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

import com.tlab.mvc.common.MvcUtils;
import com.tlab.mvc.product.model.service.ProductService;
import com.tlab.mvc.product.model.vo.Product;

/**
 * Servlet implementation class ProductFoodListServlet
 */
@WebServlet("/product/productPlaceList")
public class ProductPlaceListServlet extends HttpServlet {
	private static final long serialVersionUID = 1L;
	private ProductService productService = new ProductService();
	
	/**
	 * @see HttpServlet#doGet(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		
		int cPage = 1;
		final int numPerPage = 8;
			
		try {
			cPage = Integer.parseInt(request.getParameter("cPage"));
		} catch (NumberFormatException e) {}
		
		int start = (cPage - 1) * numPerPage + 1;
		int end = cPage * numPerPage;
		int place = 302;
		
		Map<String, Integer>param = new HashMap<>();
		param.put("start", start);
		param.put("end", end);
		param.put("302", place);
		
		
		//업무로직
		List<Product> placeList = productService.productPlaceList(param);
		
		System.out.println("pfl@servlet = " + placeList); //ok
		
		//페이지바 : MvcUtils.getPagebar 호출
		//totalContent, url
		
		String url = request.getRequestURI(); // /mvc/product/productFoodList
//		System.out.println("productfoodlist@url = " + url);
		
		int totalContent = productService.selectTotalPlaceList(param);
		String pagebar = MvcUtils.getPagebar(cPage, numPerPage, totalContent, url);
		System.out.println("pagebar = " + pagebar);
		
		
		
		//view
		request.setAttribute("placeList", placeList);
		request.setAttribute("pagebar", pagebar);
		request
		.getRequestDispatcher("/WEB-INF/views/product/productPlaceList.jsp")
		.forward(request, response);
	}

}

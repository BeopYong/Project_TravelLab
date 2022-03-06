package com.tlab.mvc.admin.controller;

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
import com.tlab.mvc.product.model.vo.ProductEntity;

/**
 * Servlet implementation class AdminProductListServlet
 */
@WebServlet("/admin/productList")
public class AdminProductListServlet extends HttpServlet {
	private static final long serialVersionUID = 1L;
	private ProductService productService = new ProductService();

	/**
	 * @see HttpServlet#doGet(HttpServletRequest request, HttpServletResponse
	 *      response)
	 */
	protected void doGet(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {
		try {
			final int numPerPage = 5;
			int cPage = 1;
			try {
				cPage = Integer.parseInt(request.getParameter("cPage"));
			} catch (NumberFormatException e) {
			}
			int start = (cPage - 1) * numPerPage + 1;
			int end = cPage * numPerPage;
			Map<String, Integer> param = new HashMap<>();
			param.put("start", start);
			param.put("end", end);

			// 2.업무로직
			// 2-a. content영역
			List<ProductEntity> list = productService.selectAllProduct(param);
			System.out.println("[AdminProductListServlet] = " + list);
			// 2-b. pagebar영역
			int totalContent = productService.selectTotalProductCount();
			String url = request.getRequestURI();
			System.out.println(totalContent);
			System.out.println(url);
			String pagebar = MvcUtils.getPagebar(cPage, numPerPage, totalContent, url);
			System.out.println("AdminProductListServlet.pagebar] = " + pagebar);

			// 3.view단처리
			request.setAttribute("list", list);
			request.setAttribute("pagebar", pagebar);
			request.getRequestDispatcher("/WEB-INF/views/admin/productListTest.jsp").forward(request, response);
		} catch (Exception e) {
			e.printStackTrace();
			throw e;
		}
	}

}

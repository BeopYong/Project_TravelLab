package com.tlab.mvc.magazine.controller;

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
import com.tlab.mvc.magazine.model.service.MagazineService;
import com.tlab.mvc.magazine.model.vo.Magazine;
import com.tlab.mvc.magazine.model.vo.MagazineEntity;

/**
 * Servlet implementation class MagazineFinderServlet
 */
@WebServlet("/magazine/magazineFinder")
public class MagazineFinderServlet extends HttpServlet {
	private static final long serialVersionUID = 1L;
	private MagazineService magazineService = new MagazineService();

	/**
	 * @see HttpServlet#doGet(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		
			//파라미터 검색타입, 검색단어
			String searchType = request.getParameter("searchType");
			String searchWord = request.getParameter("searchWord");
			System.out.println("searchType / searchWord @magazinefinderServlet = " + searchType + searchWord);
			
			//tostring 처리 되어있는 map key = value가 열람가능
			Map<String, Object> finder = new HashMap<>();
			finder.put("searchType", searchType);
			finder.put("searchKeyword", searchWord);
			System.out.println("param@magazinefinderservlet = " + finder);
			
			//업무로직
			List<Magazine> list = magazineService.searchMagazine(finder);
//		System.out.println("searchmagazinelist@magazinrfiderservlet = ", list);
			
			//페이징
			//a
			int cPage = 1;
			final int numPerPage = 5;
			
			try {
				cPage = Integer.parseInt(request.getParameter("cPage"));
			} catch (NumberFormatException e) {	}
			int start = (cPage - 1) * numPerPage + 1;
			int end = cPage * numPerPage;
			Map<String, Integer> param = new HashMap<>();
			param.put("start", start);
			param.put("end", end);
			//b
//			int totalCount = magazineService.selectTotalMagazineCount();
			int totalCount = 1;
			String url = request.getRequestURI(); // -> /tlab/magazine/magazineList
			String pagebar = MvcUtils.getPagebar(cPage, numPerPage, totalCount, url);
			
			//view단 처리
			request.setAttribute("pagebar", pagebar);
			request.setAttribute("list", list);
			request.getRequestDispatcher("/WEB-INF/views/magazine/magazineList.jsp")
					.forward(request, response);
		
	}

}

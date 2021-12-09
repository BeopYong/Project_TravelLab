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

/**
 * Servlet implementation class magazineListServlet
 */
@WebServlet("/magazine/magazineList")
public class MagazineListServlet extends HttpServlet {
	private static final long serialVersionUID = 1L;
	private MagazineService magazineService = new MagazineService();

	/**
	 * 
	 * 매거진 목록조회 paging recipe 1. content section - cPage 현재페이지 - numPerPage 한페이지의
	 * 게시물수 10 - startNum, endNum
	 * 
	 * 2. pagebar section - totalContent 총게시물수 - totalPage 12 - pagebarSize 5 -
	 * pageNo 증감변수 - pageStart | pageEnd - url
	 * 
	 * @see HttpServlet#doGet(HttpServletRequest request, HttpServletResponse
	 *      response)
	 */
	protected void doGet(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {
		try {
			// 1. 사용자 입력값
			int cPage = 1;
			final int numPerPage = 5;

			try {
				cPage = Integer.parseInt(request.getParameter("cPage"));
			} catch (NumberFormatException e) {
			}
			int start = (cPage - 1) * numPerPage + 1;
			int end = cPage * numPerPage;
			Map<String, Integer> param = new HashMap<>();
			param.put("start", start);
			param.put("end", end);

			// 2. 업루로직
			// 2-a. content영역 : 페이징
			List<Magazine> list = magazineService.selectAllMagazine(param);
			System.out.println("list@magazinlistServlet paging = " + list);

			// 2-b.pagebar영역 : Mvcutil에서 불러오기 totalContent, url
			int totalCount = magazineService.selectTotalMagazineCount();
			String url = request.getRequestURI(); // -> /tlab/magazine/magazineList
			String pagebar = MvcUtils.getPagebar(cPage, numPerPage, totalCount, url);
//			System.out.println("pagebar@magazinlistServlet = pagebar " + pagebar);

			// 3. view단처리
			request.setAttribute("list", list);
			request.setAttribute("pagebar", pagebar);
			request.getRequestDispatcher("/WEB-INF/views/magazine/magazineList.jsp").forward(request, response);

		} catch (ServletException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
			throw e;
		} catch (IOException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
			throw e;
		}
	}

}

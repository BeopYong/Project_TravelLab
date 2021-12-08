package com.tlab.mvc.member.controller;

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
import com.tlab.mvc.magazine.model.vo.Magazine;
import com.tlab.mvc.member.model.vo.Member;

/**
 * Servlet implementation class MemberMyScrapFinder
 */
@WebServlet("/member/scrapFinder")
public class MemberMyScrapFinder extends HttpServlet {
	private static final long serialVersionUID = 1L;
	private MagazineService magazineService = new MagazineService();
	/**
	 * @see HttpServlet#doGet(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {

		final int numPerPage = 10;
		int cPage = 1;
		try {
			cPage = Integer.parseInt(request.getParameter("cPage"));
		} catch (NumberFormatException e) {}
		int start = (cPage - 1) * numPerPage + 1;
		int end = cPage * numPerPage;
		Map<String, Integer> param = new HashMap<>();
		param.put("start", start);
		param.put("end", end);
		
		String searchType = request.getParameter("searchType");
		String searchKeyword = request.getParameter("searchKeyword");
		Map<String,Object> searchParam = new HashMap<>();
		searchParam.put("searchType", searchType);
		searchParam.put("searchKeyword",searchKeyword);
		System.out.println("param@MyScrapServlet"+searchParam);
		
		List<Magazine> list = magazineService.searchMyScrap(searchParam);
		System.out.println("list@servlet = " + list);
		
		//int totalContent = memberService.selectTotalScrapSearchCount();
		int totalContent = 1;
		String url = request.getRequestURI(); // /mvc/admin/memberList
		System.out.println(totalContent);
		System.out.println(url);
		String pagebar = MvcUtils.getPagebar(cPage, numPerPage, totalContent, url);
		System.out.println("pagebar@servlet = " + pagebar);
		
		request.setAttribute("list", list);
		request.setAttribute("pagebar", pagebar);
		request
			.getRequestDispatcher("/WEB-INF/views/admin/memberListTest.jsp")
			.forward(request, response);
	}

}

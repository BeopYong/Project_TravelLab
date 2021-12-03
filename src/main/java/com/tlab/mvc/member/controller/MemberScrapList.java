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

/**
 * Servlet implementation class MemberScrapList
 */
@WebServlet("/member/magazineScrapList")
public class MemberScrapList extends HttpServlet {
	private static final long serialVersionUID = 1L;
	private MagazineService magazineService = new Magazine();
	/**
	 * @see HttpServlet#doGet(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		try {
			String writer = request.getParameter("memberId");
			final int numPerPage = 6;
			int cPage =1;
			try {
				cPage= Integer.parseInt(request.getParameter("cPage"));
			} catch(Exception e) {
				
			}
			int start = (cPage -1) * numPerPage +1;
			int end = cPage * numPerPage;
			Map<String,Integer> param = new HashMap<>();
			param.put("start", start);
			param.put("end", end);
			
			
			//내가 스크랩한 매거진을 모두 받아오기 
			List<Magazine> magazineList = magazineService.selectAllMyScrap(param,writer);
			System.out.println("list@MyScrapListServlet = " + magazineList);
			int totalContent = magazineService.selectTotalMyScrapCount(writer);
			String url = request.getRequestURI(); // /mvc/admin/magazineScrapList
			System.out.println(totalContent);
			System.out.println(url);
			String pagebar = MvcUtils.getPagebar(cPage, numPerPage, totalContent, url);
			System.out.println("pagebar@MyScrapListServlet = " + pagebar);
			
			request.setAttribute("list", magazineList);
			request.setAttribute("pagebar", pagebar);
			request
				.getRequestDispatcher("/WEB-INF/views/admin/memberListTest.jsp")
				.forward(request, response);
		} catch (Exception e) {
			e.printStackTrace();
			throw e;
		} 
	}


}

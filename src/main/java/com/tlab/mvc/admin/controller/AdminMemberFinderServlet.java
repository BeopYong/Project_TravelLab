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

import com.tlab.mvc.member.model.vo.Member;
import com.tlab.mvc.common.MvcUtils;
import com.tlab.mvc.member.model.service.MemberService;

/**
 * Servlet implementation class AdminMemberFinderServlet
 */
@WebServlet("/admin/memberFinder")
public class AdminMemberFinderServlet extends HttpServlet {
	private static final long serialVersionUID = 1L;
	private MemberService memberService = new MemberService();
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
		// 1. 사용자 입력값 처리
			String searchType = request.getParameter("searchType");
			String searchKeyword = request.getParameter("searchKeyword");
			
			Map<String, Object> searchParam = new HashMap<>();
			searchParam.put("searchType", searchType);
			searchParam.put("searchKeyword", searchKeyword);
			System.out.println("param@servlet = "+ searchParam);
			
			// 2. 업무로직
			List<Member> list = memberService.searchMember(searchParam);
			System.out.println("list@servlet = " + list);
			
			// 3.
			// 2-b. pagebar영역
//			int totalContent = memberService.selectTotalMemberSearchCount();
			int totalContent = 1;
			String url = request.getRequestURI(); // /mvc/admin/memberList
			System.out.println(totalContent);
			System.out.println(url);
			String pagebar = MvcUtils.getPagebar(cPage, numPerPage, totalContent, url);
			System.out.println("pagebar@servlet = " + pagebar);
			
			// 3.view단처리
			request.setAttribute("list", list);
			request.setAttribute("pagebar", pagebar);
			request
				.getRequestDispatcher("/WEB-INF/views/admin/memberListTest.jsp")
				.forward(request, response);
				
	}

}

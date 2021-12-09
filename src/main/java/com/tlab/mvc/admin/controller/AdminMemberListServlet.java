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
import com.tlab.mvc.member.model.service.MemberService;
import com.tlab.mvc.member.model.vo.Member;

/**
 * Servlet implementation class AdminMemberListServlet
 */
@WebServlet("/admin/memberList")
public class AdminMemberListServlet extends HttpServlet {
	private static final long serialVersionUID = 1L;
	private MemberService memberService = new MemberService();

	protected void doGet(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {
		// 1.사용자입력값
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
			List<Member> list = memberService.selectAllMember(param);
			System.out.println("list@MemberListServlet = " + list);
			// 2-b. pagebar영역
			int totalContent = memberService.selectTotalMemberCount();
			String url = request.getRequestURI(); // /mvc/admin/memberList
			System.out.println(totalContent);
			System.out.println(url);
			String pagebar = MvcUtils.getPagebar(cPage, numPerPage, totalContent, url);
			System.out.println("pagebar@MemberListServlet = " + pagebar);

			// 3.view단처리
			request.setAttribute("list", list);
			request.setAttribute("pagebar", pagebar);
			request.getRequestDispatcher("/WEB-INF/views/admin/memberListTest.jsp").forward(request, response);
		} catch (Exception e) {
			e.printStackTrace();
			throw e;
		}
	}
}

package com.tlab.mvc.member.controller;

import java.io.IOException;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.Cookie;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import org.apache.log4j.Logger;

import com.tlab.mvc.member.model.service.MemberService;
import com.tlab.mvc.member.model.vo.Member;

/**
 * Servlet implementation class MemberEnrollServlet
 */
@WebServlet("/new/memberEnroll")
public class MemberEnrollServlet extends HttpServlet {
	private static final long serialVersionUID = 1L;
	private MemberService memberService = new MemberService();
	private Logger logger = Logger.getRootLogger();

	/**
	 * @see HttpServlet#doGet(HttpServletRequest request, HttpServletResponse
	 *      response)
	 */
	protected void doGet(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {
		request
			.getRequestDispatcher("/WEB-INF/views/member/memberEnrollTest.jsp")
			.forward(request, response);
	}
	/**
	 * @see HttpServlet#doPost(HttpServletRequest request, HttpServletResponse
	 *      response)
	 */
	protected void doPost(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {

		try {
			String memberId=request.getParameter("memberId");
			int payCode = "".equals(request.getParameter("payCode")) ? 0: Integer.parseInt(request.getParameter("payCode"));
			Member member = new Member(request.getParameter("memberId"), 
									request.getParameter("password"),
									request.getParameter("memberName"), 
									request.getParameter("email"),
									payCode, 
									request.getParameter("tel")
									);
			System.out.println("member@[memberEnroll] = "+member);
			int result = memberService.insertMember(member);

			HttpSession session = request.getSession();
			session.setAttribute("msg", result > 0 ? "회원가입성공!" : "회원가입실패!");
			
			response.sendRedirect(request.getContextPath()+"/");
			Cookie cookie = new Cookie("savedId",memberId);
			cookie.setMaxAge(60*60*24);
			response.addCookie(cookie);
		} catch (Exception e) {
			e.printStackTrace();
			logger.debug(e.getMessage());
			throw e;
		}
	}

}

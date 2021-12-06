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
 * Servlet implementation class MemberDeleteServlet
 */
@WebServlet("/member/memberDelete")
public class MemberDeleteServlet extends HttpServlet {
	private static final long serialVersionUID = 1L;
	private MemberService memberService = new MemberService();
	private Logger logger = Logger.getRootLogger();

	@Override
	protected void doGet(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {
		request.getRequestDispatcher("/WEB-INF/views/member/memberDelete.jsp").forward(request, response);
	}

	/**
	 * @see HttpServlet#doPost(HttpServletRequest request, HttpServletResponse
	 *      response)
	 */
	@Override
	protected void doPost(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {
		HttpSession session = request.getSession();
		try {
			// 로그인용 생성자
			String memberId = request.getParameter("memberId");
			String pwd = request.getParameter("password");
			Member member = new Member(memberId, pwd);
			System.out.println("@memberDeleteServlet = " + memberId +", "+ pwd);
			int result = memberService.deleteMember(member);

			if (result > 0) {
				session.setAttribute("msg", "회원정보 삭제성공");
				session.removeAttribute("loginMember");

				Cookie c = new Cookie("saveId", member.getMemberId());
				c.setPath(request.getContextPath());
				c.setMaxAge(0);
				response.addCookie(c);

			}
			response.sendRedirect(request.getContextPath() + "/");
		} catch (Exception e) {
			e.printStackTrace();
			session.setAttribute("msg", "회원 정보삭제 실패");
			response.sendRedirect(request.getContextPath()+"/member/myPage");
		}
	}

}

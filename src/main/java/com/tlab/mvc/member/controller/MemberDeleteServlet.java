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

/**
 * Servlet implementation class MemberDeleteServlet
 */
@WebServlet("/member/memberDelete")
public class MemberDeleteServlet extends HttpServlet {
	private static final long serialVersionUID = 1L;
	private MemberService memberService = new MemberService();
	private Logger logger = Logger.getRootLogger();

	/**
	 * @see HttpServlet#doPost(HttpServletRequest request, HttpServletResponse
	 *      response)
	 */
	protected void doPost(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {
		try {
			String memberId = request.getParameter("memberId");

			int result = memberService.deleteMember(memberId);

			HttpSession session = request.getSession();
			if (result > 0) {
				session.setAttribute("msg", "성공적으로 회원정보 삭제하였습니다.");
				session.removeAttribute("loginMember");

				Cookie c = new Cookie("saveId", memberId);
				c.setPath(request.getContextPath());
				c.setMaxAge(0);
				response.addCookie(c);

			} else {
				session.setAttribute("msg", "회원 정보삭제를 실패하였습니다.");
			}
			response.sendRedirect(request.getContextPath() + "/");
		} catch (Exception e) {
			e.printStackTrace();
			logger.debug(e.getMessage());
			throw e;
		}
	}

}

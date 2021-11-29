package com.tlab.mvc.member.controller;

import java.io.IOException;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import com.tlab.mvc.member.model.service.MemberService;
import com.tlab.mvc.member.model.vo.Member;

/**
 * Servlet implementation class MemberUpdatePasswordServlet
 */
@WebServlet("/member/updatePassword")
public class MemberUpdatePasswordServlet extends HttpServlet {
	private static final long serialVersionUID = 1L;
	private MemberService memberService = new MemberService();

	/**
	 * @see HttpServlet#doGet(HttpServletRequest request, HttpServletResponse
	 *      response)
	 */
	protected void doGet(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {
		request.getRequestDispatcher("/WEB-INF/views/member/updatePassword.jsp").forward(request, response);
	}

	/**
	 * @see HttpServlet#doPost(HttpServletRequest request, HttpServletResponse
	 *      response)
	 */
	protected void doPost(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {
		try {
			HttpSession session = request.getSession();
			Member member = (Member) session.getAttribute("loginMember");
			String oldPassword = request.getParameter("oldPassword");
			String newPassword = request.getParameter("newPassword");
			
			Member oldMember = memberService.selectOneMember(member.getMemberId());
			if(!(oldMember.getPassword().equals(oldPassword))) {
				session.setAttribute("msg", "기존 비밀번호와 다릅니다.");
				response.sendRedirect(request.getContextPath() + "/member/updatePassword");
				return;
			}
			Member pwChangeMember = new Member(member.getMemberId(),newPassword);
			int result = memberService.updatePassword(pwChangeMember);
			
			session.setAttribute("msg", "변경성공");
			response.sendRedirect(request.getContextPath()+"/member/myInfo");
		} catch (IOException e) {
			e.printStackTrace();
			
		}
	}

}

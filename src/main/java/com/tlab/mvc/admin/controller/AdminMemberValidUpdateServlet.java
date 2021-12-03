package com.tlab.mvc.admin.controller;

import java.io.IOException;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.tlab.mvc.member.model.service.MemberService;
import com.tlab.mvc.member.model.vo.Member;

/**
 * Servlet implementation class AdminMemberValidUpdateServlet
 */
@WebServlet("/admin/memberValidUpdate")
public class AdminMemberValidUpdateServlet extends HttpServlet {
	private static final long serialVersionUID = 1L;
	private MemberService memberService = new MemberService();

	/**
	 * @see HttpServlet#doGet(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		
	}
	/**
	 * @see HttpServlet#doPost(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		String memberId = request.getParameter("memberId");
		String memberValid = request.getParameter("memberValid");
		Member member = new Member();
		member.setMemberId(memberId);
		member.setValid(memberValid);

		// 2. 업무로직
		int result = memberService.updateMemberValid(member);

		// 3. redirect
		response.sendRedirect(request.getContextPath() + "/admin/memberList");
	}

}

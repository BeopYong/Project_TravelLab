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
 * Servlet implementation class AdminMemberRoleUpdateServlet
 */
@WebServlet("/admin/memberRoleUpdate")
public class AdminMemberRoleUpdateServlet extends HttpServlet {
	private static final long serialVersionUID = 1L;
	private MemberService memberService = new MemberService();

	/**
	 * sql - update member set member_role = ? where member_id = ?
	 */
	protected void doPost(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {
		// 1. 사용자입력값처리
		try {
			String memberId = request.getParameter("memberId");
			String memberRole = request.getParameter("memberRole");
			Member member = new Member();
			member.setMemberId(memberId);
			member.setMemberRole(memberRole);

			// 2. 업무로직
			int result = memberService.updateMemberRole(member);
		} catch (Exception e) {
			e.printStackTrace();
			throw e;
		}

		// 3. redirect
		response.sendRedirect(request.getContextPath() + "/admin/memberList");
	}

}

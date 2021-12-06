package com.tlab.mvc.member.controller;

import java.io.IOException;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import org.apache.log4j.Logger;

import com.tlab.mvc.member.model.service.MemberService;
import com.tlab.mvc.member.model.vo.Member;

/**
 * Servlet implementation class MemberChangeInfoServlet
 */
@WebServlet("/member/memberUpdate")
public class MemberChangeInfoServlet extends HttpServlet {
	private static final long serialVersionUID = 1L;
	private MemberService memberService = new MemberService();
	private Logger logger = Logger.getRootLogger();
	/**
	 * @see HttpServlet#doGet(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {

	}

	/**
	 * @see HttpServlet#doPost(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		HttpSession session = request.getSession();
		
		try {
			String memberId = request.getParameter("memberId");
			Member member= new Member(
								request.getParameter("memberId"),
								request.getParameter("memberName"),
								Integer.parseInt(request.getParameter("payCode")),
								request.getParameter("email"),
								request.getParameter("tel")
								);
			
			int result = memberService.updateMember(member);
			
			if(result>0) {
				Member updateMember = memberService.selectOneMember(memberId);
				session.setAttribute("loginMember",updateMember);
			} else {
				response.sendRedirect(request.getHeader("referer"));
			}
			session.setAttribute("msg", result > 0 ? "정보수정성공!" : "정보수정실패!" );
			response.sendRedirect(request.getContextPath()+"/");
			
		} catch(Exception e) {
			 e.printStackTrace();
			 logger.debug(e.getMessage());
			 throw e; // tomcat의 error.jsp 위임
		}
	}

}

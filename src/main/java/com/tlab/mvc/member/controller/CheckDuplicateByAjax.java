package com.tlab.mvc.member.controller;

import java.io.IOException;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.google.gson.Gson;
import com.tlab.mvc.member.model.service.MemberService;
import com.tlab.mvc.member.model.vo.Member;

/**
 * Servlet implementation class CheckDuplicateByAjax
 */
@WebServlet("/member/checkIdDuplicateByAjax")
public class CheckDuplicateByAjax extends HttpServlet {
	private static final long serialVersionUID = 1L;
	private MemberService memberService = new MemberService();
	/**
	 * @see HttpServlet#doGet(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {

		Member member = null;
		String msg="";
		try {
			// 1.사용자입력값
			String checkId = request.getParameter("memberId");
			System.out.println(checkId+"@[chkIdByAjax]");
			// 2.업무로직 : 1명 조회
			if (checkId!=null) {
				member = memberService.selectOneMember(checkId);
				msg = member!=null? "not allowed" : "allowed";
			} else {
				msg ="there is no memberId delivered to Servlet";
			}
		} catch (Exception e) {
			e.printStackTrace();
		}
		System.out.println("[memberCheckIdByAjax] member = " + member);
		
		response.setContentType("application/json; charset=utf-8");
		new Gson().toJson(msg, response.getWriter());
	}

}

package com.tlab.mvc.member.controller;

import java.io.IOException;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

/**
 * Servlet implementation class MemberViewServlet
 */
@WebServlet("/member/myInfo")
public class MemberMyInfoServlet extends HttpServlet {
	private static final long serialVersionUID = 1L;

	/**
	 * @see HttpServlet#doGet(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {

		// 1. 업무로직 session에 저장되어있기때문에 jsp에서 바로 불러올 수 있다.
		
		// 2. view단 jsp위임
		request
			.getRequestDispatcher("/WEB-INF/views/member/myInfoTest.jsp")
			.forward(request, response);
	}

}

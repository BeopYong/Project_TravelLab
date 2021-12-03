package com.tlab.mvc.cs.controller;

import java.io.IOException;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.tlab.mvc.cs.model.service.CsService;

/**
 * Servlet implementation class BoardListServlet
 */
@WebServlet("/board/boardList")
public class CsListServlet extends HttpServlet {
	private static final long serialVersionUID = 1L;
	private CsService boardService = new CsService();

	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		request
			.getRequestDispatcher("/WEB-INF/views/cs/csList.jsp")
			.forward(request, response);
	}


}

package com.tlab.mvc.admin.controller;

import java.io.IOException;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.tlab.mvc.cs.model.vo.CsEntity;

/**
 * Servlet implementation class AdminCsboardValidUpdate
 */
@WebServlet("/admin/csboardValidUpdate")
public class AdminCsboardValidUpdate extends HttpServlet {
	private static final long serialVersionUID = 1L;

	

	/**
	 * @see HttpServlet#doPost(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {

		String boardNo = request.getParameter("boardno");
		String boardValid = request.getParameter("boardValid");
		
		/*
		 * CsEntity csboard = new CsEntity(boardNo,boardValid);
		 * 
		 * int result = csEntityService.updateCsBoardValid(csBoard);
		 */
		
		response.sendRedirect(request.getContextPath()+"/admin/magazineList");
	}

}

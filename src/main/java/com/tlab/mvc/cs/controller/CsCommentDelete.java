package com.tlab.mvc.cs.controller;

import java.io.IOException;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.tlab.mvc.cs.model.service.CsService;

/**
 * Servlet implementation class CsCommentDelete
 */
@WebServlet("/cs/csCommentDelete")
public class CsCommentDelete extends HttpServlet {
	private static final long serialVersionUID = 1L;
	private CsService csService = new CsService();

	/**
	 * @see HttpServlet#doPost(HttpServletRequest request, HttpServletResponse
	 *      response)
	 */
	protected void doPost(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {
		int csBoardno = Integer.parseInt(request.getParameter("csBoardno"));
		int no = Integer.parseInt(request.getParameter("no"));
		System.out.println("csBoardno=" + csBoardno + ", no = " + no);

		int result = csService.deleteCsComment(no);
		String msg = (result > 0) ? "댓글이 삭제 되었습니다." : "댓글 삭제에 실패하였습니다.";

		request.getSession().setAttribute("msg", msg);
		String location = request.getContextPath() + "/cs/csView?no=" + csBoardno;
		response.sendRedirect(location);
	}

}

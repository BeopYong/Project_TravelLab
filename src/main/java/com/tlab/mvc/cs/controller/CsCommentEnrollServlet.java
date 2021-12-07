package com.tlab.mvc.cs.controller;

import java.io.IOException;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.tlab.mvc.cs.model.service.CsService;
import com.tlab.mvc.cs.model.vo.CsComment;

/**
 * Servlet implementation class CsCommentEnrollServlet
 */
@WebServlet("/cs/csCommentEnroll")
public class CsCommentEnrollServlet extends HttpServlet {
	private static final long serialVersionUID = 1L;
	private CsService csService = new CsService();
    
	/**
	 * @see HttpServlet#doPost(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		// 1.사용자입력값
		int csBoardno = Integer.valueOf(request.getParameter("csBoardno"));
		int commentLevel = Integer.valueOf(request.getParameter("commentLevel"));
		int commentRef = Integer.valueOf(request.getParameter("commentRef"));
		String writer = request.getParameter("writer");
		String content = request.getParameter("content");
		
		CsComment cc = new CsComment(0, commentLevel, writer, content, csBoardno, commentRef, null);
		System.out.println("[CsCommentEnrollServlet] " + cc);
		
		// 2.업무로직
		int result = csService.insertCsComment(cc);
		String msg = result > 0 ? "댓글이 등록 되었습니다." : "댓글 등록에 실패하였습니다.";
		request.getSession().setAttribute("msg", msg);
		
		// 3.redirect: 게시글상세페이지
		String location = request.getContextPath() + "/cs/csView?no=" + csBoardno;
		response.sendRedirect(location);
		
	}

}

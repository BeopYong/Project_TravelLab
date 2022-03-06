package com.tlab.mvc.magazine.controller;

import java.io.IOException;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.tlab.mvc.magazine.model.service.MagazineService;
import com.tlab.mvc.magazine.model.vo.MagazineComment;

/**
 * Servlet implementation class MagazineCommentEnrollServlet
 */
@WebServlet("/magazine/magazineCommentEnroll")
public class MagazineCommentEnrollServlet extends HttpServlet {
	private static final long serialVersionUID = 1L;
	private MagazineService magazineService = new MagazineService();

	/**
	 * @see HttpServlet#doPost(HttpServletRequest request, HttpServletResponse
	 *      response)
	 */
	protected void doPost(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {
		// 1.사용자입력값
		int magazineNo = Integer.valueOf(request.getParameter("magazineNo"));
		int commentLevel = Integer.valueOf(request.getParameter("commentLevel"));
		int commentRef = Integer.valueOf(request.getParameter("commentRef"));
		String writer = request.getParameter("writer");
		String content = request.getParameter("content");

		MagazineComment mc = new MagazineComment(0, commentLevel, writer, content, magazineNo, commentRef, null);
		System.out.println("[MagazineCommentEnrollServlet] mc = " + mc);

		// 2.업무로직
		int result = magazineService.insertMagazineComment(mc);
		String msg = result > 0 ? "댓글 등록 성공!" : "댓글 등록 실패!";
		request.getSession().setAttribute("msg", msg);

		// 3.redirect: 게시글상세페이지 /board/boardView?no=
		String location = request.getContextPath() + "/magazine/magazineView?no=" + magazineNo;
		response.sendRedirect(location);
	}

}

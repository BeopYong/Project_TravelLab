package com.tlab.mvc.magazine.controller;

import java.io.IOException;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.tlab.mvc.magazine.model.service.MagazineService;

/**
 * Servlet implementation class MagazineCommentDeleteServlet
 */
@WebServlet("/magazine/magazineCommentDelete")
public class MagazineCommentDeleteServlet extends HttpServlet {
	private static final long serialVersionUID = 1L;
	private MagazineService magazineService = new MagazineService();

	/**
	 * @see HttpServlet#doPost(HttpServletRequest request, HttpServletResponse
	 *      response)
	 */
	protected void doPost(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {
		// 1. 파라미터값 가져오기
		int magazineNo = Integer.parseInt(request.getParameter("magazineNo"));
		int no = Integer.parseInt(request.getParameter("no"));
		System.out.println("magazineNo=" + magazineNo + ", no = " + no);

		// 2. 비지니스로직 호출
		int result = magazineService.deleteMagazineComment(no);
		String msg = (result > 0) ? "댓글 삭제 성공!" : "댓글 삭제 실패!";

		// 3. 받은 결과에 따라 view단 처리위임.
		request.getSession().setAttribute("msg", msg);
		String location = request.getContextPath() + "/magazine/magazineView?no=" + magazineNo;
		response.sendRedirect(location);
	}

}

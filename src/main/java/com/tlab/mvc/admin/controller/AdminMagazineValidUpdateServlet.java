package com.tlab.mvc.admin.controller;

import java.io.IOException;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.tlab.mvc.magazine.model.exception.MagazineException;
import com.tlab.mvc.magazine.model.service.MagazineService;
import com.tlab.mvc.magazine.model.vo.Magazine;

/**
 * Servlet implementation class AdminMagazineValidUpdateServlet
 */
@WebServlet("/admin/magazineValidUpdate")
public class AdminMagazineValidUpdateServlet extends HttpServlet {
	private static final long serialVersionUID = 1L;
	private MagazineService magazineService = new MagazineService();

	/**
	 * @see HttpServlet#doGet(HttpServletRequest request, HttpServletResponse
	 *      response)
	 */
	protected void doGet(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {
	}

	/**
	 * @see HttpServlet#doPost(HttpServletRequest request, HttpServletResponse
	 *      response)
	 */
	protected void doPost(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {
		try {
			int no = Integer.parseInt(request.getParameter("magazine"));
			String writer = request.getParameter("writer");
			String valid = request.getParameter("valid");
			Magazine magazine = new Magazine();
			magazine.setNo(no);
			magazine.setWriter(writer);
			magazine.setValid(valid);

			int result = magazineService.updateMagazineValid(magazine);

			response.sendRedirect(request.getContextPath() + "/admin/magazineList");
		} catch (Exception e) {
			e.printStackTrace();
			throw e;
		}
	}

}

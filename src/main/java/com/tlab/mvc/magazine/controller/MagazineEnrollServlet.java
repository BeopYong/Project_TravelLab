package com.tlab.mvc.magazine.controller;

import java.io.IOException;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.tlab.mvc.magazine.model.service.MagazineService;
import com.tlab.mvc.magazine.model.vo.Magazine;

/**
 * Servlet implementation class MagazineEnrollServlet
 */
@WebServlet("/magazine/magazineEnroll")
public class MagazineEnrollServlet extends HttpServlet {
	private static final long serialVersionUID = 1L;
	private MagazineService magazineService = new MagazineService();
	
	//DML
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		try {
			//사용자입력값
			String title = request.getParameter("title");
			String writer = request.getParameter("writer");
			String content = request.getParameter("content");
			Magazine magazine = new Magazine(0, title, writer, content, null, 0, writer, content);
			System.out.println("[magazineServlet] magazine" + magazine);
			
			//업무로직
			int result = magazineService.insertMagazine(magazine);
			System.out.println("[MagazineEnrollServlet] result" + result);
			String msg = result > 0 ? "게시물 등록 성공" : "게시물 등록 실패";
			//redirect
			request.getSession().setAttribute(msg, "msg");
			String location = request.getContextPath() + "/magazine/magazineView?no=" + magazine.getNo();
			response.sendRedirect(location);
		} catch (IOException e) {
			e.printStackTrace();
			throw e;
		}
		
	}

}

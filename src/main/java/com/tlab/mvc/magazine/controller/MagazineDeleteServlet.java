package com.tlab.mvc.magazine.controller;

import java.io.File;
import java.io.IOException;
import java.util.List;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.tlab.mvc.common.Attachment;
import com.tlab.mvc.magazine.model.service.MagazineService;
import com.tlab.mvc.magazine.model.vo.Magazine;
import com.tlab.mvc.magazine.model.vo.MagazineAttachment;

/**
 * Servlet implementation class MagazineDeleteServlet
 */
@WebServlet("/magazine/magazineDelete")
public class MagazineDeleteServlet extends HttpServlet {
	private static final long serialVersionUID = 1L;
	private MagazineService magazineService = new MagazineService();

	/**
	 * @see HttpServlet#doPost(HttpServletRequest request, HttpServletResponse
	 *      response)
	 */
	protected void doGet(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {
		try {
			// 1.사용자입력처리
			int no = Integer.parseInt(request.getParameter("magazineNo"));

			// 2.업무로직
			// a. 업로드파일 삭제: java.io.File api 파일제거
//			List<MagazineAttachment> attachments = magazineService.selectAttachmentByMagazineNo(no);
//			if(attachments != null && !attachments.isEmpty()) {
//				String saveDirectory = getServletContext().getRealPath("/upload/magazine");
//				for(Attachment attach : attachments) {
//					String renamedFilename = attach.getRenamedFilename();
//					File delFile = new File(saveDirectory, renamedFilename);
//					boolean deleted = delFile.delete();
//					System.out.println("[MagazineDeleteServlet] 파일삭제 (" + renamedFilename + ") : " + deleted);
//				}
//			}

			// b. magazine 레코드(행) 삭제 (attachment는 on delete cascade에 의해 자동으로 제거된다.)
			Magazine magazine = magazineService.selectOneMagazine(no);
			System.out.println("magazinedeleteservlet /select no = " + no);

			int result = magazineService.deleteMagazine(no);
			System.out.println("magazinedeleteservlet /delete no = " + no);
			String msg = result > 0 ? "게시물 삭제 성공!" : "게시물 삭제 실패!";

			// 3. redirect : /mvc/magazine/magazineList로 이동
			request.getSession().setAttribute("msg", msg);
			response.sendRedirect(request.getContextPath() + "/magazine/magazineList");

		} catch (NumberFormatException e) {
			e.printStackTrace();
			throw e;
		} catch (IOException e) {
			e.printStackTrace();
			throw e;
		}
	}

}

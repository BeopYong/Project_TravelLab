package com.tlab.mvc.cs.controller;

import java.io.File;
import java.io.IOException;
import java.util.List;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.tlab.mvc.cs.model.service.CsService;
import com.tlab.mvc.cs.model.vo.CsAttachment;


/**
 * Servlet implementation class CsDeleteServlet
 */
@WebServlet("/cs/csDelete")
public class CsDeleteServlet extends HttpServlet {
	private static final long serialVersionUID = 1L;
	private CsService csService = new CsService();

	/**
	 * @see HttpServlet#doPost(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		
		try {
			// 1.사용자입력처리
			int no = Integer.parseInt(request.getParameter("no"));

			// 2.업무로직
			// 	a. 업로드파일 삭제: java.io.File api 파일제거
			List<CsAttachment> attachments = csService.selectAttachmentByCsNo(no);
			if(attachments != null && !attachments.isEmpty()) {
				String saveDirectory = getServletContext().getRealPath("/upload/cs");
				for(CsAttachment attach : attachments) {
					String renamedFilename = attach.getRenamedFilename();
					File delFile = new File(saveDirectory, renamedFilename);
					boolean deleted = delFile.delete();
					System.out.println("[CsDeleteServlet] 파일삭제 (" + renamedFilename + ") : " + deleted);
				}
			}
			
			// 	b. cs 레코드(행) 삭제 (attachment는 on delete cascade에 의해 자동으로 제거된다.)
			int result = csService.deleteCs(no);
			String msg = result > 0 ? "게시물이 삭제 되었습니다." : "게시물 삭제에 실패하였습니다.";

			// 3. redirect : /mvc/cs/csList로 이동
			request.getSession().setAttribute("msg", msg);
			response.sendRedirect(request.getContextPath() + "/cs/csList");

		} catch (Exception e) {
			e.printStackTrace();
			throw e;
		}
	
	
	}

}

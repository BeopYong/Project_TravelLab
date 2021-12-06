package com.tlab.mvc.magazine.controller;

import java.io.File;
import java.io.IOException;
import java.util.ArrayList;
import java.util.Enumeration;
import java.util.List;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.oreilly.servlet.MultipartRequest;
import com.oreilly.servlet.multipart.FileRenamePolicy;
import com.tlab.mvc.common.MvcUtils;
import com.tlab.mvc.common.MvcFileRenamePolicy;
import com.tlab.mvc.magazine.model.service.MagazineService;
import com.tlab.mvc.magazine.model.vo.Magazine;
import com.tlab.mvc.magazine.model.vo.MagazineAttachment;

/**
 * Servlet implementation class MagazineUpdateServlet
 */
@WebServlet("/magazine/magazineUpdate")
public class MagazineUpdateServlet extends HttpServlet {
	private static final long serialVersionUID = 1L;
	private MagazineService magazineService = new MagazineService();

	/**
	 * @see HttpServlet#doGet(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		//사용자입력값
		int no = Integer.parseInt(request.getParameter("no"));
		
		//업무로직
		Magazine magazine = magazineService.selectOneMagazine(no);
//		System.out.println("[magazineUpdateServlet] magazine = " + magazine);
		
		//view단
		request.setAttribute("magazine", magazine);
		request
			.getRequestDispatcher("/WEB-INF/views/magazine/magazineUpdate.jsp")
			.forward(request, response);
	}

	/**
	 * @see HttpServlet#doPost(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		try {
//		//A. server에 사용자 업로드파일 저장
//		String saveDirectory = getServletContext().getRealPath("/upload/magazine");
//		System.out.println("[magazineupdateServlet] asveDirectory = " + saveDirectory);
//		
//		int maxPostSize = 1024 * 1024 * 10; //10mb
//		String encoding = "uft-8";
//		
//		//파일명 재지정 정책객체
//		FileRenamePolicy policy = new MvcFileRenamePolicy();
//		
//		MultipartRequest multipartRequest = 
//				new MultipartRequest(request, saveDirectory, maxPostSize, encoding, policy);
		
		//B. 업로드한 파일정보 db에 저장 
		
		//사용자입력값
		int no = Integer.parseInt(request.getParameter("no"));
		String title = request.getParameter("title");
		String writer = request.getParameter("writer");
		String content = request.getParameter("content");
		String region = request.getParameter("region");
		
//		String[] delFiles = request.getParameterValues("delFile");
		
		Magazine magazine = new Magazine(no, title, writer, content, region);
		
//		//저장된 파일정보 -> Attach객체 생성 -> list<attach>객체에추가 -> magazine객체 추가
//		Enumeration fileNames = multipartRequest.getFileNames();
//		List<MagazineAttachment> attachments = new ArrayList<>();
//		while(fileNames.hasMoreElements()) {
//			String fileName = (String) fileNames.nextElement();
//			System.out.println("[magazineupdateservlet] fileName = " + fileName);
//			File upFile = multipartRequest.getFile(fileName);
//			if(upFile != null) {
//				MagazineAttachment attach = (MagazineAttachment) MvcUtils.makeAttachment(multipartRequest, fileName);
//				attach.setMagazineNo(no);
//				attachments.add(attach);
//			}
//		}
//		if(!attachments.isEmpty())
//			magazine.setAttachments(attachments);
//		System.out.println("[magazineupdateServlet] magazine = " + magazine);
//		
//		//업무로직
//		//a 기존첨부파일 삭제
//		if(delFiles != null) {
//			for(String temp : delFiles) {
//				int delFileNo = Integer.parseInt(temp);
//				MagazineAttachment attach = magazineService.selectOneAttachment(delFileNo);
//				
//				// 첨부파일 삭제 : {saveDirectory}/{renamedFilename}
//				String renamedFilename = attach.getRenamedFilename();
//				File delFile = new File(saveDirectory, renamedFilename);
//				boolean removed = delFile.delete();
//				
//				// db첨부파일 레코드삭제
//				int result = magazineService.deleteAttachment(delFileNo);
//				
//				System.out.println("[magazineUpdateServlet] " + renamedFilename + "삭제 : " + removed);
//				System.out.println("[magazineUpdateServlet] " + renamedFilename + "레코드 삭제" + removed);
//				
//			}
//		}
		
		//b db레코드 수정(update magazine + insert attachment)
		int result = magazineService.updateMagazine(magazine);
		System.out.println("[MagazineUpdateServlet] result = " + result);
		String msg = result > 0 ? "게시물 수정 성공!" : "게시물 수정 실패!";
		
		//DML redirect로 경로변경
		request.getSession().setAttribute("msg", msg);
		String location = request.getContextPath() + "/magazine/magazineView?no=" + magazine.getNo();
		response.sendRedirect(location);		
		}catch (NumberFormatException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
			throw e;
		} catch (Exception e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
			throw e;
		}
	}
}

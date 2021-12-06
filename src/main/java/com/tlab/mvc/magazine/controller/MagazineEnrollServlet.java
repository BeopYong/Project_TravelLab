package com.tlab.mvc.magazine.controller;

import java.io.File;
import java.io.IOException;
import java.util.ArrayList;
import java.util.List;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.oreilly.servlet.MultipartRequest;
import com.oreilly.servlet.multipart.FileRenamePolicy;
import com.tlab.mvc.common.MvcFileRenamePolicy;
import com.tlab.mvc.common.MvcUtils;
import com.tlab.mvc.common.Attachment;
import com.tlab.mvc.magazine.model.service.MagazineService;
import com.tlab.mvc.magazine.model.vo.MagazineAttachment;
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
			//1)서버에 사용자 업로드파일저장
//			String saveDirectory = getServletContext().getRealPath("/upload/magazine");
//			System.out.println("[MagazineEnrollServlet] saveDirectory 서버에 업로드파일 저장=" + saveDirectory);
//			
//			int maxPostSize = 1024 * 1024 * 10; // 10mb
//			String encoding = "utf-8";
//			
//			//파일명 재지정 정책 객체
//			FileRenamePolicy policy = new MvcFileRenamePolicy();
//			
//			MultipartRequest multipartRequest = 
//					new MultipartRequest(request, saveDirectory, maxPostSize, encoding, policy);
			
			//2)업로드파일 저장 :attachment에 파일하나당 1행저장
			
			//사용자입력값
			String title = request.getParameter("title");
			String writer = request.getParameter("writer");
			String content = request.getParameter("content");
			String region = request.getParameter("region");
			System.out.println("title, writer, content , region" + title+", "+writer+", "+content+","+region);
			Magazine magazine = new Magazine(title, writer, content, region);
			System.out.println("[magazineServlet] magazine 사용자입력값 = " + magazine);
			
//			//저장된 파일정보를 꺼내 어태치에 만들고 list어태치에 전달 후 매거진 객체에 추가
//			File upFile1 = multipartRequest.getFile("upFile1");
//			File upFile2 = multipartRequest.getFile("upFile2");
//			
//			if(upFile1 != null || upFile2 != null) {
//				List<MagazineAttachment> attachments = new ArrayList<>();
//				
//				//magazineNo 필드
//				if(upFile1 != null) {
//					MagazineAttachment attach1 = (MagazineAttachment) MvcUtils.makeAttachment(multipartRequest, "upFile1");
//					 attachments.add(attach1);
//				}
//				if(upFile1 != null) {
//					MagazineAttachment attach2 = (MagazineAttachment) MvcUtils.makeAttachment(multipartRequest, "upFile2");
//					attachments.add(attach2);
//				}	
//				magazine.setAttachments(attachments);
//				System.out.println("[MagazineenrollServlet] attachments = " + attachments);
//			}
//			System.out.println("[MagazineenrollServlet] magazine = " + magazine);
						
			
			//업무로직
			int result = magazineService.insertMagazine(magazine);
			System.out.println("[MagazineEnrollServlet] 업무로직 result" + result);
			String msg = result > 0 ? "게시물 등록 성공" : "게시물 등록 실패";
			
			//redirect
			request.getSession().setAttribute("msg", msg);
			String location = request.getContextPath() + "/magazine/magazineView?no=" + magazine.getNo();
			response.sendRedirect(location);
		} catch (Exception e) {
			e.printStackTrace();
			throw e;
		}
		
	}

}

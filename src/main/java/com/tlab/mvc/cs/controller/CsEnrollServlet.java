package com.tlab.mvc.cs.controller;

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
import com.tlab.mvc.cs.model.service.CsService;
import com.tlab.mvc.cs.model.vo.Cs;
import com.tlab.mvc.cs.model.vo.CsAttachment;

/**
 * Servlet implementation class CsEnrollServlet
 */
@WebServlet("/cs/csEnroll")
public class CsEnrollServlet extends HttpServlet {
	private static final long serialVersionUID = 1L;
	private CsService csService = new CsService();

	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		try {
			
			String saveDirectory = getServletContext().getRealPath("/upload/cs");
			System.out.println("[CsEnrollServlet] saveDirectory = " + saveDirectory);
			
			int maxPostSize = 1024 * 1024 * 10; // 10MB 
			String encoding = "utf-8";
			
			FileRenamePolicy policy = new MvcFileRenamePolicy();
			
			MultipartRequest multipartRequest = 
					new MultipartRequest(request, saveDirectory, maxPostSize, encoding, policy);
			
			
			String options = multipartRequest.getParameter("qna");
			String title = multipartRequest.getParameter("csTitle");
			String content = multipartRequest.getParameter("csContent");
			String memberId= multipartRequest.getParameter("memberId");
			System.out.println("options, title, content, memberId"+options+","+title+","+content+","+memberId);
			Cs cs = new Cs(0, options, title, memberId, content, null);
			System.out.println(cs);
			
//			String options = request.getParameter("qna");
//			String title = request.getParameter("csTitle");
//			String content = request.getParameter("csContent");
//			String memberId= request.getParameter("memberId");
//			System.out.println("options, title, content, memberId"+options+","+title+","+content+","+memberId);
//			Cs cs = new Cs(0, options, title, memberId, content, null);
//			System.out.println(cs);
			
			
			File upFile1 = multipartRequest.getFile("upFile1");
			File upFile2 = multipartRequest.getFile("upFile2");
			
			
			if(upFile1 != null || upFile2 != null) {
				List<CsAttachment> attachments = new ArrayList<>();
				// 현재 fk인 boardNo필드값은 비어있다.
				if(upFile1 != null) {
					CsAttachment attach1 = (CsAttachment)MvcUtils.makeAttachment(multipartRequest, "upFile1");
					attachments.add(attach1);
				}
				if(upFile2 != null) {
					CsAttachment attach2 = (CsAttachment)MvcUtils.makeAttachment(multipartRequest, "upFile2");
					attachments.add(attach2);
				}
				cs.setAttachments(attachments);
				System.out.println("[CsEnrollServlet] attachments = " + attachments);
			}
			
			System.out.println("[CsEnrollServlet] cs = " + cs);
			
			int result = csService.insertCs(cs);
			System.out.println("[CsEnrollServlet] result = " + result);
			String msg = result > 0 ? "게시물 등록 성공!" : "게시물 등록 실패!";
			
			request.getSession().setAttribute("msg", msg);
			String location = request.getContextPath() + "/cs/csList";
			
//			String location = request.getContextPath() + "/cs/csView?no=" + cs.getNo();
			
			response.sendRedirect(location);
		} catch(Exception e) {
			e.printStackTrace();
			throw e;
		}
	}

}

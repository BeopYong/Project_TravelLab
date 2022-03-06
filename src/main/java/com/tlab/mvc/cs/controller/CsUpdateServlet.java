package com.tlab.mvc.cs.controller;

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
import com.tlab.mvc.common.Attachment;
import com.tlab.mvc.common.MvcFileRenamePolicy;
import com.tlab.mvc.common.MvcUtils;
import com.tlab.mvc.cs.model.service.CsService;
import com.tlab.mvc.cs.model.vo.Cs;
import com.tlab.mvc.cs.model.vo.CsAttachment;

/**
 * Servlet implementation class CsUpdateServlet
 */
@WebServlet("/cs/csUpdate")
public class CsUpdateServlet extends HttpServlet {
	private static final long serialVersionUID = 1L;
	private CsService csService = new CsService();

	/**
	 * @see HttpServlet#doGet(HttpServletRequest request, HttpServletResponse
	 *      response)
	 */
	protected void doGet(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {
		// 1.사용자입력값
		int no = Integer.parseInt(request.getParameter("no"));
		// 2.업무로직
		Cs cs = csService.selectOneCs(no);
		System.out.println("[csUpdateServlet] cs = " + cs);

		// 3.view단처리
		request.setAttribute("cs", cs);
		request.getRequestDispatcher("/WEB-INF/views/cs/csUpdate.jsp").forward(request, response);
	}

	/**
	 * @see HttpServlet#doPost(HttpServletRequest request, HttpServletResponse
	 *      response)
	 */
	protected void doPost(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {
		try {

			// A. server computer에 사용자 업로드파일 저장
//			String saveDirectory = getServletContext().getRealPath("/upload/cs");
//			System.out.println("[CsUpdateServlet] saveDirectory = " + saveDirectory);
//			
//			int maxPostSize = 1024 * 1024 * 10; // 10MB 
//			String encoding = "utf-8";
//			
//			// 파일명 재지정 정책 객체 
//			// DefaultFileRenamePolicy 동일한 이름의 파일은 numbering을 통해 overwrite을 방지
//			FileRenamePolicy policy = new MvcFileRenamePolicy();
//			
//			MultipartRequest multipartRequest = 
//					new MultipartRequest(request, saveDirectory, maxPostSize, encoding, policy);

			// B. 업로드한 파일 정보를 db에 저장 : attachment테이블 파일하나당 1행 저장

			// 1.사용자입력값 -> Cs객체
			// MultipartRequest객체 생성하는 경우, 기존 request가 아닌 MultipartRequest객체에서 값을 가져와야 한다.
			String options = request.getParameter("qna");
			String title = request.getParameter("csTitle");
			String content = request.getParameter("csContent");
			String memberId = request.getParameter("memberId");
			System.out.println(
					"options, title, content, memberId" + options + "," + title + "," + content + "," + memberId);

			String[] delFiles = request.getParameterValues("delFile");
			Cs cs = new Cs(0, options, title, memberId, content, null);
			System.out.println(cs);

//			// 저장된 파일정보 -> Attachment객체 생성 -> List<Attachment>객체에 추가 -> Cs객체에 추가
//			Enumeration fileNames = multipartRequest.getFileNames();
//			List<CsAttachment> attachments = new ArrayList<>();
//			while(fileNames.hasMoreElements()) {
//				String fileName = (String) fileNames.nextElement();
//				System.out.println("[CsUpdateServlet] fileName = " + fileName);
//				File upFile = multipartRequest.getFile(fileName);
//				if(upFile != null) {
//					CsAttachment attach = (CsAttachment) MvcUtils.makeAttachment(multipartRequest, "upFile1");
//					attach.setCsBoardno(maxPostSize);;
//					attachments.add(attach);
//				}
//			}
//			if(!attachments.isEmpty())
//				cs.setAttachments(attachments);

//			File upFile1 = multipartRequest.getFile("upFile1");
//			File upFile2 = multipartRequest.getFile("upFile2");
//			
//			if(upFile1 != null || upFile2 != null) {
//				List<Attachment> attachments = new ArrayList<>();
//				// 현재 fk인 csNo필드값은 비어있다.
//				if(upFile1 != null) {
//					Attachment attach1 = MvcUtils.makeAttachment(multipartRequest, "upFile1");
//					attach1.setCsNo(no);
//					attachments.add(attach1);
//				}
//				if(upFile2 != null) {
//					Attachment attach2 = MvcUtils.makeAttachment(multipartRequest, "upFile2");
//					attach2.setCsNo(no);
//					attachments.add(attach2);
//				}
//				cs.setAttachments(attachments);
//				System.out.println("[CsUpdateServlet] attachments = " + attachments);
//			}

//			System.out.println("[CsUpdateServlet] cs = " + cs);
//			
//			// 2.업무로직
//			// a. 기존첨부파일 삭제
//			if(delFiles != null) {
//				for(String temp : delFiles) {
//					int delFileNo = Integer.parseInt(temp);
//					Attachment attach = csService.selectOneAttachment(delFileNo);
//
//					//가. 첨부파일 삭제 : {saveDirectory}/{renamedFilename}
//					String renamedFilename = attach.getRenamedFilename();
//					File delFile = new File(saveDirectory, renamedFilename);
//					boolean removed = delFile.delete();
//					
//					//나. DB 첨부파일 레코드 삭제
//					int result = csService.deleteAttachment(delFileNo);
//					
//					System.out.println("[CsUpdateServlet] " + renamedFilename + " 삭제 : " + removed);
//					System.out.println("[CsUpdateServlet] " + renamedFilename + " 레코드 삭제 : " + removed);
//					
//				}
//			}

			// b. db 레코드 수정(update cs + insert attachment)
			int result = csService.updateCs(cs);
			System.out.println("[CsUpdateServlet] result = " + result);
			String msg = result > 0 ? "게시물 수정 성공!" : "게시물 수정 실패 ㅠㅠ";

			// 3.redirect: DML은 redirect해서 url을 변경한다.
			// location: /mvc/cs/csList
			request.getSession().setAttribute("msg", msg);
			String location = request.getContextPath() + "/cs/csView?no=" + cs.getNo();
			response.sendRedirect(location);
		} catch (Exception e) {
			e.printStackTrace();
			throw e;
		}
	}

}

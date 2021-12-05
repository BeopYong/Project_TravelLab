package com.tlab.mvc.member.controller;

import java.io.File;
import java.io.IOException;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import org.apache.log4j.Logger;

import com.oreilly.servlet.MultipartRequest;
import com.oreilly.servlet.multipart.DefaultFileRenamePolicy;
import com.oreilly.servlet.multipart.FileRenamePolicy;
import com.tlab.mvc.common.Attachment;
import com.tlab.mvc.common.MvcUtils;
import com.tlab.mvc.member.model.service.MemberService;
import com.tlab.mvc.member.model.vo.Member;
import com.tlab.mvc.member.model.vo.MemberAttached;
import com.tlab.mvc.member.model.vo.MemberAttachment;

/**
 * 프로필 등록을 위한 서블릿 정보수정 페이지와 분리함.
 */
@WebServlet("/member/profileEnroll")
public class MemberProfileEnrollServlet extends HttpServlet {
	private static final long serialVersionUID = 1L;
	private MemberService memberService = new MemberService();
	private Logger logger = Logger.getRootLogger();
	/**
	 * @see HttpServlet#doPost(HttpServletRequest request, HttpServletResponse
	 *      response)
	 */
	protected void doPost(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {
		
		try {
			String saveDirectory = getServletContext().getRealPath("/upload/profile");
			System.out.println("[member@directory] = " + saveDirectory);

			int maxPostSize = 1024 * 1024 * 10; // 10mb
			String encoding = "utf-8";

			FileRenamePolicy policy = new DefaultFileRenamePolicy();

			MultipartRequest multipartRequest = new MultipartRequest(request, saveDirectory, maxPostSize, encoding,
					policy);

			// member객체 -> memberAttached (deprecated) 여러가지 기능이 하나의 서블릿에 모이는것은 잘못.
			//	Member member = memberService.selectOneMember(memberId);
			//	MemberAttached memberAttached = new MemberAttached();
			//	memberAttached.returnInstance(member);
			
			String memberId = multipartRequest.getParameter("memberId");
			
			// file 만들기 (jsp의 uploadFile받아오기)
			File uploadFile = multipartRequest.getFile("uploadFile");
			System.out.println(uploadFile.getName() + "@profileEnrollServlet");

			// memberAttachement객체로만 보내도됨 
			MemberAttachment mAttach = new MemberAttachment();
			
			// Attachement객체 만들기
			if (uploadFile != null) {
				//List<MemberAttachment> memberAttachments = new ArrayList<>();

				Attachment attach = MvcUtils.makeAttachment(multipartRequest, "uploadFile");

				// MemberAttachment 객체값 생성
				mAttach.setNo(attach.getNo());
				mAttach.setOriginalFilename(attach.getOriginalFilename());
				mAttach.setRenamedFilename(attach.getRenamedFilename());
				mAttach.setMemberId(memberId);
				//memberAttachments.add(mAttach);
				//memberAttached.setMemberAttachments(memberAttachments);
				//System.out.println("[BoardEnrollServlet] memberAttachments = " + memberAttachments);
				//System.out.println("memberAttached = " + memberAttached);
			}
			
			// Attachement DB에 넣기
			int result = memberService.insertMemberAttachment(mAttach);
			System.out.println("[memberEnrollResult] = " + result);
			
			//응답처리
			String msg = result > 0 ? "프로필 등록 성공" : "프로필 등록 실패";
			request.getSession().setAttribute("msg", msg);
			String location = request.getContextPath() + "/";
			if (result <= 0) {
				request.getRequestDispatcher("/WEB-INF/views/member/myInfo.jsp").forward(request, response);
			} else {
				response.sendRedirect(location);
			}
		} catch (Exception e) {
			logger.debug(e.getMessage()+e.getCause());
			e.printStackTrace();
			throw e;
		}

	}

}

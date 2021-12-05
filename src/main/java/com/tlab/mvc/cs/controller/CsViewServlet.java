package com.tlab.mvc.cs.controller;

import java.io.IOException;
import java.util.List;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.tlab.mvc.cs.model.exception.CsException;
import com.tlab.mvc.cs.model.service.CsService;
import com.tlab.mvc.cs.model.vo.Cs;
import com.tlab.mvc.cs.model.vo.CsComment;


/**
 * Servlet implementation class CsViewServlet
 */
@WebServlet("/cs/csView")
public class CsViewServlet extends HttpServlet {
	private static final long serialVersionUID = 1L;
	private CsService csService = new CsService();

	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		
		try {
			//1.파라미터핸들링
			int no  = Integer.parseInt(request.getParameter("no"));
			
			//2.업무로직
			// cs, List<Attachment>를 나누어 조회
			Cs cs = csService.selectOneCs(no);
//			Cs cs = csService.selectOneCsAttachments(no);
			System.out.println("[CsViewServlet] cs = " + cs);
			//게시글 가져오기에 실패한경우
			if(cs == null) {
				throw new CsException("해당 게시글이 존재하지 않습니다.");
			}

			// XSS공격대비 <> 변환처리
			String content = cs.getContent().replaceAll("<", "&lt;").replaceAll(">", "&gt;");
						
			// 개행문자처리
			content = content.replaceAll("\n", "<br/>");
			cs.setContent(content);
			
			// 댓글 목록 조회
			List<CsComment> commentList = csService.selectCsCommentList(no);
			System.out.println("[BoardViewServlet] commentList = " + commentList);
			
			//3. jsp forwarding
			request.setAttribute("commentList", commentList);
			request.setAttribute("cs", cs);
			request.getRequestDispatcher("/WEB-INF/views/cs/csView.jsp")
				   .forward(request, response);
		} catch(NumberFormatException e) {
			throw new CsException("유효한 게시글 번호가 아닙니다.", e);
		} catch(Exception e) {
			e.printStackTrace();
			throw e;
		}
	}
}

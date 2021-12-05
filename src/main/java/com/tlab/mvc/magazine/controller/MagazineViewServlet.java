package com.tlab.mvc.magazine.controller;

import java.io.IOException;
import java.util.List;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.Cookie;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.tlab.mvc.magazine.model.exception.MagazineException;
import com.tlab.mvc.magazine.model.service.MagazineService;
import com.tlab.mvc.magazine.model.vo.Magazine;
import com.tlab.mvc.magazine.model.vo.MagazineComment;

/**
 * Servlet implementation class MagazineViewServlet
 */
@WebServlet("/magazine/magazineView")
public class MagazineViewServlet extends HttpServlet {
	private static final long serialVersionUID = 1L;
	private MagazineService magazineService = new MagazineService();
	
	/**
	 * @see HttpServlet#doGet(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		
		try {
			//magazineNo를 불러옴
			int no = Integer.parseInt(request.getParameter("no"));
			System.out.println("magazineviewservlet magazineNo불러오기" + no);
			//업무로직
			//조회수
			//검사
			Cookie[] cookies = request.getCookies();
			boolean hasRead = false;
			String magazineCookieVal = "";
			if(cookies != null) {
				for(Cookie cookie : cookies) {
					String name = cookie.getName();
					String value = cookie.getValue();
					if("magazineCookie".equals(name)) {
						magazineCookieVal = value; // 기존쿠키값
						if(value.contains("[" + no + "]")) {
							hasRead = true;
							break;
						}
					}
				}
			}
			//조회수증가
			if(!hasRead) {
				int result = magazineService.updateReadCount(no);
				
				Cookie cookie = new Cookie("magazineCookie", magazineCookieVal + "[" + no + "]");
				cookie.setPath(request.getContextPath() + "/magazine/magazineView");
				cookie.setMaxAge(365 * 24 * 60 * 60); // 365일짜리 영속쿠키
				response.addCookie(cookie);
				
				System.out.println("[magazineViewServlet] 조회수 증가 및 magazineCookie 생성");
				
			}
			
			
			//게시물조회
			Magazine magazine = magazineService.selectOneMagazineAttachments(no);
			System.out.println("[mamgazineService/selectonemagaattch] magazine = " + magazine);
			
			//게시물 가져오기 실패경우
			if (magazine == null) {
				throw new MagazineException("해당 게시글이 존재하지 않습니다.");
			}
			
			// XSS공격대비 <> 변환처리
			String content = magazine.getContent().replaceAll("<", "&lt;").replaceAll(">", "&gt;");
						
			// 개행문자처리
			content = content.replaceAll("\n", "<br/>");
			magazine.setContent(content);
			
			//댓글 목록조회
//			List<MagazineComment> commentList = magazineService.selectMagazineCommentList(no);
//			System.out.println("[MagazineViewServlet] commentList = " + commentList);
						
			//jsp forward
			request.setAttribute("magazine", magazine);
			request.getRequestDispatcher("/WEB-INF/views/magazine/magazineView.jsp")
					.forward(request, response);
		} catch (NumberFormatException e) {
			throw new MagazineException("유효한 게시글 번호가 아닙니다.", e);
		} catch (Exception e) {
			e.printStackTrace();
			throw e;
		} 
		
	}

}

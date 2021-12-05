package com.tlab.mvc.cs.controller;

import java.io.IOException;
import java.util.HashMap;
import java.util.List;
import java.util.Map;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.tlab.mvc.cs.model.vo.*;
import com.tlab.mvc.member.model.vo.Member;
import com.tlab.mvc.cs.model.vo.*;
import com.tlab.mvc.common.MvcUtils;
import com.tlab.mvc.cs.model.service.CsService;

/**
 * Servlet implementation class BoardListServlet
 */
@WebServlet("/cs/csList")
public class CsListServlet extends HttpServlet {
	private static final long serialVersionUID = 1L;
	private CsService csService = new CsService();

	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		try {
			final int numPerPage = 5;
			int cPage = 1;
			try {
				cPage = Integer.parseInt(request.getParameter("cPage"));
			} catch (NumberFormatException e) {}
			int start = (cPage - 1) * numPerPage + 1; 
			int end = cPage * numPerPage;
			Map<String, Integer> param = new HashMap<>();
			param.put("start", start);
			param.put("end", end);
			System.out.println(start+", "+end);
			
			List<Cs> list = csService.selectAllCs(param);
			System.out.println("list@servlet = " + list);
			
			int totalContent = csService.selectTotalCsCount();
			String url = request.getRequestURI(); 
			String pagebar = MvcUtils.getPagebar(cPage, numPerPage, totalContent, url);
			System.out.println("pagebar@servlet = " + pagebar);
			
			
			request.setAttribute("list", list);
			request.setAttribute("pagebar", pagebar);
			request
				.getRequestDispatcher("/WEB-INF/views/cs/csList.jsp")
				.forward(request, response);

		} catch (Exception e) {
			e.printStackTrace(); 
			throw e; 
		}
	
	}

}

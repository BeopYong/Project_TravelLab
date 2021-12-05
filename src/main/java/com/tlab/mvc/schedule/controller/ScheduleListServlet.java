package com.tlab.mvc.schedule.controller;

import java.io.IOException;
import java.util.List;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.tlab.mvc.schedule.model.service.ScheduleService;
import com.tlab.mvc.schedule.model.vo.Schedule;

/**
 * Servlet implementation class MemberMyJourneyListServlet
 */
@WebServlet("/schedule/myScheduleList")
public class ScheduleListServlet extends HttpServlet {
	private static final long serialVersionUID = 1L;
	private ScheduleService scheduleService = new ScheduleService();
	/**
	 * @see HttpServlet#doGet(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		 
		//without page bar , just show them as an cardboard
		String memberId =request.getParameter("memberId");
		try {
			 List<Schedule> list= scheduleService.selectAllSchedule(memberId);
			 System.out.println("list@ScheduleListServlet = "+ list);
			 request.setAttribute("list", list);
			 request
			 	.getRequestDispatcher("/WEB-INF/views/schedule/scheduleList.jsp")
			 	.forward(request, response);
		 } catch(Exception e){
			 e.printStackTrace();
			 throw e;
		 }
	}
		
}

package com.tlab.mvc.member.controller;

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
 * Servlet implementation class MemberScheduleServlet
 */
@WebServlet("/member/mySchedule")
public class MemberScheduleServlet extends HttpServlet {
	private static final long serialVersionUID = 1L;
	private ScheduleService scheduleService = new ScheduleService();

	protected void doGet(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {

		try {
			String memberId = request.getParameter("memberId");
			List<Schedule> scheduleList = scheduleService.selectAllSchedule(memberId);
			System.out.println("list@MyScheduleServlet = " + scheduleList);
			request.setAttribute("list", scheduleList);

			request.getRequestDispatcher("/WEB-INF/views/member/myScheduleAjax.jsp").forward(request, response);
		} catch (Exception e) {
			e.printStackTrace();
			throw e;
		}

	}

}

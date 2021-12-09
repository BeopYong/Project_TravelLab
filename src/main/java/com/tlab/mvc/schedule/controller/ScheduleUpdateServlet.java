package com.tlab.mvc.schedule.controller;

import java.io.IOException;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.tlab.mvc.schedule.model.service.ScheduleService;

/**
 * Servlet implementation class MemberMyJourneyUpdateServlet
 */
@WebServlet("/schedule/myScheduleUpdate")
public class ScheduleUpdateServlet extends HttpServlet {
	private static final long serialVersionUID = 1L;
	private ScheduleService scheduleService = new ScheduleService();

	/**
	 * @see HttpServlet#doPost(HttpServletRequest request, HttpServletResponse
	 *      response)
	 */
	protected void doPost(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {

	}

}

package com.tlab.mvc.schedule.controller;

import java.io.IOException;
import java.util.ArrayList;
import java.util.List;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

//import org.apache.log4j.Logger;

import com.google.gson.Gson;
import com.tlab.mvc.schedule.model.service.ScheduleService;
import com.tlab.mvc.schedule.model.vo.Schedule;

/**
 * Servlet implementation class MemberMyJourneyEnrollServlet
 */
@WebServlet("/schedule/myScheduleEnroll")
public class ScheduleEnrollServlet extends HttpServlet {
	private static final long serialVersionUID = 1L;
	private ScheduleService scheduleService = new ScheduleService();
//	private Logger logger = Logger.getRootLogger();

	/**
	 * @see HttpServlet#doPost(HttpServletRequest request, HttpServletResponse
	 *      response)
	 */
	protected void doGet(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {

		// 스케줄 등록 페이지
		request.getRequestDispatcher("/WEB-INF/views/member/memberEnrollTest.jsp").forward(request, response);
	}

	protected void doPost(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {

		List<Schedule> list = new ArrayList<>();
		Gson gson = new Gson();
	}

}

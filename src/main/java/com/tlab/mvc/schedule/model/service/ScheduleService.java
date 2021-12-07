package com.tlab.mvc.schedule.model.service;

import static com.tlab.mvc.common.JdbcTemplate.*;

import com.tlab.mvc.schedule.model.dao.ScheduleDao;
import com.tlab.mvc.schedule.model.vo.Schedule;

import java.sql.Connection;
import java.util.List;

public class ScheduleService {

	private ScheduleDao scheduleDao = new ScheduleDao();

	public List<Schedule> selectAllSchedule(String memberId) {
		Connection conn = getConnection();
		List<Schedule> list = scheduleDao.selectAllSchedule(conn, memberId);
		close(conn);
		return list;
	}

	public int updateSchedule(List<Schedule> sch) {
		Connection conn = getConnection();
		int result = 0;
		result = scheduleDao.updateSchedule(conn, sch);
		close(conn);
		return result;
	}
}

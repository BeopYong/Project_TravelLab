package com.tlab.mvc.schedule.model.dao;

import static com.tlab.mvc.common.JdbcTemplate.close;

import java.io.FileReader;
import java.io.IOException;
import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.ArrayList;
import java.util.List;
import java.util.Map;
import java.util.Properties;

import org.apache.log4j.Logger;

import com.tlab.mvc.schedule.model.exception.ScheduleException;
import com.tlab.mvc.schedule.model.vo.Schedule;

public class ScheduleDao {


	private Properties prop = new Properties();
	private Logger logger = Logger.getRootLogger();
	
	public ScheduleDao() {
		String filepath = ScheduleDao.class.getResource("/schedule-query.properties").getPath();
		System.out.println(filepath);
		try {
			prop.load(new FileReader(filepath));
		} catch (IOException e) {
			e.printStackTrace();
			logger.debug(e.getMessage());
		}
	}
	
	public List<Schedule> selectAllSchedule(Connection conn, String memberId) {
		
		PreparedStatement pstmt =  null;
		String sql = prop.getProperty("selectAllSchedule");
		ResultSet rset = null;
		List<Schedule> list = new ArrayList<>();
		
		try {
			pstmt = conn.prepareStatement(sql);
			pstmt.setString(1,memberId);
			rset = pstmt.executeQuery();
			
			while (rset.next()) {
				Schedule sch = new Schedule();
				sch.setNo(rset.getInt("no"));
				sch.setOrderNum(rset.getInt("order_num"));
				sch.setItem(rset.getString("item"));
				sch.setMemberId(rset.getString("member_id"));
				sch.setRegDate(rset.getDate("reg_date"));
			}
		} catch(SQLException e) {
			e.printStackTrace();
			throw new ScheduleException("조회오류.",e);
		} finally {
			close(rset);
			close(pstmt);
		}
		return list;
	}

}

package com.tlab.mvc.magazine.model.service;

import static com.tlab.mvc.common.JdbcTemplate.*;

import java.sql.Connection;
import java.util.List;
import java.util.Map;

import com.tlab.mvc.magazine.model.dao.MagazineDao;
import com.tlab.mvc.magazine.model.vo.Magazine;

public class MagazineService {

	private MagazineDao magazineDao = new MagazineDao();
	
	//페이징처리a
	public List<Magazine> selectAllMagazine(Map<String, Integer> param) {
		Connection conn = getConnection();
		List<Magazine> list = magazineDao.selectAllMagazine(conn, param);
		close(conn);
		
		return list;
	}
	//페이징처리b
	public int selectTotalMagazineCount() {
		Connection conn = getConnection();
		int totalCount = magazineDao.selectTotalMagazineCount(conn);
		close(conn);
		return totalCount;
	}

}

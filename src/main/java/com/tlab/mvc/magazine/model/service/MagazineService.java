package com.tlab.mvc.magazine.model.service;

import static com.tlab.mvc.common.JdbcTemplate.*;

import java.sql.Connection;
import java.util.ArrayList;
import java.util.List;
import java.util.Map;

import com.tlab.mvc.magazine.model.dao.MagazineDao;
import com.tlab.mvc.magazine.model.vo.Magazine;

public class MagazineService {

	private MagazineDao magazineDao = new MagazineDao();

	// 페이징처리a
	public List<Magazine> selectAllMagazine(Map<String, Integer> param) {
		Connection conn = getConnection();
		List<Magazine> list = magazineDao.selectAllMagazine(conn, param);
		close(conn);

		return list;
	}

	// 페이징처리b
	public int selectTotalMagazineCount() {
		Connection conn = getConnection();
		int totalCount = magazineDao.selectTotalMagazineCount(conn);
		close(conn);
		return totalCount;
	}

	// DML
	public int insertMagazine(Magazine magazine) {
		Connection conn = getConnection();
		int result = 0;

		try {
			conn = getConnection();
			result = magazineDao.insertMagazine(conn, magazine);
			commit(conn);
		} catch (Exception e) {
			rollback(conn);
			throw e;
		} finally {
			close(conn);
		}
		return result;
	}

	
	//관리자용 메뉴
	public int updateMagazineValid(Magazine magazine) {
		int result = 0;
		Connection conn= null;
		try {
			conn = getConnection();
			result = magazineDao.updateMagazineValid(conn, magazine);
		} catch (Exception e) {
			e.printStackTrace();
		} finally {
			close(conn);
		}
		return result;
	}

	public List<Magazine> selectAllMyScrap(Map<String, Integer> param, String writer) {
		List<Magazine> list = new ArrayList<>();
		Connection conn=null;
		try {
			conn= getConnection();
			list = magazineDao.selectAllMyScrap(conn,param,writer);
		} catch (Exception e) {
			e.printStackTrace();
		} finally {
			close(conn);
		}
		return list;
	}
	
	
	public int selectTotalMyScrapCount(String writer) {
		int result=0;
		Connection conn = null;
		try {
			conn = getConnection();
			result =magazineDao.selectTotalMyScrapCount(conn,writer);
		} catch (Exception e) {
			e.printStackTrace();
		} finally {
			close(conn);
		}
		return result;
	}

	public List<Magazine> searchMyScrap(Map<String, Object> searchParam) {
		List<Magazine> list = new ArrayList<>();
		Connection conn= null;
		
		try {
			conn = getConnection();
			list = magazineDao.searchMyScrap(conn,searchParam);
		} catch (Exception e) {
			e.printStackTrace();
		} finally {
			close(conn);
		}
		return list;
	}

}

package com.tlab.mvc.magazine.model.dao;

import static com.tlab.mvc.common.JdbcTemplate.*;

import java.io.File;
import java.io.FileNotFoundException;
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

import com.tlab.mvc.magazine.model.exception.MagazineException;
import com.tlab.mvc.magazine.model.vo.Magazine;

public class MagazineDao {

	private Properties prop = new Properties();
	private Logger logger = Logger.getRootLogger();
	//properties 접근 method
	public MagazineDao() {
		File file = new File(MagazineDao.class.getResource("/magazine-query.properties").getPath());
		System.out.println(file + "@MagazineDao");
		try {
			prop.load(new FileReader(file));
		} catch (FileNotFoundException e) {
			e.printStackTrace();
			logger.fatal(e.getMessage());
		} catch (IOException e) {
			e.printStackTrace();
			logger.debug(e.getMessage());
		} 
	}
	
	//페이징a
	public List<Magazine> selectAllMagazine(Connection conn, Map<String, Integer> param) {
		PreparedStatement pstmt = null;
		String sql = prop.getProperty("selectAllMagazine");
		ResultSet rset = null;
		List<Magazine> list = new ArrayList<>();
		
		try {
			pstmt = conn.prepareStatement(sql);
			pstmt.setInt(1, param.get("start"));
			pstmt.setInt(1, param.get("end"));
			
			rset = pstmt.executeQuery();
			
			while(rset.next()) {
				Magazine magazine = new Magazine();
				magazine.setNo(rset.getInt("nooooo"));
				magazine.setTitle(rset.getString("title"));
				magazine.setWriter(rset.getString("writer"));
				magazine.setContent(rset.getString("content"));
				magazine.setReadCount(rset.getInt("read_count"));
				magazine.setRegDate(rset.getDate("reg_date"));
			
//				magazine.setCommentCount(rset.getInt("comment_count")); //댓글
				magazine.setAttachCount(rset.getInt("attach_count"));
			}
		} catch (SQLException e) {
			e.printStackTrace();
		}
		return list;
	}

	//페이징처리b
	public int selectTotalMagazineCount(Connection conn) {
		PreparedStatement pstmt = null;
		String sql = prop.getProperty("selectTotalMagazineCount");
		ResultSet rset = null;
		int totalCount = 0;
		
		try {
			pstmt = conn.prepareStatement(sql);
			
			rset = pstmt.executeQuery();
			if(rset.next()) {
				totalCount = rset.getInt(1);
			}
		} catch (SQLException e) {
			e.printStackTrace();
		}finally {
			close(rset);
			close(pstmt);
		}
		return totalCount;
	}

	//DML
	public int insertMagazine(Connection conn, Magazine magazine) {
		PreparedStatement pstmt = null;
		String sql = prop.getProperty("insertMagazine");
		int result = 0;
		
		try {
			pstmt = conn.prepareStatement(sql);
			pstmt.setString(1, magazine.getTitle());
			pstmt.setString(2, magazine.getWriter());
			pstmt.setString(3, magazine.getContent());
			
			result = pstmt.executeUpdate();
		} catch (SQLException e) {
			throw new MagazineException("게시물 등록 오류", e);
		
		}finally {
			close(pstmt);
		}
		
		return result;
	}

	//관리자용
	public int updateMagazineValid(Connection conn, Magazine magazine) {
		int result = 0;
		PreparedStatement pstmt = null;
		String sql = prop.getProperty("updateMagazineValid");

		try {
			pstmt = conn.prepareStatement(sql);
			pstmt.setString(1, magazine.getValid());
			pstmt.setInt(2, magazine.getNo());
			result = pstmt.executeUpdate();
		} catch (SQLException e) {
			logger.debug(e.getMessage());
			throw new MagazineException("매거진 유효성 변경오류!", e);
		} finally {
			close(pstmt);
		}
		return result;
	}

	public int selectTotalMyScrapCount(Connection conn, String writer) {
		PreparedStatement pstmt = null;
		String sql = prop.getProperty("selectTotalMyScrapCount");
		ResultSet rset = null;
		int totalCount = 0;
		try {
			pstmt = conn.prepareStatement(sql);
			pstmt.setString(1, writer);
			rset = pstmt.executeQuery();
			if (rset.next())
				totalCount = rset.getInt(1);
		} catch (SQLException e) {
			logger.debug(e.getMessage());
			e.printStackTrace();
		} finally {
			close(rset);
			close(pstmt);
		}
		return totalCount;
	}

	public List<Magazine> searchMyScrap(Connection conn, Map<String, Object> searchParam) {
		PreparedStatement pstmt = null;
		String sql = prop.getProperty("searchMyScrap");
		ResultSet rset = null;
		List<Magazine> list = new ArrayList<>();
		String searchType = (String) searchParam.get("searchType");

		String searchKeyword = (String) searchParam.get("searchKeyword");

		switch (searchType) {
		case "region":
			sql += "region like '%" + searchKeyword + "%'";
			break;
		case "writer":
			sql += "writer like '%" + searchKeyword + "%'";
			break;
		}

		try {
			pstmt = conn.prepareStatement(sql);
			rset = pstmt.executeQuery();
			while (rset.next()) {
				Magazine magazine = new Magazine();
				magazine.setNo(rset.getInt("no"));
				magazine.setWriter(rset.getString("writer"));
				magazine.setTitle(rset.getString("title"));
				magazine.setRegion(rset.getString("region"));
				magazine.setContent(rset.getString("content"));
				magazine.setRegDate(rset.getDate("reg_date"));
				list.add(magazine);
			}
		} catch (SQLException e) {
			logger.debug(e.getMessage());
			e.printStackTrace();
		} finally {
			close(rset);
			close(pstmt);
		}

		return list;
	}

	public List<Magazine> selectAllMyScrap(Connection conn, Map<String, Integer> param, String writer) {
		PreparedStatement pstmt = null;
		String sql = prop.getProperty("selectAllMyScrap");
		ResultSet rset = null;
		List<Magazine> list = new ArrayList<>();

		try {
			pstmt = conn.prepareStatement(sql);
			pstmt.setInt(1, param.get("start"));
			pstmt.setInt(2, param.get("end"));
			pstmt.setString(3, writer);
			rset = pstmt.executeQuery();
			while (rset.next()) {
				Magazine magazine = new Magazine();
				magazine.setNo(rset.getInt("no"));
				magazine.setWriter(rset.getString("writer"));
				magazine.setTitle(rset.getString("title"));
				magazine.setRegion(rset.getString("region"));
				magazine.setContent(rset.getString("content"));
				magazine.setRegDate(rset.getDate("reg_date"));
			}
		} catch (SQLException e) {
			logger.debug(e.getMessage());
			e.printStackTrace();
		} finally {
			close(pstmt);
			close(rset);
		}
		return list;
	}
}

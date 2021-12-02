package com.tlab.mvc.magazine.model.dao;

import static com.tlab.mvc.common.JdbcTemplate.*;

import java.io.File;
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

import com.tlab.mvc.magazine.model.vo.Magazine;

public class MagazineDao {

	private Properties prop = new Properties();
	
	//properties 접근 method
	public MagazineDao() {
		File file = new File(MagazineDao.class.getResource("/magazine-query.properties").getPath());
		try {
			prop.load(new FileReader(file));
		} catch (IOException e) {
			e.printStackTrace();
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

}

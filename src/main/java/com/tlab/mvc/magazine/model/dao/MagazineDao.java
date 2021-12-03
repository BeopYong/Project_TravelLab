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

import com.tlab.mvc.magazine.model.exception.MagazineException;
import com.tlab.mvc.magazine.model.vo.Attachment;
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

	//DML
	public int insertMagazine(Connection conn, Magazine magazine) {
		PreparedStatement pstmt = null;
		String sql = prop.getProperty("insertMagazine");
		System.out.println(sql+"@MagazineDao");
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

	//등록하는 magazineNo과 일치하는지
	public int selectLastMagazineNo(Connection conn) {
		PreparedStatement pstmt = null;
		String sql = prop.getProperty("selectLastMagazineNo");
		System.out.println(sql + "selectlastMagazineDao");
		ResultSet rset = null;
		int magazineNo = 0;
		try {
			pstmt = conn.prepareStatement(sql);
			rset = pstmt.executeQuery();
			
			if(rset.next()) { //다음행이있는지 확인
				magazineNo = rset.getInt(1); //첫번째 컬럼값 가져오기
			}
		} catch (SQLException e) {
			throw new MagazineException("최근게시글번호 조회 오류", e);
		}finally {
			close(pstmt);
		}
		
		return magazineNo;
	}

	public int insertAttachment(Connection conn, Attachment attach) {
		PreparedStatement pstmt = null;
		String sql = prop.getProperty("insertAttachment");
		System.out.println("inserAttachMagazineDao = " + sql);
		int result = 0;
		
		try {
			pstmt = conn.prepareStatement(sql);
			pstmt.setInt(1, attach.getmagazineNo());
			pstmt.setString(2, attach.getOriginalFilename());
			pstmt.setString(3, attach.getRenamedFilename());
			
			result = pstmt.executeUpdate();
		} catch (SQLException e) {
			throw new MagazineException("첨부파일 등록 오류", e);
		}finally {
			close(pstmt);
		}
		
		return result;
	}

}

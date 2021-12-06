package com.tlab.mvc.magazine.model.dao;

import static com.tlab.mvc.common.JdbcTemplate.close;

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

import com.tlab.mvc.magazine.model.vo.MagazineComment;
import com.tlab.mvc.product.model.vo.ProductEntity; //기능구현을 위한게 아니라면 
import com.tlab.mvc.magazine.model.vo.MagazineAttachment;
import com.tlab.mvc.magazine.model.vo.MagazineEntity;

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
	
	//페이징a /게시물 목록조회
	public List<Magazine> selectAllMagazine(Connection conn, Map<String, Integer> param) {
		PreparedStatement pstmt = null;
		String sql = prop.getProperty("selectAllMagazine");
		ResultSet rset = null;
		List<Magazine> list = new ArrayList<>();
		
		try {
			pstmt = conn.prepareStatement(sql);
			pstmt.setInt(1, param.get("start")); 
			pstmt.setInt(2, param.get("end"));
			
			rset = pstmt.executeQuery();
			
			while(rset.next()) {
				Magazine magazine = new Magazine();
				magazine.setNo(rset.getInt("no")); //number
				magazine.setTitle(rset.getString("title"));
				magazine.setWriter(rset.getString("writer"));
				magazine.setContent(rset.getString("content"));
				magazine.setRegDate(rset.getDate("reg_date"));
				magazine.setReadCount(rset.getInt("read_count"));
				magazine.setRegion(rset.getString("region"));
			
//				magazine.setCommentCount(rset.getInt("comment_count")); //댓글
//				magazine.setAttachCount(rset.getInt("attach_count"));
				list.add(magazine);
			}
		} catch (SQLException e) {
			e.printStackTrace();
			throw new MagazineException("게시글 목록 조회 오류!", e);
		}finally {
			close(rset);
			close(pstmt);
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
//		System.out.println(sql+"@MagazineDao");
		int result = 0;
		
		try {
			pstmt = conn.prepareStatement(sql);
			pstmt.setString(1, magazine.getTitle());
			pstmt.setString(2, magazine.getWriter());
			pstmt.setString(3, magazine.getContent());
			pstmt.setString(4, magazine.getRegion());
			
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

	public int insertAttachment(Connection conn, MagazineAttachment attach) {
		PreparedStatement pstmt = null;
		String sql = prop.getProperty("insertAttachment");
		int result = 0;
		
		try {
			pstmt = conn.prepareStatement(sql);
			pstmt.setString(1, attach.getOriginalFilename());
			pstmt.setString(2, attach.getRenamedFilename());
			pstmt.setInt(3, attach.getMagazineNo());
			
			result = pstmt.executeUpdate();
		} catch (SQLException e) {
			throw new MagazineException("첨부파일 등록 오류", e);
		}finally {
			close(pstmt);
		}
		return result;
	}
	//게시물상세보기
	//DQL
	public Magazine selectOneMagazine(Connection conn, int no) {
		Magazine magazine = null;
		PreparedStatement pstmt = null;
		ResultSet rset = null;
		
		String sql = prop.getProperty("selectOneMagazine");
		try{
			//미완성쿼리문을 가지고 객체생성.
			pstmt = conn.prepareStatement(sql);
			//쿼리문미완성
			pstmt.setInt(1, no);
			//쿼리문실행
			//완성된 쿼리를 가지고 있는 pstmt실행(파라미터 없음)
			rset = pstmt.executeQuery();
			
			if(rset.next()){
				magazine = new Magazine();
				magazine.setNo(rset.getInt("no"));
				magazine.setTitle(rset.getString("title"));
				magazine.setWriter(rset.getString("writer"));
				magazine.setContent(rset.getString("content"));
				magazine.setRegDate(rset.getDate("reg_date"));
				magazine.setReadCount(rset.getInt("read_count"));
				magazine.setRegion(rset.getString("region"));
			}
		}catch(Exception e){
			e.printStackTrace();
//			throw new MagazineException("게시글 상세보기 오류", e);
		}finally{
			close(rset);
			close(pstmt);
		}
		
		return magazine;
	}
	public List<MagazineAttachment> selectAttachmentByMagazineNo(Connection conn, int magazineNo) {
		PreparedStatement pstmt = null;
		String sql = prop.getProperty("selectAttachmentByMagazineNo");
		ResultSet rset = null;
		List<MagazineAttachment> attachments = new ArrayList<>();
		
		try{
			//미완성쿼리문을 가지고 객체생성.
			pstmt = conn.prepareStatement(sql);
			//쿼리문미완성
			pstmt.setInt(1, magazineNo);
			//쿼리문실행
			//완성된 쿼리를 가지고 있는 pstmt실행(파라미터 없음)
			rset = pstmt.executeQuery();
			
			while(rset.next()){
				MagazineAttachment attach = new MagazineAttachment();
				attach.setNo(rset.getInt("no"));
				attach.setOriginalFilename(rset.getString("original_filename"));
				attach.setRenamedFilename(rset.getString("renamed_filename"));
				attach.setMagazineNo(rset.getInt("magazine_no"));
//				attach.setRegDate(rset.getDate("reg_date"));
				attachments.add(attach);
			}
		}catch(Exception e){
			e.printStackTrace();
		}finally{
			close(rset);
			close(pstmt);
		}
		return attachments;
	}

	//DQL
	public Magazine selectOneMagazineAttachment(Connection conn, int no) {
		Magazine magazine = null;
		PreparedStatement pstmt = null;
		ResultSet rset = null;
		
		String sql = prop.getProperty("selectOneMagazineAttachments");
		try{
			//미완성쿼리문을 가지고 객체생성.
			pstmt = conn.prepareStatement(sql);
			//쿼리문미완성
			pstmt.setInt(1, no);
			//쿼리문실행
			//완성된 쿼리를 가지고 있는 pstmt실행(파라미터 없음)
			rset = pstmt.executeQuery();
			
			if(rset.next()){
				magazine = new Magazine();
				magazine.setNo(rset.getInt("no"));
				magazine.setTitle(rset.getString("title"));
				magazine.setWriter(rset.getString("writer"));
				magazine.setContent(rset.getString("content"));
				magazine.setRegDate(rset.getDate("reg_date"));
				magazine.setReadCount(rset.getInt("read_count"));
				magazine.setRegion(rset.getString("region"));
				
				int attachNo = rset.getInt("attach_no");
				if(attachNo != 0) {
					// 첨부파일이 있는 경우 1행 또는 2행이다.
					List<MagazineAttachment> attachments = new ArrayList<>();
					do {
						MagazineAttachment attach = new MagazineAttachment();
						attach.setNo(rset.getInt("attach_no"));
						attach.setMagazineNo(rset.getInt("magazine_no"));
						attach.setOriginalFilename(rset.getString("original_filename"));
						attach.setRenamedFilename(rset.getString("renamed_filename"));
//						attach.setRegDate(rset.getDate("reg_date")); //magazineattachment 생성자 경로 확인하기
						attachments.add(attach);
					} while (rset.next());
					magazine.setAttachments(attachments);
				}
			}
		}catch(Exception e){
			e.printStackTrace();
		}finally{
			close(rset);
			close(pstmt);
		}
		return magazine;
	}

	//DML
	public int updateReadCount(Connection conn, int no) {
		PreparedStatement pstmt = null;
		String sql = prop.getProperty("updateReadCount");
		int result = 0;
		
		try {
			pstmt = conn.prepareStatement(sql);
			pstmt.setInt(1, no);
			result = pstmt.executeUpdate();
		} catch (SQLException e) {
			throw new MagazineException("조회수 증가 처리 오류!", e);
		} finally {
			close(pstmt);
		}
		return result;
	}

	public MagazineAttachment selectOneAttachment(Connection conn, int no) {
		PreparedStatement pstmt = null;
		String sql = prop.getProperty("selectOneAttachment");		
		ResultSet rset = null;
		MagazineAttachment attach = null;
		
		try {
			pstmt = conn.prepareStatement(sql);
			
			pstmt.setInt(1, no);
			
			rset = pstmt.executeQuery();
			
			while(rset.next()) {
				attach = new MagazineAttachment();
				attach.setNo(rset.getInt("no"));
				attach.setOriginalFilename(rset.getString("original_filename"));
				attach.setRenamedFilename(rset.getString("renamed_filename"));
				attach.setMagazineNo(rset.getInt("magazine_no"));
			}
		} catch (Exception e) {
			throw new MagazineException("첨부파일 조회 오류 ", e);
		}finally {
			close(rset);
			close(pstmt);
		}
		return attach;
	}

	//매거진 게시물 삭제
	//DML
	public int deleteMagazine(Connection conn, int no) {
		int result = 0;
		PreparedStatement pstmt = null;
		String sql = prop.getProperty("deleteMagazine"); 
		
		try {
			//미완성쿼리문을 가지고 객체생성.
			pstmt = conn.prepareStatement(sql);
			//쿼리문미완성
			pstmt.setInt(1, no);
			
			//쿼리문실행 : 완성된 쿼리를 가지고 있는 pstmt실행(파라미터 없음)
			//DML은 executeUpdate()
			result = pstmt.executeUpdate();
			
		} catch (SQLException e) {
			e.printStackTrace();
			throw new MagazineException("게시물 삭제 오류", e);
		} finally {
			close(pstmt);
		}
		return result;
	}
	
	public int updateMagazine(Connection conn, Magazine magazine) {
		int result = 0;
		PreparedStatement pstmt = null;
		String sql = prop.getProperty("updateMagazine");
		
		try {
			//미완성 커리로 객체생성
			pstmt = conn.prepareStatement(sql);
			
			//쿼리문 미완성
			pstmt.setString(1, magazine.getTitle());
			pstmt.setString(2, magazine.getContent());
			pstmt.setString(3, magazine.getRegion());
			pstmt.setInt(4, magazine.getNo());
			
			
			//쿼리문실행 : 완성된 쿼리를 가지고 있는 pstmt실행(파라미터 없음)
			result = pstmt.executeUpdate();
		} catch (SQLException e) {
			e.printStackTrace();
			throw new MagazineException("게시글 수정 오류", e);
		}finally {
			close(pstmt);
		}
		return result;
	}

	public int deleteAttachment(Connection conn, int delFileNo) {
		int result = 0;
		PreparedStatement pstmt = null;
		String sql = prop.getProperty("deleteAttachment");
		
		try {
			//미완성쿼리문 가지고 객체생성
			pstmt = conn.prepareStatement(sql);
			
			//쿼리문미완성
			pstmt.setInt(1, delFileNo);
			
			//쿼리문실행 : 완성된 쿼리를 가지고 있는 pstmt실행(파라미터없음)
			result = pstmt.executeUpdate();
			
		} catch (SQLException e) {
			e.printStackTrace();
		}finally {
			close(pstmt);
		}
		return result;
	}
	public List<MagazineComment> selectMagazineCommentList(Connection conn, int magazineNo) {
		PreparedStatement pstmt = null;
		String sql = prop.getProperty("selectMagazineCommentList");
		ResultSet rset = null;
		List<MagazineComment> commentList = new ArrayList<>();
		
		try {
			pstmt = conn.prepareStatement(sql);
			pstmt.setInt(1, magazineNo);
			
			rset = pstmt.executeQuery();
			
			while(rset.next()) {
				MagazineComment mc = new MagazineComment();
				mc.setNo(rset.getInt("no"));
				mc.setCommentLevel(rset.getInt("comment_level"));
				mc.setWriter(rset.getString("writer"));
				mc.setContent(rset.getString("content"));
				mc.setMagazineNo(rset.getInt("magazine_no"));
				mc.setCommentRef(rset.getInt("comment_ref")); // 댓글인 경우 null이고, 이는 0으로 치환된다.
				mc.setRegDate(rset.getDate("reg_date"));
				commentList.add(mc);
			}
		} catch (SQLException e) {
			e.printStackTrace();
		} finally {
			close(rset);
			close(pstmt);
		}
		return commentList;
	}


	public int deleteMagazineComment(Connection conn, int no) {
		PreparedStatement pstmt = null;
		int result = 0;
		String sql = prop.getProperty("deleteMagazineComment");
		try {
			pstmt = conn.prepareStatement(sql);
			pstmt.setInt(1, no);
			result = pstmt.executeUpdate();
		} catch (SQLException e) {
			throw new MagazineException("댓글 삭제 오류", e);
		} finally {
			close(pstmt);
		}
		return result;
	}

	public int insertMagazineComment(Connection conn, MagazineComment mc) {
		PreparedStatement pstmt = null;
		String sql = prop.getProperty("insertMagazineComment");
		int result = 0;
		
		try {
			pstmt = conn.prepareStatement(sql);
			pstmt.setInt(1, mc.getCommentLevel()); 	// 1, 2
			pstmt.setString(2, mc.getWriter()); 	// memberId
			pstmt.setString(3, mc.getContent()); 	// ..
			pstmt.setInt(4, mc.getMagazineNo());		// magazineNo
			pstmt.setObject(5, mc.getCommentRef() == 0 ? null : mc.getCommentRef());
			
			result = pstmt.executeUpdate();
		} catch (SQLException e) {
			e.printStackTrace();
			
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
	//DQL 매거진 게시물 검색
	public List<Magazine> searchMagazine(Connection conn, Map<String, Object> finder) {
		PreparedStatement pstmt = null;
		ResultSet rset = null;
		//0행이 조회되도 Arraylist<>()는 리턴되어야함.
		List<Magazine> list = new ArrayList<>();
		String sql = prop.getProperty("searchMagazineByRegion"); //미완성쿼리
		String searchType = (String) finder.get("searchType");
		String searchWord = (String) finder.get("searchword");
		
		switch(searchType) {
		case "region":
			sql+= " region like '%" + searchWord + "%'";
			break;
//		case "writer":
//			sql = prop.getProperty("searchMagazineByWriter");searchWord
//			finder.put("searchWord", "%" + finder.get("searcWord") + "%");
//			break;
		}
		System.out.println("finder sql@dao searchmagazine method = " + sql);
		
		try {
			//pstmt객체생성, 미완성쿼리대입
			pstmt = conn.prepareStatement(sql);
//			pstmt.setString(1, (String) finder.get("searchWord"));
			
			//쿼리실행, rset대입
			rset = pstmt.executeQuery();
			while(rset.next()) {
				Magazine magazine = new Magazine();
				magazine.setNo(rset.getInt("no"));
				magazine.setTitle(rset.getString("title"));
				magazine.setWriter(rset.getString("writer"));
				magazine.setContent(rset.getString("content"));
				magazine.setRegDate(rset.getDate("reg_date"));
				magazine.setReadCount(rset.getInt("read_count"));
				magazine.setRegion(rset.getString("region"));
				list.add(magazine);
			}
		} catch (SQLException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}finally {
			close(rset);
			close(pstmt);
		}
		return list;
	}

	public List<Magazine> searchMagazine(Connection conn, Map<String, Object> searchParam) {
		PreparedStatement pstmt = null;
        String sql = prop.getProperty("searchMagazine");
        ResultSet rset = null;
        List<Magazine> list = new ArrayList<>();
        String searchType = (String) searchParam.get("searchType");
        String searchKeyword = (String) searchParam.get("searchKeyword");
        switch (searchType) {
        case "cateCode":
            sql += " region like '%" + searchKeyword + "%'";
            break;
        case "writer":
            sql += " writer like '%" + searchKeyword + "%'";
            break;
        case "title":
            sql += " title like '%" + searchKeyword + "%'";
            break;
        }
        
        try {
            pstmt = conn.prepareStatement(sql);
            rset = pstmt.executeQuery();
            while (rset.next()) {
            	Magazine magazine = new Magazine();
            	magazine.setWriter(rset.getString("writer"));
            	magazine.setTitle(rset.getString("title"));
            	magazine.setRegion(rset.getString("region"));
                magazine.setContent(rset.getString("content"));
                magazine.setValid(rset.getString("valid"));
                magazine.setRegDate(rset.getDate("reg_date"));
                list.add(magazine);
            }
        } catch (SQLException e) {
            e.printStackTrace();
        } finally {
            close(rset);
            close(pstmt);
        }
        return list;
	}

}

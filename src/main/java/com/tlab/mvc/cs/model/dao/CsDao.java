package com.tlab.mvc.cs.model.dao;

import static com.tlab.mvc.common.JdbcTemplate.close;

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

import com.tlab.mvc.cs.model.exception.CsException;
import com.tlab.mvc.cs.model.vo.Cs;
import com.tlab.mvc.cs.model.vo.CsAttachment;
import com.tlab.mvc.cs.model.vo.CsComment;

public class CsDao {

	private Properties prop = new Properties();

	public CsDao() {
		File file = new File(CsDao.class.getResource("/csboard-query.properties").getPath());
		try {
			prop.load(new FileReader(file));
		} catch (IOException e) {
			e.printStackTrace();
		}
	}

	public List<Cs> selectAllCs(Connection conn, Map<String, Integer> param) {
		PreparedStatement pstmt = null;
		String sql = prop.getProperty("selectAllCs");
		ResultSet rset = null;
		List<Cs> list = new ArrayList<>();

		try {
			pstmt = conn.prepareStatement(sql);
			System.out.println(sql + "@csDao");
			pstmt.setInt(1, param.get("start"));
			pstmt.setInt(2, param.get("end"));

			rset = pstmt.executeQuery();

			while (rset.next()) {
				Cs cs = new Cs();
				cs.setNo(rset.getInt("no"));
				cs.setOptions(rset.getString("options"));
				cs.setTitle(rset.getString("title"));
				cs.setWriter(rset.getString("writer"));
				cs.setContent(rset.getString("content"));
				cs.setRegDate(rset.getDate("reg_date"));
				cs.setCommentCount(rset.getInt("comment_count"));
				list.add(cs);
			}

		} catch (SQLException e) {
			throw new CsException("게시글 목록 조회 오류!", e);
		} finally {
			close(rset);
			close(pstmt);
		}
		return list;
	}

	public int selectTotalCsCount(Connection conn) {
		PreparedStatement pstmt = null;
		String sql = prop.getProperty("selectTotalCsCount");
		ResultSet rset = null;
		int totalCount = 0;

		try {
			pstmt = conn.prepareStatement(sql);
			rset = pstmt.executeQuery();
			if (rset.next()) {
				totalCount = rset.getInt(1);
			}
		} catch (SQLException e) {
			e.printStackTrace();
		} finally {
			close(rset);
			close(pstmt);
		}
		return totalCount;
	}

	public int insertCs(Connection conn, Cs cs) {
		PreparedStatement pstmt = null;
		String sql = prop.getProperty("insertCs");
		System.out.println(sql);
		int result = 0;

		try {
			pstmt = conn.prepareStatement(sql);
			pstmt.setString(1, cs.getOptions());
			pstmt.setString(2, cs.getTitle());
			pstmt.setString(3, cs.getContent());
			pstmt.setString(4, cs.getWriter());

			result = pstmt.executeUpdate();
		} catch (SQLException e) {
			throw new CsException("게시물 등록 오류!", e);
		} finally {
			close(pstmt);
		}

		return result;
	}

	public int selectLastCsNo(Connection conn) {
		PreparedStatement pstmt = null;
		String sql = prop.getProperty("selectLastCsNo");
		ResultSet rset = null;
		int csNo = 0;
		try {
			pstmt = conn.prepareStatement(sql);
			rset = pstmt.executeQuery();
			if (rset.next()) {
				csNo = rset.getInt(1);
			}
		} catch (SQLException e) {
			throw new CsException("최근 게시글 번호 조회 오류!", e);
		} finally {
			close(pstmt);
		}
		return csNo;
	}

	public int insertCsAttachment(Connection conn, CsAttachment attach) {
		PreparedStatement pstmt = null;
		String sql = prop.getProperty("insertCsAttachment");
		int result = 0;

		try {
			pstmt = conn.prepareStatement(sql);
			pstmt.setInt(1, attach.getCsBoardno());
			pstmt.setString(2, attach.getOriginalFilename());
			pstmt.setString(3, attach.getRenamedFilename());

			result = pstmt.executeUpdate();
		} catch (SQLException e) {
			throw new CsException("첨부파일 등록 오류!", e);
		} finally {
			close(pstmt);
		}

		return result;
	}

	public List<CsAttachment> selectAttachmentByCsNo(Connection conn, int csCsno) {
		PreparedStatement pstmt = null;
		String sql = prop.getProperty("selectAttachmentByCsNo");
		ResultSet rset = null;
		List<CsAttachment> csAttachments = new ArrayList<>();

		try {
			pstmt = conn.prepareStatement(sql);
			pstmt.setInt(1, csCsno);
			rset = pstmt.executeQuery();

			while (rset.next()) {
				CsAttachment attach = new CsAttachment();
				attach.setNo(rset.getInt("no"));
				attach.setCsBoardno(rset.getInt("cs_board_no"));
				attach.setOriginalFilename(rset.getString("original_filename"));
				attach.setRenamedFilename(rset.getString("renamed_filename"));
				csAttachments.add(attach);
			}
		} catch (Exception e) {
			e.printStackTrace();
		} finally {
			close(rset);
			close(pstmt);
		}
		return csAttachments;

	}

	public Cs selectOneCsAttachments(Connection conn, int no) {
		Cs cs = null;
		PreparedStatement pstmt = null;
		ResultSet rset = null;

		String query = prop.getProperty("selectOneCsAttachements");
		try {
			pstmt = conn.prepareStatement(query);
			pstmt.setInt(1, no);
			rset = pstmt.executeQuery();

			if (rset.next()) {
				cs = new Cs();
				cs.setNo(rset.getInt("no"));
				cs.setOptions(rset.getString("options"));
				cs.setTitle(rset.getString("title"));
				cs.setWriter(rset.getString("writer"));
				cs.setContent(rset.getString("content"));
				cs.setRegDate(rset.getDate("reg_date"));

				int attachNo = rset.getInt("attach_no");
				if (attachNo != 0) {
					List<CsAttachment> attachments = new ArrayList<>();
					do {
						CsAttachment attach = new CsAttachment();
						attach.setNo(rset.getInt("attach_no"));
						attach.setCsBoardno(rset.getInt("cs_board_no"));
						attach.setOriginalFilename(rset.getString("original_filename"));
						attach.setRenamedFilename(rset.getString("renamed_filename"));
						attachments.add(attach);
					} while (rset.next());
					cs.setAttachments(attachments);
				}
			}
		} catch (Exception e) {
			e.printStackTrace();
		} finally {
			close(rset);
			close(pstmt);
		}
		return cs;
	}

	public CsAttachment selectOneAttachment(Connection conn, int no) {
		PreparedStatement pstmt = null;
		String sql = prop.getProperty("selectOneAttachment");
		ResultSet rset = null;
		CsAttachment attach = null;

		try {
			pstmt = conn.prepareStatement(sql);
			pstmt.setInt(1, no);
			rset = pstmt.executeQuery();

			while (rset.next()) {
				attach = new CsAttachment();
				attach.setNo(rset.getInt("no"));
				attach.setCsBoardno(rset.getInt("cs_borad_no"));
				attach.setOriginalFilename(rset.getString("original_filename"));
				attach.setRenamedFilename(rset.getString("renamed_filename"));
			}
		} catch (Exception e) {
			throw new CsException("첨부파일 조회 오류!", e);
		} finally {
			close(rset);
			close(pstmt);
		}
		return attach;
	}

	public int deleteCs(Connection conn, int no) {
		int result = 0;
		PreparedStatement pstmt = null;
		String query = prop.getProperty("deleteCs");

		try {
			pstmt = conn.prepareStatement(query);
			pstmt.setInt(1, no);
			result = pstmt.executeUpdate();

		} catch (SQLException e) {
			e.printStackTrace();
		} finally {
			close(pstmt);
		}
		return result;
	}

	public Cs selectOneCs(Connection conn, int no) {
		Cs cs = null;
		PreparedStatement pstmt = null;
		ResultSet rset = null;
		String query = prop.getProperty("selectOneCs");

		try {
			pstmt = conn.prepareStatement(query);
			pstmt.setInt(1, no);
			rset = pstmt.executeQuery();

			if (rset.next()) {
				cs = new Cs();
				cs.setNo(rset.getInt("no"));
				cs.setTitle(rset.getString("title"));
				cs.setWriter(rset.getString("writer"));
				cs.setContent(rset.getString("content"));
				cs.setRegDate(rset.getDate("reg_date"));
			}
		} catch (Exception e) {
			e.printStackTrace();
		} finally {
			close(rset);
			close(pstmt);
		}
		return cs;
	}

	public int updateCs(Connection conn, Cs cs) {
		int result = 0;
		PreparedStatement pstmt = null;
		String sql = prop.getProperty("updateCs");

		try {
			pstmt = conn.prepareStatement(sql);
			pstmt.setString(1, cs.getTitle());
			pstmt.setString(2, cs.getContent());
			pstmt.setInt(3, cs.getNo());

			result = pstmt.executeUpdate();

		} catch (SQLException e) {
			e.printStackTrace();
		} finally {
			close(pstmt);
		}
		return result;
	}

	public int deleteAttachment(Connection conn, int delFileNo) {
		int result = 0;
		PreparedStatement pstmt = null;
		String query = prop.getProperty("deleteAttachment");

		try {
			pstmt = conn.prepareStatement(query);
			pstmt.setInt(1, delFileNo);
			result = pstmt.executeUpdate();

		} catch (SQLException e) {
			e.printStackTrace();
		} finally {
			close(pstmt);
		}
		return result;
	}

	public List<CsComment> selectCsCommentList(Connection conn, int csBoardno) {
		PreparedStatement pstmt = null;
		String sql = prop.getProperty("selectCsCommentList");
		ResultSet rset = null;
		List<CsComment> commentList = new ArrayList<>();

		try {
			pstmt = conn.prepareStatement(sql);
			pstmt.setInt(1, csBoardno);

			rset = pstmt.executeQuery();

			while (rset.next()) {
				CsComment cc = new CsComment();
				cc.setNo(rset.getInt("no"));
				cc.setCommentLevel(rset.getInt("comment_level"));
				cc.setWriter(rset.getString("writer"));
				cc.setContent(rset.getString("content"));
				cc.setCsBoardno(rset.getInt("cs_board_no"));
				cc.setCommentRef(rset.getInt("comment_ref")); // 댓글인 경우 null이고, 이는 0으로 치환된다.
				cc.setRegDate(rset.getDate("reg_date"));
				commentList.add(cc);
				System.out.println(commentList);
			}
		} catch (SQLException e) {
			e.printStackTrace();
		} finally {
			close(rset);
			close(pstmt);
		}
		return commentList;
	}

	public int insertCsComment(Connection conn, CsComment cc) {
		PreparedStatement pstmt = null;
		String sql = prop.getProperty("insertBoardComment");
		int result = 0;

		try {
			pstmt = conn.prepareStatement(sql);
			pstmt.setInt(1, cc.getCommentLevel()); // 번호
			pstmt.setString(2, cc.getWriter()); // 작성자
			pstmt.setString(3, cc.getContent()); // 댓글 내용
			pstmt.setInt(4, cc.getCsBoardno()); // CsBoardno
			pstmt.setObject(5, cc.getCommentRef() == 0 ? null : cc.getCommentRef());

			result = pstmt.executeUpdate();
		} catch (SQLException e) {
			e.printStackTrace();
		} finally {
			close(pstmt);
		}

		return result;
	}

	public int deleteCsComment(Connection conn, int no) {
		PreparedStatement pstmt = null;
		int result = 0;
		String sql = prop.getProperty("deleteCsComment");
		try {
			pstmt = conn.prepareStatement(sql);
			pstmt.setInt(1, no);
			result = pstmt.executeUpdate();
		} catch (SQLException e) {
			throw new CsException("댓글 삭제 오류", e);
		} finally {
			close(pstmt);
		}
		return result;
	}
}
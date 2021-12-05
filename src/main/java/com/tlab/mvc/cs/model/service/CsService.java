package com.tlab.mvc.cs.model.service;

import static com.tlab.mvc.common.JdbcTemplate.close;
import static com.tlab.mvc.common.JdbcTemplate.commit;
import static com.tlab.mvc.common.JdbcTemplate.getConnection;
import static com.tlab.mvc.common.JdbcTemplate.rollback;

import java.sql.Connection;
import java.util.List;
import java.util.Map;

import com.tlab.mvc.cs.model.dao.CsDao;
import com.tlab.mvc.cs.model.vo.Cs;
import com.tlab.mvc.cs.model.vo.CsAttachment;
import com.tlab.mvc.cs.model.vo.CsComment;

public class CsService {

	private CsDao csDao = new CsDao();

	public List<Cs> selectAllCs(Map<String, Integer> param) {
		Connection conn = getConnection();
		List<Cs> list = csDao.selectAllCs(conn, param);
		close(conn);
		return list;
	}

	public int selectTotalCsCount() {
		Connection conn = getConnection();
		int totalCount = csDao.selectTotalCsCount(conn);
		close(conn);
		return totalCount;
	}

	public int insertCs(Cs cs) {
		Connection conn = null;
		int result = 0;
		try {
			conn = getConnection();
			result = csDao.insertCs(conn, cs);

			int csBoardno = csDao.selectLastCsNo(conn); // FK칼럼값
			System.out.println("[CsService] csBoardno = " + csBoardno);
			cs.setNo(csBoardno);

			List<CsAttachment> csAttachments = cs.getAttachments();
			if (csAttachments != null) {
				for (CsAttachment attach : csAttachments) {
					attach.setCsBoardno(csBoardno);
					result = csDao.insertCsAttachment(conn, attach);
				}
			}

			commit(conn);
		} catch (Exception e) {
			rollback(conn);
			throw e;
		} finally {
			close(conn);
		}
		return result;
	}

	public Cs selectOneCsAttachments(int no) {
		Connection conn = getConnection();
		Cs cs = csDao.selectOneCsAttachments(conn, no);
		close(conn);
		return cs;
	}

	public CsAttachment selectOneAttachment(int no) {
		Connection conn = getConnection();
		CsAttachment attach = csDao.selectOneAttachment(conn, no);
		close(conn);
		return attach;
	}

	public List<CsAttachment> selectAttachmentByCsNo(int no) {
		Connection conn = getConnection();
		List<CsAttachment> attachments = csDao.selectAttachmentByCsNo(conn, no);
		close(conn);
		return attachments;
	}

	public int deleteCs(int no) {
		Connection conn = null;
		int result = 0;
		try {
			conn = getConnection();
			result = csDao.deleteCs(conn, no);
			commit(conn);
		} catch (Exception e) {
			rollback(conn);
			throw e;
		} finally {
			close(conn);
		}
		return result;
	}

	public Cs selectOneCs(int no) {
		Connection conn = getConnection();
		Cs cs = csDao.selectOneCs(conn, no);
		List<CsAttachment> attachments = csDao.selectAttachmentByCsNo(conn, no);
		cs.setAttachments(attachments);
		close(conn);
		return cs;
	}

	public int updateCs(Cs cs) {
		Connection conn = null;
		int result = 0;
		try {
			conn = getConnection();
			// 트랙잭션처리할 코드
			result = csDao.updateCs(conn, cs);
			
			// 2. attachment insert
			List<CsAttachment> attachments = cs.getAttachments();
			if(attachments != null && !attachments.isEmpty()) {
				for(CsAttachment attach : attachments) {
					result = csDao.insertCsAttachment(conn, attach); 
				}
			}
			commit(conn);
		} catch (Exception e) {
			rollback(conn);
			throw e;
		} finally {
			close(conn);
		}
		return result;
	}

	public int deleteAttachment(int delFileNo) {
		Connection conn = null;
		int result = 0;
		try {
			conn = getConnection();
			result = csDao.deleteAttachment(conn, delFileNo);
			commit(conn);
		} catch (Exception e) {
			rollback(conn);
			throw e;
		} finally {
			close(conn);
		}
		return result;
	}

	public List<CsComment> selectCsCommentList(int csBoardno) {
		Connection conn = getConnection();
		List<CsComment> commentList = csDao.selectCsCommentList(conn, csBoardno);
		close(conn);
		return commentList;
	}


}

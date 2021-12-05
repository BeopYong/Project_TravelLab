package com.tlab.mvc.magazine.model.service;

import static com.tlab.mvc.common.JdbcTemplate.close;
import static com.tlab.mvc.common.JdbcTemplate.commit;
import static com.tlab.mvc.common.JdbcTemplate.getConnection;
import static com.tlab.mvc.common.JdbcTemplate.rollback;

import java.sql.Connection;
import java.util.ArrayList;
import java.util.List;
import java.util.Map;

import com.tlab.mvc.magazine.model.dao.MagazineDao;
import com.tlab.mvc.magazine.model.vo.MagazineAttachment;
import com.tlab.mvc.magazine.model.vo.MagazineComment;
import com.tlab.mvc.magazine.model.vo.Magazine;
import com.tlab.mvc.magazine.model.exception.MagazineException;
import com.tlab.mvc.magazine.model.vo.MagazineAttachment;
import com.tlab.mvc.magazine.model.vo.Magazine;
import com.tlab.mvc.magazine.model.exception.MagazineException;
import com.tlab.mvc.magazine.model.vo.MagazineAttachment;
import com.tlab.mvc.magazine.model.vo.Magazine;

public class MagazineService {

	private MagazineDao magazineDao = new MagazineDao();


	//페이징처리a /게시물 목록조회

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

	
	/**
	 * DML 트래잭션 
	 * @param magazine
	 * @return
	 */
	public int insertMagazine(Magazine magazine) {
		Connection conn = getConnection();
		int result = 0;

		try {
			result = magazineDao.insertMagazine(conn, magazine);
			
			//보드넘버 조회해 맞는지 확인 : select seq_magazine_no.currval from dual
			int magazineNo = magazineDao.selectLastMagazineNo(conn);
			System.out.println("[MagazineService insertMagazine()] magazineNo = " + magazineNo);
			magazine.setNo(magazineNo); //servlet에서 참조
			
//			//첨부파일
//			List<MagazineAttachment> attachments = magazine.getAttachments();
//			if(attachments != null) {
//				//insert into attachment values(seq_attachment_no.nextval,.?,?, default)
//				for(MagazineAttachment attach : attachments) {
//					attach.setMagazineNo(magazineNo);
//					result = magazineDao.insertAttachment(conn, attach);
//				}
//			}
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
	
	//DQL
	public Magazine selectOneMagazineAttachments(int no) {
		Connection conn = getConnection();
		Magazine magazine = magazineDao.selectOneMagazineAttachment(conn, no);
		close(conn);
		return magazine;
	}
	
	//DML
	public int updateReadCount(int no) {
		Connection conn = null;
		int result = 0;
		try {
			conn = getConnection();
			result = magazineDao.updateReadCount(conn, no);
			commit(conn);
		} catch (Exception e) {
			rollback(conn);
			throw e;
		} finally {
			close(conn);
		}
		return result;
	}
	
	//매거진 게시물 상세보기
	//DQL
	public Magazine selectOneMagazine(int no) {
		Magazine magazine;
		Connection conn = getConnection();

		conn = getConnection();
		magazine = magazineDao.selectOneMagazine(conn, no);
//		List<MagazineAttachment> attachments = magazineDao.selectAttachmentByMagazineNo(conn, no);
//		magazine.setAttachments(attachments);
		close(conn);
		
		return magazine;
	}
	//매거진 게시물 수정
	public int updateMagazine(Magazine magazine) {
		Connection conn = null;
		int result = 0;
		
		try {
			conn = getConnection();
			//트랙잭션
			//1 매거진 업데이트
			result = magazineDao.updateMagazine(conn, magazine);
			
//			//2 attachment insert
//			List<MagazineAttachment> attachments = magazine.getAttachments();
//			if(attachments != null && !attachments.isEmpty()) {
//				for(MagazineAttachment attach : attachments) {
//					result = magazineDao.insertAttachment(conn, attach);
//				}
//			}
			commit(conn);
		} catch (Exception e) {
			rollback(conn);
			throw e;
		}finally {
			close(conn);
		}
		return result;
	}
	public int deleteAttachment(int delFileNo) {
		Connection conn = null;
		int result = 0;
		try {
			conn = getConnection();
			result = magazineDao.deleteAttachment(conn, delFileNo);
			commit(conn);
		} catch (Exception e) {
			rollback(conn);
			throw e;
		}finally {
			close(conn);
		}
		return result;
	}
	
	public MagazineAttachment selectOneAttachment(int no) {
		Connection conn = getConnection();
		MagazineAttachment attach = magazineDao.selectOneAttachment(conn, no);
		close(conn);
		return attach;
	}
	
	public int deleteMagazineComment(int no) {
		Connection conn = getConnection(); 
		int result = 0;
		try {
			result = magazineDao.deleteMagazineComment(conn, no);
			commit(conn);
		} catch(Exception e) {
			rollback(conn);
			throw e;
		}
		return result;
	}
	public int insertMagazineComment(MagazineComment mc) {
		Connection conn = null;
		int result = 0;
		try {
			conn = getConnection();
			result = magazineDao.insertMagazineComment(conn, mc);
			commit(conn);
		} catch (Exception e) {
			rollback(conn);
			throw e;
		} finally {
			close(conn);
		}
		return result;
	}
	public List<MagazineAttachment> selectAttachmentByMagazineNo(int no) {
		Connection conn = getConnection();
		List<MagazineAttachment> attachments = magazineDao.selectAttachmentByMagazineNo(conn, no);
		close(conn);
		return attachments;
	}
	
	//매거진 게시물 삭제
	//DML
	public int deleteMagazine(int no) {
		Connection conn = getConnection();;
		int result = 0;
		try {
			conn = getConnection();
			result = magazineDao.deleteMagazine(conn, no);
			//에러 없으면 if절로 이동
			if(result == 0)
				throw new IllegalArgumentException("해당 게시글이 존재하지 않아 삭제할 수 없습니다. : " + no);
			commit(conn);
		} catch (Exception e) {
			rollback(conn);
			throw e;
		} finally {
			close(conn);
		}
		return result;
	}
	public List<MagazineComment> selectMagazineCommentList(int magazineNo) {
		Connection conn = getConnection();
		List<MagazineComment> commentList = magazineDao.selectMagazineCommentList(conn, magazineNo);
		close(conn);
		return commentList;
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

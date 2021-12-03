package com.tlab.mvc.magazine.model.service;

import static com.tlab.mvc.common.JdbcTemplate.close;
import static com.tlab.mvc.common.JdbcTemplate.commit;
import static com.tlab.mvc.common.JdbcTemplate.getConnection;
import static com.tlab.mvc.common.JdbcTemplate.rollback;

import java.sql.Connection;
import java.util.List;
import java.util.Map;

import com.tlab.mvc.magazine.model.dao.MagazineDao;
import com.tlab.mvc.magazine.model.vo.Attachment;
import com.tlab.mvc.magazine.model.vo.Magazine;
import com.tlab.mvc.magazine.model.exception.MagazineException;
import com.tlab.mvc.magazine.model.vo.Attachment;
import com.tlab.mvc.magazine.model.vo.Magazine;
import com.tlab.mvc.magazine.model.exception.MagazineException;
import com.tlab.mvc.magazine.model.vo.Attachment;
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
	
	//DML
	public int insertMagazine(Magazine magazine) {
		Connection conn = getConnection();
		int result = 0;
		
		try {
			conn = getConnection();
			result = magazineDao.insertMagazine(conn, magazine);
			
			//보드넘버 조회해 맞는지 확인 : select seq_magazine_no.currval from dual
			int magazineNo = magazineDao.selectLastMagazineNo(conn);
			System.out.println("[MagazineService] magazineNo = " + magazineNo);
			
			//첨부파일
			List<Attachment> attachments = magazine.getAttachments();
			if(attachments != null) {
				//insert into attachment values(seq_attachment_no.nextval,.?,?, default)
				for(Attachment attach : attachments) {
					attach.setmagazineNo(magazineNo);
					result = magazineDao.insertAttachment(conn, attach);
				}
			}
			
			commit(conn);
		} catch (Exception e) {
			rollback(conn);
			throw e;
		}finally {
			close(conn);
		}		
		return result;
	}

}

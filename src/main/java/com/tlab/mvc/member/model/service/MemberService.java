package com.tlab.mvc.member.model.service;

import static com.tlab.mvc.common.JdbcTemplate.*;

import com.tlab.mvc.member.model.dao.MemberDao;
import com.tlab.mvc.member.model.vo.Member;
import com.tlab.mvc.member.model.exception.MemberException;

import java.sql.Connection;
import java.util.List;
import java.util.Map;

public class MemberService {

	public static final String USER_ROLE = "U";
	public static final String SELLER_ROLE = "S";
	public static final String ADMIN_ROLE = "A";

	public static final String VALID_Y="Y";
	public static final String VALID_N="N";
	
	private MemberDao memberDao = new MemberDao();

	public Member selectOneMember(String memberId) {

		Connection conn = getConnection();
		Member member = memberDao.selectOneMember(conn, memberId);
		close(conn);
		return member;
	}

	public int insertMember(Member member) {
		Connection conn = null;
		int result = 0;
		try {
			conn = getConnection();
			result = memberDao.insertMember(conn, member);
			commit(conn);
		} catch (Exception e) {
			rollback(conn);
			throw e;
		} finally {
			close(conn);
		}
		return result;
	}

	public int updateMember(Member member) {
		Connection conn = null;
		int result = 0;
		try {
			conn = getConnection();
			result = memberDao.updateMember(conn, member);
			commit(conn);
		} catch (Exception e) {
			rollback(conn);
			throw e;
		} finally {
			close(conn);
		}
		return result;
	}

	public int updatePassword(Member member) {
		Connection conn = null;
		int result = 0;
		try {
			conn = getConnection();
			result = memberDao.updatePassword(conn, member);
			commit(conn);
		} catch (Exception e) {
			rollback(conn);
			throw e;
		} finally {
			close(conn);
		}
		return result;
	}

	public int deleteMember(String memberId) {
		Connection conn = null;
		int result = 0;
		try {
			conn = getConnection();
			result = memberDao.deleteMember(conn, memberId);
			if (result == 0)
				throw new MemberException("해당 회원은 존재하지 않습니다.");
			commit(conn);
		} catch (Exception e) {
			rollback(conn);
			throw e;
		} finally {
			close(conn);
		}
		return result;
	}

	// 관리자용 Service
	public List<Member> selectAllMember(Map<String, Integer> param) {
		Connection conn = getConnection();
		List<Member> list = memberDao.selectAllMember(conn, param);
		close(conn);
		return list;
	}

	public List<Member> searchMember(Map<String, Object> searchParam) {
		Connection conn = getConnection();
		List<Member> list = memberDao.searchMember(conn, searchParam);
		close(conn);
		return list;
	}

	public int selectTotalMemberCount() {
		Connection conn = getConnection();
		int totalCount = memberDao.totalMemberCount(conn);
		close(conn);
		return totalCount;
	}

	public int updateMemberRole(Member member) {
		Connection conn = null;
		int result = 0;
		try {
			conn = getConnection();
			result = memberDao.updateMemberRole(conn, member);
			commit(conn);
		} catch (Exception e) {
			rollback(conn);
			throw e;
		} finally {
			close(conn);
		}

		return result;
	}

	public int updateMemberValid(Member member) {
		Connection conn = null;
		int result = 0;
		try {
			conn = getConnection();
			result = memberDao.updateMemberValid(conn, member);
			commit(conn);
		} catch (Exception e) {
			rollback(conn);
			throw e;
		} finally {
			close(conn);
		}

		return result;
	}



}

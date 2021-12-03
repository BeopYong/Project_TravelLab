package com.tlab.mvc.member.model.dao;

import static com.tlab.mvc.common.JdbcTemplate.close;

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

import com.tlab.mvc.member.model.exception.MemberException;
import com.tlab.mvc.member.model.vo.Member;

import org.apache.log4j.Logger;

public class MemberDao {

	private Properties prop = new Properties();
	private Logger logger = Logger.getRootLogger();

	public MemberDao() {

		String filepath = MemberDao.class.getResource("/member-query.properties").getPath();
		System.out.println(filepath);
		try {
			prop.load(new FileReader(filepath));
		} catch (IOException e) {
			e.printStackTrace();
			logger.debug(e.getMessage());
		}
	}

	public Member selectOneMember(Connection conn, String memberId) {
		PreparedStatement pstmt = null;
		String sql = prop.getProperty("selectOneMember");
		ResultSet rset = null;
		Member member = null;

		try {
			pstmt = conn.prepareStatement(sql);
			pstmt.setString(1, memberId);
			rset = pstmt.executeQuery();
			while (rset.next()) {
				member = new Member();
				member.setMemberId(rset.getString("member_id"));
				member.setPassword(rset.getString("password"));
				member.setMemberName(rset.getString("member_name"));
				member.setEmail(rset.getString("email"));
				member.setPayCode(rset.getInt("paycode"));
				member.setTel(rset.getString("tel"));
				member.setValid(rset.getString("valid"));
				member.setRegDate(rset.getDate("reg_date"));
				member.setMemberRole(rset.getString("member_role"));
			}
		} catch (SQLException e) {
			e.printStackTrace();
			logger.debug(e.getMessage() + pstmt.toString());
		} finally {
			// 4.자원반납
			close(rset);
			close(pstmt);
		}
		return member;
	}

	public int insertMember(Connection conn, Member member) {
		PreparedStatement pstmt = null;
		String sql = prop.getProperty("insertMember");
		int result = 0;

		try {
			pstmt = conn.prepareStatement(sql);
			pstmt.setString(1, member.getMemberId());
			pstmt.setString(2, member.getPassword());
			pstmt.setString(3, member.getMemberName());
			pstmt.setString(4, member.getEmail());
			pstmt.setInt(5, member.getPayCode());
			pstmt.setString(6, member.getTel());
			pstmt.setString(7, member.getMemberRole());
			result = pstmt.executeUpdate();

		} catch (SQLException e) {
			logger.debug(e.getMessage() + pstmt.toString());
			throw new MemberException("회원가입 오류!", e);
		} finally {
			// 3.자원반납
			close(pstmt);
		}
		return result;
	}

	public int updateMember(Connection conn, Member member) {
		PreparedStatement pstmt = null;
		String sql = prop.getProperty("updateMember");
		int result = 0;
		try {
			pstmt = conn.prepareStatement(sql);
			pstmt.setString(1, member.getMemberName());
			pstmt.setString(2, member.getEmail());
			pstmt.setInt(3, member.getPayCode());
			pstmt.setString(4, member.getTel());
			pstmt.setString(5, member.getMemberId());

			result = pstmt.executeUpdate();

		} catch (SQLException e) {
			logger.debug(e.getMessage() + pstmt.toString());
			throw new MemberException("업데이트 오류!", e);
		} finally {
			close(pstmt);
		}
		return result;
	}

	public int deleteMember(Connection conn, String membmerId) {
		int result = 0;
		PreparedStatement pstmt = null;
		String query = prop.getProperty("deleteMember");

		try {
			pstmt = conn.prepareStatement(query);
			pstmt.setString(1, membmerId);
			result = pstmt.executeUpdate();

		} catch (SQLException e) {
			logger.debug(e.getMessage() + pstmt.toString());
			throw new MemberException("회원 삭제 오류!", e);
		} finally {
			close(pstmt);
		}
		return result;
	}

	public int updatePassword(Connection conn, Member member) {
		int result = 0;
		PreparedStatement pstmt = null;
		String query = prop.getProperty("updatePassword");

		try {
			pstmt = conn.prepareStatement(query);
			pstmt.setString(1, member.getPassword());
			pstmt.setString(2, member.getMemberId());
			result = pstmt.executeUpdate();

		} catch (SQLException e) {
			logger.debug(e.getMessage() + pstmt.toString());
			throw new MemberException("비밀번호 수정 오류!", e);
		} finally {
			close(pstmt);
		}
		return result;
	}

	/*
	 * @혜미님 작업 : 관리자-멤버조회 권한 추가 해야 하는 부분 1. 관리자가 member에 대한 valid(차단여부)를 변경하는 부분
	 * 
	 * 다음 요청에 대한 Servlet생성한다. ("/admin/updateMemberValid") member가 자신의 정보를 업데이트 하듯이
	 * 관리자가 updateValid하는 쿼리를 작성한다.
	 * 
	 * 2. 관리자가 member를 삭제하는 부분
	 * 
	 * 다음 요청에 대한 Servlet생성 ("/admin/deleteMember")
	 * 
	 * member가 delete 하듯이 admin서블릿에서 deleteMember요청을 수행한다. 기존의 Dao 명령을 쓰되 서블릿에서
	 * admin의 역할을 확인하고 진행하도록 한다.
	 * 
	 * 관리자는 admin이고 admin_role은 'A' 와 'B' 등급으로 나뉘며, B등급 관리자는 회원을 삭제할 수 없다.
	 * 
	 */

	// 관리자용 요청처리 DAO

	public int updateMemberRole(Connection conn, Member member) {
		int result = 0;
		PreparedStatement pstmt = null;
		String query = prop.getProperty("updateMemberRole");

		try {
			pstmt = conn.prepareStatement(query);
			pstmt.setString(1, member.getMemberRole());
			pstmt.setString(2, member.getMemberId());
			result = pstmt.executeUpdate();
		} catch (SQLException e) {
			throw new MemberException("회원권한변경 오류!", e);
		} finally {
			close(pstmt);
		}
		return result;
	}

	public int updateMemberValid(Connection conn, Member member) {
		int result = 0;
		PreparedStatement pstmt = null;
		String query = prop.getProperty("updateMemberValid");

		try {
			pstmt = conn.prepareStatement(query);
			pstmt.setString(1, member.getValid());
			pstmt.setString(2, member.getMemberId());
			result = pstmt.executeUpdate();
		} catch (SQLException e) {
			throw new MemberException("회원유효성변경 오류!", e);
		} finally {
			close(pstmt);
		}
		return result;
	}

	public List<Member> searchMember(Connection conn, Map<String, Object> searchParam) {
		PreparedStatement pstmt = null;
		String sql = prop.getProperty("searchMember");
		ResultSet rset = null;
		List<Member> list = new ArrayList<>();

		String searchType = (String) searchParam.get("searchType");

		String searchKeyword = (String) searchParam.get("searchKeyword");

		switch (searchType) {
		case "memberId":
			sql += " member_id like '%" + searchKeyword + "%'";
			break;
		case "memberName":
			sql += " member_name like '%" + searchKeyword + "%'";
			break;
		}
		System.out.println("sql@dao = " + sql);

		try {
			pstmt = conn.prepareStatement(sql);
			rset = pstmt.executeQuery();
			while (rset.next()) {
				Member member = new Member();
				member.setMemberId(rset.getString("member_id"));
				member.setMemberName(rset.getString("member_name"));
				member.setEmail(rset.getString("email"));
				member.setTel(rset.getString("tel"));
				member.setRegDate(rset.getDate("reg_date"));
				member.setMemberRole("member_role");
				list.add(member);
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

	public List<Member> selectAllMember(Connection conn, Map<String, Integer> param) {
		PreparedStatement pstmt = null;
		String sql = prop.getProperty("selectAllMember");
		ResultSet rset = null;
		List<Member> list = new ArrayList<>();
		try {
			// 1.pstmt객체생성
			pstmt = conn.prepareStatement(sql);
			pstmt.setInt(1, param.get("start"));
			pstmt.setInt(2, param.get("end"));

			// 2.실행
			rset = pstmt.executeQuery();
			// 3.rset처리 : 하나의 레코드 -> vo객체하나 -> list에 추가
			while (rset.next()) {
				Member member = new Member(rset.getString("member_id"), rset.getString("password"),
						rset.getString("member_name"), rset.getString("email"), rset.getString("tel"),
						rset.getString("valid"), rset.getDate("reg_date"), rset.getString("member_role"));
				list.add(member);
			}
		} catch (SQLException e) {
			e.printStackTrace();
		} finally {
			close(rset);
			close(pstmt);
		}
		return list;
	}

	public int totalMemberCount(Connection conn) {
		PreparedStatement pstmt = null;
		String sql = prop.getProperty("selectTotalMemberCount");
		ResultSet rset = null;
		int totalCount = 0;
		try {
			pstmt = conn.prepareStatement(sql);
			rset = pstmt.executeQuery();
			if (rset.next())
				totalCount = rset.getInt(1); // 컬럼 인덱스
		} catch (SQLException e) {
			logger.debug(e.getMessage());
			e.printStackTrace();
		} finally {
			close(rset);
			close(pstmt);
		}
		return totalCount;
	}

}

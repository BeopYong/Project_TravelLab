package com.tlab.mvc.member.model.mapper;

import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.ArrayList;
import java.util.HashMap;
import java.util.List;
import java.util.Map;

import com.tlab.mvc.member.model.exception.MemberException;
import com.tlab.mvc.member.model.vo.Member;
import com.tlab.mvc.member.model.vo.MemberDtoTest;

public class MemberMapper {


	public Map<String,String> MemberToColumn(Member member) {
		Map<String,String> map = new HashMap<String,String>();
		
		
		
		return map;
	}

	public List<String> columnToMember(String[] paramValues) {
		MemberDtoTest member = new MemberDtoTest();
		
		List<String> list = new ArrayList<>();
		
		return list;
	}
	
	//ResultSet mapper
	public Member generateMember(ResultSet rset) {
		Member member=null;
		try {
			member = new Member(
								rset.getString("member_id"),
								rset.getString("password"),
								rset.getString("member_name"),
								rset.getString("email"),
								rset.getString("tel"),
								rset.getString("valid"),
								rset.getDate("reg_date"),
								rset.getString("member_role")
							);
		} catch (SQLException e) {
			e.printStackTrace();
			throw new MemberException("조회오류",e);
		}
		return member;
	}
	
	//PreparedStatement mapper
	
	public List<String> keyOfMember(){
		List<String> keyList = new ArrayList<>();
		
		keyList.add("no");
		keyList.add("memberId");
		keyList.add("password");
		keyList.add("memberName");
		keyList.add("email");
		keyList.add("payCode");
		keyList.add("valid");
		keyList.add("regDate");
		
		return keyList;
	}
	
}

package com.tlab.mvc.member.model.mapper;

import java.util.ArrayList;
import java.util.HashMap;
import java.util.List;
import java.util.Map;

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
		for(String str : paramValues)
			list.add(str);
		return list;
	}
	
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

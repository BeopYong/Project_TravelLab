package com.tlab.mvc.admin.model.vo;

import java.sql.Date;
import java.util.Objects;

import com.tlab.mvc.member.model.vo.Member;

public class Admin extends Member{

	/**
	 * 
	 */
	private static final long serialVersionUID = 1L;
	
	
	private String memberRole;


	public Admin() {
		super();
	}


	public Admin(int no, String memberId, String password, String memberName, String email, int payCode, String tel,
			String valid, Date regDate) {
		super(no, memberId, password, memberName, email, payCode, tel, valid, regDate);
	}

	
	public Admin(int no, String memberId, String password, String memberName, String email, int payCode, String tel,
			String valid, Date regDate, String memberRole) {
		super(no, memberId, password, memberName, email, payCode, tel, valid, regDate);
		this.memberRole = memberRole;
	}
	

	public Admin(String memberId, String memberName, int payCode, String email, String tel) {
		super(memberId, memberName, payCode, email, tel);
	}


	public Admin(String memberId, String password, String memberName, String email, int payCode, String tel) {
		super(memberId, password, memberName, email, payCode, tel);
	}


	public Admin(String memberId, String password) {
		super(memberId, password);
	}


	public String getMemberRole() {
		return memberRole;
	}

	public void setMemberRole(String memberRole) {
		this.memberRole = memberRole;
	}


	@Override
	public String toString() {
		return "Admin ["+super.toString()+", memberRole=" + memberRole + "]";
	}

	
		
}

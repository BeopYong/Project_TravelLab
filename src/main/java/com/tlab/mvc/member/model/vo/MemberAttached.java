package com.tlab.mvc.member.model.vo;

import java.io.Serializable;
import java.sql.Date;
import java.util.List;

/**
 * 프로필이 표시되는 멤버 객체 생성 (선택사항)
 * 
 * @author jimmerland
 *
 */

public class MemberAttached extends Member implements Serializable {

	private static final long serialVersionUID = 1L;

	private List<MemberAttachment> memberAttachments;

	public MemberAttached() {
		super();
	}

	public MemberAttached(String id, String password, String userName, String email, int payCode, String tel,
			String valid, Date regDate) {
		super(id, password, userName, email, payCode, tel, valid, regDate);
	}

	public MemberAttached(String id, String password, String userName, String email, int payCode, String tel,
			String valid, Date regDate, List<MemberAttachment> memberAttachments) {
		super(id, password, userName, email, payCode, tel, valid, regDate);
		this.memberAttachments = memberAttachments;
	}

	public List<MemberAttachment> getMemberAttachments() {
		return memberAttachments;
	}

	public void setMemberAttachments(List<MemberAttachment> memberAttachments) {
		this.memberAttachments = memberAttachments;
	}

	public MemberAttached returnInstance(Member member) {
		MemberAttached mAttached = new MemberAttached();
		mAttached.setMemberId(member.getMemberId());
		mAttached.setPassword(member.getPassword());
		mAttached.setTel(member.getTel());
		mAttached.setMemberName(member.getMemberName());
		mAttached.setEmail(member.getEmail());
		return mAttached;
	}

	@Override
	public String toString() {
		return "MemberAttached [mAttachments=" + super.toString() + memberAttachments + "]";
	}

}

package com.tlab.mvc.member.model.vo;

import java.sql.Date;
import java.util.List;

/**
 * 프로필이 표시되는 멤버 객체 생성 (선택사항)
 * @author jimmerland
 *
 */

public class MemberAttached extends Member {

	private List<MemberAttachment> mAttachments;

	public MemberAttached() {
		super();
	}

	public MemberAttached( String id, String password, String userName, String email, int payCode, String tel,
			String valid, Date regDate) {
		super( id, password, userName, email, payCode, tel, valid, regDate);
	}

	public MemberAttached( String id, String password, String userName, String email, int payCode, String tel,
			String valid, Date regDate, List<MemberAttachment> mAttachments) {
		super( id, password, userName, email, payCode, tel, valid, regDate);
		this.mAttachments = mAttachments;
	}

	public List<MemberAttachment> getmAttachments() {
		return mAttachments;
	}

	public void setmAttachments(List<MemberAttachment> mAttachments) {
		this.mAttachments = mAttachments;
	}

	@Override
	public String toString() {
		return "MemberAttached [mAttachments=" + super.toString() + mAttachments + "]";
	}

}

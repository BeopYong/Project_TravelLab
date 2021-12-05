package com.tlab.mvc.member.model.vo;

import java.util.Objects;

import com.tlab.mvc.common.Attachment;

/**
 * 프로필 사진 파일용 (선택사항)
 * 
 * @author jimmerland
 */

public class MemberAttachment extends Attachment {


	private static final long serialVersionUID = 1L;

	private String memberId;

	public MemberAttachment() {
		super();
		// TODO Auto-generated constructor stub
	}

	public MemberAttachment(int no, String originalFilename, String renamedFilename) {
		super(no, originalFilename, renamedFilename);
	}

	public MemberAttachment(String originalFilename, String renamedFilename) {
		super(originalFilename, renamedFilename);
	}

	public MemberAttachment(String originalFilename, String renamedFilename, String memberId) {
		super(originalFilename, renamedFilename);
		this.memberId = memberId;
	}

	public MemberAttachment(int no, String originalFilename, String renamedFilename, String memberId) {
		super(no, originalFilename, renamedFilename);
		this.memberId = memberId;
	}

	@Override
	public int getNo() {
		// TODO Auto-generated method stub
		return super.getNo();
	}
	
	@Override
	public void setNo(int no) {
		// TODO Auto-generated method stub
		super.setNo(no);
	}

	@Override
	public String getOriginalFilename() {
		// TODO Auto-generated method stub
		return super.getOriginalFilename();
	}

	@Override
	public void setOriginalFilename(String originalFilename) {
		// TODO Auto-generated method stub
		super.setOriginalFilename(originalFilename);
	}

	@Override
	public String getRenamedFilename() {
		// TODO Auto-generated method stub
		return super.getRenamedFilename();
	}

	@Override
	public void setRenamedFilename(String renamedFilename) {
		// TODO Auto-generated method stub
		super.setRenamedFilename(renamedFilename);
	}

	@Override
	public int hashCode() {
		final int prime = 31;
		int result = super.hashCode();
		result = prime * result + Objects.hash(memberId);
		return result;
	}

	@Override
	public boolean equals(Object obj) {
		if (this == obj) {
			return true;
		}
		if (!super.equals(obj)) {
			return false;
		}
		if (!(obj instanceof MemberAttachment)) {
			return false;
		}
		MemberAttachment other = (MemberAttachment) obj;
		return Objects.equals(memberId, other.memberId);
	}

	public String getMemberId() {
		return memberId;
	}

	public void setMemberId(String memberId) {
		this.memberId = memberId;
	}

	@Override
	public String toString() {
		return "MemberAttachment [" + super.toString() + ", memberId=" + memberId + "]";
	}

}

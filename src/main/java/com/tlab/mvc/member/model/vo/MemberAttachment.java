package com.tlab.mvc.member.model.vo;

import java.io.Serializable;


/**
 * 프로필 사진 파일용 (선택사항)
 * @author jimmerland
 */

public class MemberAttachment implements Serializable {

	
	private static final long serialVersionUID = 1L;

	private int no;
	private String userId;
	private String oFileName; //original
	private String rFileName; //renamed

	public MemberAttachment() {
		super();
	}

	public MemberAttachment(int no, String userId, String oFileName, String rFileName) {
		super();
		this.no = no;
		this.userId = userId;
		this.oFileName = oFileName;
		this.rFileName = rFileName;
	}

	public int getNo() {
		return no;
	}

	public void setNo(int no) {
		this.no = no;
	}

	public String getUserId() {
		return userId;
	}

	public void setUserId(String userId) {
		this.userId = userId;
	}

	public String getoFileName() {
		return oFileName;
	}

	public void setoFileName(String oFileName) {
		this.oFileName = oFileName;
	}

	public String getrFileName() {
		return rFileName;
	}

	public void setrFileName(String rFileName) {
		this.rFileName = rFileName;
	}

	public static long getSerialversionuid() {
		return serialVersionUID;
	}

	@Override
	public String toString() {
		return "MemberAttachment [no=" + no + ", userId=" + userId + ", oFileName=" + oFileName + ", rFileName="
				+ rFileName + "]";
	}

}

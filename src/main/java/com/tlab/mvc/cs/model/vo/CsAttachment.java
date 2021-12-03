package com.tlab.mvc.cs.model.vo;

import java.io.Serializable;

public class CsAttachment implements Serializable {

	private static final long serialVersionUID = 1L;
	
	private int no;
	private int csBoardno;
	private String originalFilename;
	private String renamedFilename;
	
	public CsAttachment() {
		super();
	}

	public CsAttachment(int no, int csBoardno, String originalFilename, String renamedFilename) {
		super();
		this.no = no;
		this.csBoardno = csBoardno;
		this.originalFilename = originalFilename;
		this.renamedFilename = renamedFilename;
	}

	public int getNo() {
		return no;
	}

	public void setNo(int no) {
		this.no = no;
	}

	public int getCsBoardno() {
		return csBoardno;
	}

	public void setCsBoardno(int csBoardno) {
		this.csBoardno = csBoardno;
	}

	public String getOriginalFilename() {
		return originalFilename;
	}

	public void setOriginalFilename(String originalFilename) {
		this.originalFilename = originalFilename;
	}

	public String getRenamedFilename() {
		return renamedFilename;
	}

	public void setRenamedFilename(String renamedFilename) {
		this.renamedFilename = renamedFilename;
	}

	@Override
	public String toString() {
		return "Attachment [no=" + no + ", csBoardno=" + csBoardno + ", originalFilename=" + originalFilename
				+ ", renamedFilename=" + renamedFilename + "]";
	}
}

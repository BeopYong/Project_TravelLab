package com.tlab.mvc.cs.model.vo;

import java.io.Serializable;

import com.tlab.mvc.common.Attachment;

public class CsAttachment extends Attachment {

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

	public String getOriginal_filename() {
		return originalFilename;
	}

	public void setOriginal_filename(String originalFilename) {
		this.originalFilename = originalFilename;
	}

	public String getRenamed_filename() {
		return renamedFilename;
	}

	public void setRenamed_filename(String renamed_filename) {
		this.renamedFilename = renamed_filename;
	}

	@Override
	public String toString() {
		return "CsAttachment [no=" + no + ", csBoardno=" + csBoardno + ", originalFilename=" + originalFilename
				+ ", renamedFilename=" + renamedFilename + "]";
	}

}
